/*
 * Copyright (c) 2023 Juan Manuel Cruz <jcruz@fi.uba.ar> <jcruz@frba.utn.edu.ar>.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 *
 * @file   : task_normal.c
 * @date   : Set 26, 2023
 * @author : Juan Manuel Cruz <jcruz@fi.uba.ar> <jcruz@frba.utn.edu.ar>
 * @version	v1.0.0
 */

/********************** inclusions *******************************************/
/* Project includes. */

#include "main.h"

/* Demo includes. */
#include "logger.h"
#include "dwt.h"

/* Application & Tasks includes. */
#include "board.h"
#include "app.h"

#include "display.h"

#include "task_normal_attribute.h"
#include "task_normal_interface.h"

#include "task_actuator_attribute.h"
#include "task_actuator_interface.h"

/********************** macros and definitions *******************************/
#define G_TASK_SYS_CNT_INI			0ul
#define G_TASK_SYS_TICK_CNT_INI		0ul

/********************** internal data declaration ****************************/

task_normal_dta_t task_normal_dta ={0, ST_SYS_02_IDLE, EV_SYS_02_IDLE, false, false, false, 0};

/********************** internal functions declaration ***********************/

/********************** internal data definition *****************************/
const char *p_task_normal 		= "Task System (System Statechart)";
const char *p_task_normal_ 		= "Non-Blocking & Update By Time Code";
bool timer = false;


/********************** external data declaration ****************************/
uint32_t g_task_normal_cnt;
volatile uint32_t g_task_normal_tick_cnt;

/********************** external functions definition ************************/
void task_normal_init(void *parameters)
{
	task_normal_dta_t 	*p_task_normal_dta;
	task_normal_st_t	state;
	task_normal_ev_t	event;
	bool b_event;

	/* Print out: Task Initialized */
	LOGGER_LOG("  %s is running - %s\r\n", GET_NAME(task_normal_init), p_task_normal);
	LOGGER_LOG("  %s is a %s\r\n", GET_NAME(task_normal), p_task_normal_);

	g_task_normal_cnt = G_TASK_SYS_CNT_INI;

	/* Print out: Task execution counter */
	LOGGER_LOG("   %s = %lu\r\n", GET_NAME(g_task_normal_cnt), g_task_normal_cnt);

	init_queue_event_task_normal();

	p_task_normal_dta = &task_normal_dta;

	/* Print out: Task execution FSM */
	state = p_task_normal_dta->state;
	LOGGER_LOG("   %s = %lu", GET_NAME(state), (uint32_t)state);

	event = p_task_normal_dta->event;
	LOGGER_LOG("   %s = %lu", GET_NAME(event), (uint32_t)event);

	b_event = p_task_normal_dta->flag;
	LOGGER_LOG("   %s = %s\r\n", GET_NAME(b_event), (b_event ? "true" : "false"));

	g_task_normal_tick_cnt = G_TASK_SYS_TICK_CNT_INI;

}

void task_normal_update(void *parameters)
{
	task_normal_dta_t *p_task_normal_dta;
	bool b_time_update_required = false;
	/* Update Task System Counter */
	g_task_normal_cnt++;

	/* Protect shared resource (g_task_normal_tick) */
	__asm("CPSID i");	/* disable interrupts*/
    if (G_TASK_SYS_TICK_CNT_INI < g_task_normal_tick_cnt)
    {
    	g_task_normal_tick_cnt--;
    	b_time_update_required = true;
    }
    __asm("CPSIE i");	/* enable interrupts*/

    while (b_time_update_required)
    {
		/* Protect shared resource (g_task_normal_tick) */
		__asm("CPSID i");	/* disable interrupts*/
		if (G_TASK_SYS_TICK_CNT_INI < g_task_normal_tick_cnt)
		{
			g_task_normal_tick_cnt--;
			b_time_update_required = true;
		}
		else
		{
			b_time_update_required = false;
		}
		__asm("CPSIE i");	/* enable interrupts*/



		/* Update Task System Configuration & Data Pointer */
		p_task_normal_dta = &task_normal_dta;


		if (true == any_event_task_normal())
		{
			p_task_normal_dta->flag = true;
			p_task_normal_dta->event = get_event_task_normal();
			if(p_task_normal_dta->event == NOEVENT_02)
				p_task_normal_dta->flag = false;
			else{
				timer = false;
			}
		}

		if(p_task_normal_dta->flag == false && timer == false){
			return;
		}

		switch (p_task_normal_dta->state)
		{

			case ST_SYS_02_IDLE:

				if(p_task_normal_dta->event == EV_SYS_02_SELECT && set_up_mode == false){
					displayCharPositionWrite(p_task_normal_dta->select*9, 0);
					displayStringWrite(" ");
					p_task_normal_dta->select = (((p_task_normal_dta->select) + 1) % 2);
					displayCharPositionWrite(p_task_normal_dta->select*9, 0);
					displayStringWrite(">");
				}

				if(p_task_normal_dta->event == EV_SYS_02_CONFIG && set_up_mode == false){

					switch (p_task_normal_dta -> select){

						case 0:

							put_event_task_actuator(EV_ACT_XX_ON, ID_ACT_05);
							displayClean(0);
							displayClean(1);
							p_task_normal_dta->state = ST_SYS_02_CLOSED;
							LOGGER_LOG("Normal - Closed\n");

							break;

						case 1:
							break;
					}
				}

				break;

			case ST_SYS_02_CLOSED:

				if(p_task_normal_dta->event == EV_SYS_02_CONFIG){
					put_event_task_actuator(EV_ACT_XX_OFF, ID_ACT_05);
					p_task_normal_dta->state = ST_SYS_02_IDLE;
					p_task_normal_dta->select=0;
					displayClean(0);
					displayClean(1);
				    displayCharPositionWrite(0,0);
					displayStringWrite(">");
					displayCharPositionWrite(1,0);
					displayStringWrite("Normal");
					displayCharPositionWrite(10,0);
					displayStringWrite("Set_Up");
					set_up_mode = true;

				}

				if (p_task_normal_dta->event == EV_SYS_02_EXTERIOR || p_task_normal_dta->event == EV_SYS_02_MANUAL)
				{
					put_event_task_actuator(EV_ACT_XX_BLINK, ID_ACT_02);
					put_event_task_actuator(EV_ACT_XX_ON, ID_ACT_04);
					put_event_task_actuator(EV_ACT_XX_OFF, ID_ACT_05);
					p_task_normal_dta->state = ST_SYS_02_OPENING;
				}

				break;

			case ST_SYS_02_OPENING:

				if(p_task_normal_dta->event == EV_SYS_02_CONFIG){
					put_event_task_actuator(EV_ACT_XX_NOBLINK, ID_ACT_02);
					put_event_task_actuator(EV_ACT_XX_OFF, ID_ACT_04);
					p_task_normal_dta->state = ST_SYS_02_IDLE;
					p_task_normal_dta -> select = 0;
					displayClean(0);
					displayClean(1);
				    displayCharPositionWrite(0,0);
					displayStringWrite(">");
					displayCharPositionWrite(1,0);
					displayStringWrite("Normal");
					displayCharPositionWrite(10,0);
					displayStringWrite("Set_Up");
					set_up_mode = true;

				}

				if(p_task_normal_dta->event == EV_SYS_02_MANUAL){
					put_event_task_actuator(EV_ACT_XX_ON, ID_ACT_05);
					put_event_task_actuator(EV_ACT_XX_NOBLINK, ID_ACT_02);
					put_event_task_actuator(EV_ACT_XX_OFF, ID_ACT_04);
					p_task_normal_dta->state = ST_SYS_02_CLOSED;
				}

				if(p_task_normal_dta->event == EV_SYS_02_OPEN){
					LOGGER_LOG("Hola");
					put_event_task_actuator(EV_ACT_XX_NOBLINK, ID_ACT_02);
					p_task_normal_dta->tick = wait_time;
					timer = true;
					p_task_normal_dta->state = ST_SYS_02_OPENED;
				}
				break;

			case ST_SYS_02_OPENED:

				if((p_task_normal_dta->tick == 0) && (p_task_normal_dta -> detected == false)){
					put_event_task_actuator(EV_ACT_XX_BLINK, ID_ACT_03);
					p_task_normal_dta->state = ST_SYS_02_CLOSING;
					timer = false;
				}

				if(p_task_normal_dta->tick == 0 && p_task_normal_dta -> detected == true && p_task_normal_dta -> alarm_on == false){
					LOGGER_LOG("Alarma\n");
					put_event_task_actuator(EV_ACT_XX_BLINK, ID_ACT_01);
					p_task_normal_dta->alarm_on = true;
					p_task_normal_dta->tick = stay_time;
					timer = true;
				}

				if(p_task_normal_dta->tick == 0 && p_task_normal_dta -> detected == true && p_task_normal_dta -> alarm_on == true){
					LOGGER_LOG("Te moriste\n");
					put_event_task_actuator(EV_ACT_XX_NOBLINK, ID_ACT_01);
					put_event_task_actuator(EV_ACT_XX_ON, ID_ACT_01);
				}


				if(p_task_normal_dta->event == EV_SYS_02_NODETECTED && p_task_normal_dta->alarm_on == true){
					put_event_task_actuator(EV_ACT_XX_NOBLINK, ID_ACT_01);
					p_task_normal_dta->alarm_on = false;
					p_task_normal_dta->tick = wait_time;
					timer = true;
				}

				if(p_task_normal_dta->event == EV_SYS_02_DETECTED && p_task_normal_dta->detected == false){
					LOGGER_LOG("Detectado\n");
					p_task_normal_dta->detected = true;
					timer = true;
				}

				if(p_task_normal_dta->event == EV_SYS_02_NODETECTED && p_task_normal_dta->detected == true){
					p_task_normal_dta->detected = false;
					timer = true;
				}

				if(p_task_normal_dta->event == EV_SYS_02_MANUAL){
					put_event_task_actuator(EV_ACT_XX_BLINK, ID_ACT_03);
					p_task_normal_dta->state = ST_SYS_02_CLOSING;
					timer = false;
				}

				if(p_task_normal_dta->event == EV_SYS_02_CONFIG){
					if(p_task_normal_dta -> detected == true){
						p_task_normal_dta -> detected = false;
						put_event_task_actuator(EV_ACT_XX_NOBLINK, ID_ACT_01);
					}
					timer = false;
					put_event_task_actuator(EV_ACT_XX_OFF, ID_ACT_04);
					p_task_normal_dta->state = ST_SYS_02_IDLE;
					p_task_normal_dta -> select = 0;
					displayClean(0);
					displayClean(1);
				    displayCharPositionWrite(0,0);
					displayStringWrite(">");
					displayCharPositionWrite(1,0);
					displayStringWrite("Normal");
					displayCharPositionWrite(10,0);
					displayStringWrite("Set_Up");
					set_up_mode = true;

				}

				if(p_task_normal_dta->tick > 0 && timer == true){
					p_task_normal_dta->tick--;
				}

				break;

			case ST_SYS_02_CLOSING:

				if(p_task_normal_dta->event == EV_SYS_02_DETECTED){
					put_event_task_actuator(EV_ACT_XX_NOBLINK, ID_ACT_03);
					p_task_normal_dta->tick = stay_time;
					p_task_normal_dta->detected = true;
					p_task_normal_dta->state = ST_SYS_02_OPENED;
				}

				if(p_task_normal_dta->event == EV_SYS_02_MANUAL){
					put_event_task_actuator(EV_ACT_XX_BLINK, ID_ACT_03);
					p_task_normal_dta->tick = stay_time;
					p_task_normal_dta->state = ST_SYS_02_OPENED;
				}

				if(p_task_normal_dta->event == EV_SYS_02_CONFIG){
					put_event_task_actuator(EV_ACT_XX_NOBLINK, ID_ACT_03);
					put_event_task_actuator(EV_ACT_XX_OFF, ID_ACT_04);
					p_task_normal_dta->state = ST_SYS_02_IDLE;
					p_task_normal_dta -> select = 0;
					displayClean(0);
					displayClean(1);
				    displayCharPositionWrite(0,0);
					displayStringWrite(">");
					displayCharPositionWrite(1,0);
					displayStringWrite("Normal");
					displayCharPositionWrite(10,0);
					displayStringWrite("Set_Up");
					set_up_mode = true;

				}

				if(p_task_normal_dta->event == EV_SYS_02_CLOSE){
					put_event_task_actuator(EV_ACT_XX_NOBLINK, ID_ACT_03);
					put_event_task_actuator(EV_ACT_XX_OFF, ID_ACT_04);
					put_event_task_actuator(EV_ACT_XX_ON, ID_ACT_05);
					p_task_normal_dta->state = ST_SYS_02_CLOSED;
				}
				break;

			default:
				break;
		}
		p_task_normal_dta -> flag = false;
    }
}

/********************** end of file ******************************************/

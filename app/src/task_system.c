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
 * @file   : task_system.c
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
#include "task_system_attribute.h"
#include "task_system_interface.h"
#include "task_actuator_attribute.h"
#include "task_actuator_interface.h"

/********************** macros and definitions *******************************/
#define G_TASK_SYS_CNT_INI			0ul
#define G_TASK_SYS_TICK_CNT_INI		0ul

/********************** internal data declaration ****************************/

uint32_t DEL_SYS_02_WAIT_TIME = 500;
uint32_t DEL_SYS_02_STAY_TIME = 100;

task_system_dta_t task_system_dta_list[] ={
	{0, ST_SYS_01_IDLE, EV_SYS_01_IDLE, false, false, 0, 0, 0},
	{0, ST_SYS_02_IDLE, EV_SYS_02_IDLE, false, false, 0, 0, 0}
};

#define SYSTEM_DTA_QTY	(sizeof(task_system_dta)/sizeof(task_system_dta_t))

/********************** internal functions declaration ***********************/

/********************** internal data definition *****************************/
const char *p_task_system 		= "Task System (System Statechart)";
const char *p_task_system_ 		= "Non-Blocking & Update By Time Code";

/********************** external data declaration ****************************/
uint32_t g_task_system_cnt;
volatile uint32_t g_task_system_tick_cnt;

/********************** external functions definition ************************/
void task_system_init(void *parameters)
{
	uint32_t index;
	task_system_dta_t 	*p_task_system_dta;
	task_system_st_t	state;
	task_system_ev_t	event;
	bool b_event;

	/* Print out: Task Initialized */
	LOGGER_LOG("  %s is running - %s\r\n", GET_NAME(task_system_init), p_task_system);
	LOGGER_LOG("  %s is a %s\r\n", GET_NAME(task_system), p_task_system_);

	g_task_system_cnt = G_TASK_SYS_CNT_INI;

	/* Print out: Task execution counter */
	LOGGER_LOG("   %s = %lu\r\n", GET_NAME(g_task_system_cnt), g_task_system_cnt);

	init_queue_event_task_system();


	for (index = 0; SYSTEM_DTA_QTY > index; index++)
	{
		/* Update Task Sensor Data Pointer */
		p_task_system_dta = &task_system_dta_list[index];
	}

	/* Update Task Actuator Configuration & Data Pointer */


	/* Print out: Task execution FSM */
	state = p_task_system_dta->state;
	LOGGER_LOG("   %s = %lu", GET_NAME(state), (uint32_t)state);

	event = p_task_system_dta->event;
	LOGGER_LOG("   %s = %lu", GET_NAME(event), (uint32_t)event);

	b_event = p_task_system_dta->flag;
	LOGGER_LOG("   %s = %s\r\n", GET_NAME(b_event), (b_event ? "true" : "false"));

	g_task_system_tick_cnt = G_TASK_SYS_TICK_CNT_INI;
}

void task_system_update(void *parameters)
{
	uint32_t index;
	task_system_dta_t *p_task_system_dta;
	bool b_time_update_required = false;

	/* Update Task System Counter */
	g_task_system_cnt++;

	/* Protect shared resource (g_task_system_tick) */
	__asm("CPSID i");	/* disable interrupts*/
    if (G_TASK_SYS_TICK_CNT_INI < g_task_system_tick_cnt)
    {
    	g_task_system_tick_cnt--;
    	b_time_update_required = true;
    }
    __asm("CPSIE i");	/* enable interrupts*/

    while (b_time_update_required)
    {
		/* Protect shared resource (g_task_system_tick) */
		__asm("CPSID i");	/* disable interrupts*/
		if (G_TASK_SYS_TICK_CNT_INI < g_task_system_tick_cnt)
		{
			g_task_system_tick_cnt--;
			b_time_update_required = true;
		}
		else
		{
			b_time_update_required = false;
		}
		__asm("CPSIE i");	/* enable interrupts*/


    	for (index = 0; SYSTEM_DTA_QTY > index; index++)
		{
    		/* Update Task System Configuration & Data Pointer */
			p_task_system_dta = &task_system_dta_list[index];


			if (true == any_event_task_system())
			{
				p_task_system_dta->flag = true;
				p_task_system_dta->event = get_event_task_system();
			}

			switch (p_task_system_dta->state)
			{

				case ST_SYS_01_IDLE:

					if ((p_task_system_dta->mode == true) && (p_task_system_dta->event == EV_SYS_01_CONFIG))
					{
						p_task_system_dta->state = ST_SYS_01_MENU;
						p_task_system_dta -> index = 0;
						p_task_system_dta -> select = 0;
					}
					break;

				case ST_SYS_01_MENU:

					if(p_task_system_dta->event == EV_SYS_01_SELECT){
						p_task_system_dta->select = ((p_task_system_dta->select + 1) % 3);
					}

					if(p_task_system_dta->event == EV_SYS_01_CONFIG){

						switch (p_task_system_dta -> select){

							case 0:
								p_task_system_dta -> submenu = p_task_system_dta->index;
								p_task_system_dta -> index = 0;
								p_task_system_dta -> select = 0;
								p_task_system_dta -> state = ST_SYS_01_PARAMS;
								break;

							case 1:
								p_task_system_dta->index = ((p_task_system_dta->index + 1) % 2);
								break;

							case 2:
								p_task_system_dta -> state = ST_SYS_01_IDLE;
								p_task_system_dta -> mode = false;
								break;

						}
					}

					break;

				case ST_SYS_01_PARAMS:

					switch(p_task_system_dta -> submenu){

						case 0:
							p_task_system_dta -> state = ST_SYS_01_WAIT_TIME;
							break;


						case 1:
							p_task_system_dta -> state = ST_SYS_01_STAY_TIME;
							break;
					}

					break;

				case ST_SYS_01_WAIT_TIME:

					if(p_task_system_dta->event == EV_SYS_01_SELECT){
						p_task_system_dta->select = ((p_task_system_dta->select + 1) % 3);
					}

					if(p_task_system_dta->event == EV_SYS_01_CONFIG){

						switch (p_task_system_dta -> select){

							case 0:
								DEL_SYS_02_WAIT_TIME = (p_task_system_dta -> index) * 10;
								p_task_system_dta -> submenu = 0;
								p_task_system_dta -> index = 0;
								p_task_system_dta -> select = 0;
								p_task_system_dta -> state = ST_SYS_01_MENU;
								break;

							case 1:
								p_task_system_dta->index = ((p_task_system_dta->index + 1) % 10);
								break;

							case 2:
								p_task_system_dta -> state = ST_SYS_01_IDLE;
								p_task_system_dta -> mode = false;
								break;

						}
					}

					break;

				case ST_SYS_01_STAY_TIME:

					if(p_task_system_dta->event == EV_SYS_01_SELECT){
						p_task_system_dta->select = ((p_task_system_dta->select + 1) % 3);
					}

					if(p_task_system_dta->event == EV_SYS_01_CONFIG){

						switch (p_task_system_dta -> select){

							case 0:
								DEL_SYS_02_STAY_TIME = (p_task_system_dta -> index) * 10;
								p_task_system_dta -> submenu = 0;
								p_task_system_dta -> index = 0;
								p_task_system_dta -> select = 0;
								p_task_system_dta -> state = ST_SYS_01_MENU;
								break;

							case 1:
								p_task_system_dta->index = ((p_task_system_dta->index + 1) % 10);
								break;

							case 2:
								p_task_system_dta -> state = ST_SYS_01_IDLE;
								p_task_system_dta -> mode = false;
								break;

						}
					}

					break;

				case ST_SYS_02_IDLE:

					if ((p_task_system_dta->mode == false) && (p_task_system_dta->event == EV_SYS_01_CONFIG))
					{
						put_event_task_actuator(EV_ACT_XX_ON, ID_ACT_05);
						p_task_system_dta->state = ST_SYS_02_CLOSED;
					}

					break;

				case ST_SYS_02_CLOSED:

					if(p_task_system_dta->event == EV_SYS_01_CONFIG){
						p_task_system_dta->mode = true;
						put_event_task_actuator(EV_ACT_XX_OFF, ID_ACT_05);
						p_task_system_dta->state = ST_SYS_02_CLOSED;
					}

					if (p_task_system_dta->event == EV_SYS_02_EXTERIOR && p_task_system_dta->event == EV_SYS_02_MANUAL)
					{
						put_event_task_actuator(EV_ACT_XX_BLINK, ID_ACT_02);
						put_event_task_actuator(EV_ACT_XX_ON, ID_ACT_04);
						put_event_task_actuator(EV_ACT_XX_OFF, ID_ACT_05);
						p_task_system_dta->state = ST_SYS_02_OPENING;
					}

					break;

				case ST_SYS_02_OPENING:

					if(p_task_system_dta->event == EV_SYS_01_CONFIG){
						put_event_task_actuator(EV_ACT_XX_NOBLINK, ID_ACT_02);
						put_event_task_actuator(EV_ACT_XX_OFF, ID_ACT_04);
						p_task_system_dta->state = ST_SYS_02_CLOSED;
					}

					if(p_task_system_dta->event == EV_SYS_02_MANUAL){
						put_event_task_actuator(EV_ACT_XX_ON, ID_ACT_05);
						put_event_task_actuator(EV_ACT_XX_NOBLINK, ID_ACT_02);
						put_event_task_actuator(EV_ACT_XX_OFF, ID_ACT_04);
						p_task_system_dta->state = ST_SYS_02_CLOSED;
					}

					if(p_task_system_dta->event == EV_SYS_01_CONFIG){
						put_event_task_actuator(EV_ACT_XX_NOBLINK, ID_ACT_02);
						put_event_task_actuator(EV_ACT_XX_OFF, ID_ACT_04);
						p_task_system_dta->mode = true;
						p_task_system_dta->state = ST_SYS_02_IDLE;
					}

					if(p_task_system_dta->event == EV_SYS_02_OPEN){
						put_event_task_actuator(EV_ACT_XX_NOBLINK, ID_ACT_02);
						p_task_system_dta->tick = DEL_SYS_02_WAIT_TIME;
					}
					break;

				case ST_SYS_02_OPENED:

					if(p_task_system_dta->tick > 0){
						p_task_system_dta->tick--;
					}

					if(p_task_system_dta->tick == 0 && p_task_system_dta -> flag == false){
						put_event_task_actuator(EV_ACT_XX_BLINK, ID_ACT_03);
						p_task_system_dta->state = ST_SYS_02_CLOSING;
					}

					if(p_task_system_dta->tick == 0 && p_task_system_dta -> flag == true){
						put_event_task_actuator(EV_ACT_XX_BLINK, ID_ACT_01);
						p_task_system_dta->flag = false;
						p_task_system_dta->tick = DEL_SYS_02_STAY_TIME;
						p_task_system_dta->state = ST_SYS_02_CLOSING;
					}

					if(p_task_system_dta->event == EV_SYS_02_NODETECTED && p_task_system_dta->flag == false){
						put_event_task_actuator(EV_ACT_XX_NOBLINK, ID_ACT_01);
						p_task_system_dta->tick = DEL_SYS_02_WAIT_TIME;
					}

					if(p_task_system_dta->event == EV_SYS_02_MANUAL){
						put_event_task_actuator(EV_ACT_XX_BLINK, ID_ACT_03);
						p_task_system_dta->state = ST_SYS_02_CLOSING;
					}

					if(p_task_system_dta->event == EV_SYS_02_DETECTED && p_task_system_dta->flag == false){
						p_task_system_dta->flag = true;
					}

					if(p_task_system_dta->event == EV_SYS_02_NODETECTED && p_task_system_dta->flag == true){
						p_task_system_dta->flag = false;
					}

					if(p_task_system_dta->event == EV_SYS_02_MANUAL){
						put_event_task_actuator(EV_ACT_XX_BLINK, ID_ACT_03);
						p_task_system_dta->state = ST_SYS_02_CLOSING;
					}

					if(p_task_system_dta->event == EV_SYS_01_CONFIG){
						if(p_task_system_dta -> flag == true){
							p_task_system_dta -> flag = false;
							put_event_task_actuator(EV_ACT_XX_NOBLINK, ID_ACT_01);
						}
						put_event_task_actuator(EV_ACT_XX_OFF, ID_ACT_04);
						p_task_system_dta->mode = true;
						p_task_system_dta->state = ST_SYS_02_IDLE;
					}

					break;

				case ST_SYS_02_CLOSING:

					if(p_task_system_dta->event == EV_SYS_02_DETECTED){
						put_event_task_actuator(EV_ACT_XX_NOBLINK, ID_ACT_03);
						p_task_system_dta->tick = DEL_SYS_02_STAY_TIME;
						p_task_system_dta->flag = true;
						p_task_system_dta->state = ST_SYS_02_OPENED;
					}

					if(p_task_system_dta->event == EV_SYS_02_MANUAL){
						put_event_task_actuator(EV_ACT_XX_BLINK, ID_ACT_03);
						p_task_system_dta->tick = DEL_SYS_02_STAY_TIME;
						p_task_system_dta->state = ST_SYS_02_OPENED;
					}

					if(p_task_system_dta->event == EV_SYS_01_CONFIG){
						put_event_task_actuator(EV_ACT_XX_NOBLINK, ID_ACT_03);
						put_event_task_actuator(EV_ACT_XX_OFF, ID_ACT_04);
						p_task_system_dta->state = ST_SYS_02_IDLE;
						p_task_system_dta->mode = true;
					}

					if(p_task_system_dta->event == EV_SYS_02_CLOSE){
						put_event_task_actuator(EV_ACT_XX_NOBLINK, ID_ACT_03);
						put_event_task_actuator(EV_ACT_XX_OFF, ID_ACT_04);
						put_event_task_actuator(EV_ACT_XX_ON, ID_ACT_05);
					}
					break;

				default:

					break;
			}
		}
    }
}

/********************** end of file ******************************************/

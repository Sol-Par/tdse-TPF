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
#include "task_set_up_attribute.h"
#include "task_set_up_interface.h"
#include "task_actuator_attribute.h"
#include "task_actuator_interface.h"

/********************** macros and definitions *******************************/
#define G_TASK_SYS_CNT_INI			0ul
#define G_TASK_SYS_TICK_CNT_INI		0ul

/********************** internal data declaration ****************************/
uint32_t stay_time;
uint32_t wait_time;

task_set_up_dta_t task_set_up_dta = {ST_SYS_01_IDLE, EV_SYS_01_IDLE, 0, 0, 0};

/********************** internal functions declaration ***********************/

/********************** internal data definition *****************************/
const char *p_task_system 		= "Task System (System Statechart)";
const char *p_task_system_ 		= "Non-Blocking & Update By Time Code";

/********************** external data declaration ****************************/
uint32_t g_task_set_up_cnt;
volatile uint32_t g_task_set_up_tick_cnt;

/********************** external functions definition ************************/
void task_set_up_init(void *parameters)
{
	task_set_up_dta_t 	*p_task_set_up_dta;
	task_set_up_st_t	state;
	task_set_up_ev_t	event;
	bool b_event;

	/* Print out: Task Initialized */
	LOGGER_LOG("  %s is running - %s\r\n", GET_NAME(task_system_init), p_task_system);
	LOGGER_LOG("  %s is a %s\r\n", GET_NAME(task_system), p_task_system_);

	g_task_set_up_cnt = G_TASK_SYS_CNT_INI;

	/* Print out: Task execution counter */
	LOGGER_LOG("   %s = %lu\r\n", GET_NAME(g_task_set_up_cnt), g_task_set_up_cnt);

	init_queue_event_task_set_up();

	/* Update Task Sensor Data Pointer */
	p_task_set_up_dta = &task_set_up_dta;


	/* Update Task Actuator Configuration & Data Pointer */


	/* Print out: Task execution FSM */
	state = p_task_set_up_dta->state;
	LOGGER_LOG("   %s = %lu", GET_NAME(state), (uint32_t)state);

	event = p_task_set_up_dta->event;
	LOGGER_LOG("   %s = %lu", GET_NAME(event), (uint32_t)event);

	b_event = p_task_set_up_dta->flag;
	LOGGER_LOG("   %s = %s\r\n", GET_NAME(b_event), (b_event ? "true" : "false"));

	g_task_set_up_tick_cnt = G_TASK_SYS_TICK_CNT_INI;
}

void task_set_up_update(void *parameters)
{
	task_set_up_dta_t *p_task_set_up_dta;
	bool b_time_update_required = false;

	/* Update Task System Counter */
	g_task_set_up_cnt++;

	/* Protect shared resource (g_task_system_tick) */
	__asm("CPSID i");	/* disable interrupts*/
    if (G_TASK_SYS_TICK_CNT_INI < g_task_set_up_tick_cnt)
    {
    	g_task_set_up_tick_cnt--;
    	b_time_update_required = true;
    }
    __asm("CPSIE i");	/* enable interrupts*/

    while (b_time_update_required)
    {
		/* Protect shared resource (g_task_system_tick) */
		__asm("CPSID i");	/* disable interrupts*/
		if (G_TASK_SYS_TICK_CNT_INI < g_task_set_up_tick_cnt)
		{
			g_task_set_up_tick_cnt--;
			b_time_update_required = true;
		}
		else
		{
			b_time_update_required = false;
		}
		__asm("CPSIE i");	/* enable interrupts*/


		/* Update Task System Configuration & Data Pointer */
		p_task_set_up_dta = &task_set_up_dta;


		if (true == any_event_task_set_up())
		{
			p_task_set_up_dta->flag = true;
			p_task_set_up_dta->event = get_event_task_set_up();
			if(p_task_set_up_dta->event == NOEVENT_01)
				p_task_set_up_dta->flag = false;
		}
		else{
			p_task_set_up_dta->flag = false;
			return;
		}

		switch (p_task_set_up_dta->state)
		{

			case ST_SYS_01_IDLE:

				if ((p_task_set_up_dta->event == EV_SYS_01_CONFIG) && (set_up_mode == true))
				{
					p_task_set_up_dta->state = ST_SYS_01_MENU;
					p_task_set_up_dta -> index = 0;
					p_task_set_up_dta -> select = 0;
					LOGGER_LOG("Setup - Menu\n");
				}
				break;

			case ST_SYS_01_MENU:

				if(p_task_set_up_dta->event == EV_SYS_01_SELECT){
					p_task_set_up_dta->select = (((p_task_set_up_dta->select) + 1) % 3);
					LOGGER_LOG("Setup - Select - %ld\n", p_task_set_up_dta->select);
				}

				if(p_task_set_up_dta->event == EV_SYS_01_CONFIG){

					switch (p_task_set_up_dta -> select){

						case 0:
							p_task_set_up_dta -> submenu = p_task_set_up_dta->index;
							p_task_set_up_dta -> index = 0;
							p_task_set_up_dta -> select = 0;
							p_task_set_up_dta -> state = ST_SYS_01_PARAMS;
							LOGGER_LOG("Setup - Params\n");
							break;

						case 1:
							p_task_set_up_dta->index = ((p_task_set_up_dta->index + 1) % 2);
							LOGGER_LOG("Setup - Index - %ld\n", p_task_set_up_dta->index);
							break;

						case 2:
							set_up_mode = false;
							p_task_set_up_dta -> state = ST_SYS_01_IDLE;
							LOGGER_LOG("Setup - Idle\n");
							break;

					}
				}

				break;

			case ST_SYS_01_PARAMS:

				switch(p_task_set_up_dta -> submenu){

					case 0:
						p_task_set_up_dta -> state = ST_SYS_01_WAIT_TIME;
						LOGGER_LOG("Setup - Wait Time\n");
						break;


					case 1:
						p_task_set_up_dta -> state = ST_SYS_01_STAY_TIME;
						LOGGER_LOG("Setup - Stay Time\n");
						break;
				}

				break;

			case ST_SYS_01_WAIT_TIME:

				if(p_task_set_up_dta->event == EV_SYS_01_SELECT){
					p_task_set_up_dta->select = ((p_task_set_up_dta->select + 1) % 3);
					LOGGER_LOG("Setup - Select - %ld\n", p_task_set_up_dta->select);
				}

				if(p_task_set_up_dta->event == EV_SYS_01_CONFIG){

					switch (p_task_set_up_dta -> select){

						case 0:
							wait_time = (p_task_set_up_dta -> index) * 10;
							p_task_set_up_dta -> submenu = 0;
							p_task_set_up_dta -> index = 0;
							p_task_set_up_dta -> select = 0;
							p_task_set_up_dta -> state = ST_SYS_01_MENU;
							LOGGER_LOG("Wait Time: %ld\n", wait_time);
							break;

						case 1:
							p_task_set_up_dta->index = ((p_task_set_up_dta->index + 1) % 10);
							LOGGER_LOG("Setup - Index - %ld\n", p_task_set_up_dta->index);
							break;

						case 2:
							set_up_mode = false;
							p_task_set_up_dta -> state = ST_SYS_01_IDLE;
							LOGGER_LOG("Setup - Idle\n");
							break;

					}
				}

				break;

			case ST_SYS_01_STAY_TIME:

				if(p_task_set_up_dta->event == EV_SYS_01_SELECT){
					p_task_set_up_dta->select = ((p_task_set_up_dta->select + 1) % 3);
					LOGGER_LOG("Setup - Select - %ld\n", p_task_set_up_dta->select);
				}

				if(p_task_set_up_dta->event == EV_SYS_01_CONFIG){

					switch (p_task_set_up_dta -> select){

						case 0:
							stay_time = (p_task_set_up_dta -> index) * 10;
							p_task_set_up_dta -> submenu = 0;
							p_task_set_up_dta -> index = 0;
							p_task_set_up_dta -> select = 0;
							p_task_set_up_dta -> state = ST_SYS_01_MENU;
							LOGGER_LOG("Stay Time: %ld\n", stay_time);
							break;

						case 1:
							p_task_set_up_dta->index = ((p_task_set_up_dta->index + 1) % 10);
							LOGGER_LOG("Setup - Index - %ld\n", p_task_set_up_dta->index);
							break;

						case 2:
							set_up_mode = false;
							p_task_set_up_dta -> state = ST_SYS_01_IDLE;
							LOGGER_LOG("Setup - Idle\n");
							break;

					}
				}

				break;

			default:
				break;
		}
		p_task_set_up_dta -> flag = false;
	}

}

/********************** end of file ******************************************/

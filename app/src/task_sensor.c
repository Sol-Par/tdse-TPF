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
 * @file   : task_sensor.c
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
#include "task_sensor_attribute.h"

#include "task_set_up_attribute.h"
#include "task_set_up_interface.h"
#include "task_normal_attribute.h"
#include "task_normal_interface.h"

/********************** macros and definitions *******************************/
#define G_TASK_SEN_CNT_INIT			0ul
#define G_TASK_SEN_TICK_CNT_INI		0ul

#define DEL_SNS_XX_MIN				5ul
#define DEL_SNS_XX_MAX				50ul

/********************** internal data declaration ****************************/

bool set_up_mode = true;

const task_sensor_cfg_t task_sensor_cfg_list[] = {
	{ID_SNS_CONFIG,		SNS_CONFIG_PORT,  	SNS_CONFIG_PIN, 	SNS_CONFIG_PRESSED, 	DEL_SNS_XX_MIN,	EV_SYS_XX_CONFIG,	NOEVENT},
	{ID_SNS_SELECTOR,	SNS_SELECTOR_PORT,  SNS_SELECTOR_PIN,  	SNS_SELECTOR_PRESSED, 	DEL_SNS_XX_MIN, EV_SYS_XX_SELECT,	NOEVENT},
	{ID_SNS_MANUAL,		SNS_MANUAL_PORT,  	SNS_MANUAL_PIN,  	SNS_MANUAL_PRESSED, 	DEL_SNS_XX_MIN, EV_SYS_02_MANUAL,	NOEVENT},
	{ID_SNS_EXTERIOR,	SNS_EXTERIOR_PORT,  SNS_EXTERIOR_PIN,  	SNS_EXTERIOR_PRESSED, 	DEL_SNS_XX_MAX, EV_SYS_02_EXTERIOR,	NOEVENT},
	{ID_SNS_DETECTED,  	SNS_DETECTED_PORT,  SNS_DETECTED_PIN,  	SNS_DETECTED_PRESSED, 	DEL_SNS_XX_MAX, EV_SYS_02_DETECTED,	EV_SYS_02_NODETECTED},
	{ID_SNS_OPEN,  		SNS_OPEN_PORT,  	SNS_OPEN_PIN,  		SNS_OPEN_PRESSED, 		DEL_SNS_XX_MAX, EV_SYS_02_OPEN,		NOEVENT},
	{ID_SNS_CLOSE,  	SNS_CLOSE_PORT,  	SNS_CLOSE_PIN,  	SNS_CLOSE_PRESSED, 		DEL_SNS_XX_MAX, EV_SYS_02_CLOSE,	NOEVENT}
};

#define SENSOR_CFG_QTY	(sizeof(task_sensor_cfg_list)/sizeof(task_sensor_cfg_t))

task_sensor_dta_t task_sensor_dta_list[] = {
	{DEL_SNS_XX_MIN, ST_SNS_XX_UP, EV_SNS_XX_UP},
	{DEL_SNS_XX_MIN, ST_SNS_XX_UP, EV_SNS_XX_UP},
	{DEL_SNS_XX_MIN, ST_SNS_XX_UP, EV_SNS_XX_UP},
	{DEL_SNS_XX_MIN, ST_SNS_XX_UP, EV_SNS_XX_UP},
	{DEL_SNS_XX_MIN, ST_SNS_XX_UP, EV_SNS_XX_UP},
	{DEL_SNS_XX_MIN, ST_SNS_XX_UP, EV_SNS_XX_UP},
	{DEL_SNS_XX_MIN, ST_SNS_XX_UP, EV_SNS_XX_UP}
};

#define SENSOR_DTA_QTY	(sizeof(task_sensor_dta_list)/sizeof(task_sensor_dta_t))

/********************** internal functions declaration ***********************/

/********************** internal data definition *****************************/
const char *p_task_sensor 		= "Task Sensor (Sensor Statechart)";
const char *p_task_sensor_ 		= "Non-Blocking & Update By Time Code";

/********************** external data declaration ****************************/
uint32_t g_task_sensor_cnt;
volatile uint32_t g_task_sensor_tick_cnt;

/********************** external functions definition ************************/
void task_sensor_init(void *parameters)
{
	uint32_t index;
	task_sensor_dta_t *p_task_sensor_dta;
	task_sensor_st_t state;
	task_sensor_ev_t event;

	/* Print out: Task Initialized */
	LOGGER_LOG("  %s is running - %s\r\n", GET_NAME(task_sensor_init), p_task_sensor);
	LOGGER_LOG("  %s is a %s\r\n", GET_NAME(task_sensor), p_task_sensor_);

	g_task_sensor_cnt = G_TASK_SEN_CNT_INIT;

	/* Print out: Task execution counter */
	LOGGER_LOG("   %s = %lu\r\n", GET_NAME(g_task_sensor_cnt), g_task_sensor_cnt);

	for (index = 0; SENSOR_DTA_QTY > index; index++)
	{
		/* Update Task Sensor Data Pointer */
		p_task_sensor_dta = &task_sensor_dta_list[index];

		/* Print out: Index & Task execution FSM */
		LOGGER_LOG("   %s = %lu", GET_NAME(index), index);

		state = p_task_sensor_dta->state;
		LOGGER_LOG("   %s = %lu", GET_NAME(state), (uint32_t)state);

		event = p_task_sensor_dta->event;
		LOGGER_LOG("   %s = %lu\r\n", GET_NAME(event), (uint32_t)event);
	}
	g_task_sensor_tick_cnt = G_TASK_SEN_TICK_CNT_INI;
}

void task_sensor_update(void *parameters)
{
	uint32_t index;
	const task_sensor_cfg_t *p_task_sensor_cfg;
	task_sensor_dta_t *p_task_sensor_dta;
	bool b_time_update_required = false;

	/* Update Task Sensor Counter */
	g_task_sensor_cnt++;

	/* Protect shared resource (g_task_sensor_tick_cnt) */
	__asm("CPSID i");	/* disable interrupts*/
    if (G_TASK_SEN_TICK_CNT_INI < g_task_sensor_tick_cnt)
    {
    	g_task_sensor_tick_cnt--;
    	b_time_update_required = true;
    }
    __asm("CPSIE i");	/* enable interrupts*/

    while (b_time_update_required)
    {
		/* Protect shared resource (g_task_sensor_tick_cnt) */
		__asm("CPSID i");	/* disable interrupts*/
		if (G_TASK_SEN_TICK_CNT_INI < g_task_sensor_tick_cnt)
		{
			g_task_sensor_tick_cnt--;
			b_time_update_required = true;
		}
		else
		{
			b_time_update_required = false;
		}
		__asm("CPSIE i");	/* enable interrupts*/

    	for (index = 0; SENSOR_DTA_QTY > index; index++)
		{
    		/* Update Task Sensor Configuration & Data Pointer */
			p_task_sensor_cfg = &task_sensor_cfg_list[index];
			p_task_sensor_dta = &task_sensor_dta_list[index];

			if (p_task_sensor_cfg->pressed == HAL_GPIO_ReadPin(p_task_sensor_cfg->gpio_port, p_task_sensor_cfg->pin))
			{
				p_task_sensor_dta->event =	EV_SNS_XX_DOWN;
				//LOGGER_LOG("Apretado\n");
			}
			else
			{
				p_task_sensor_dta->event =	EV_SNS_XX_UP;
			}

			switch (p_task_sensor_dta->state)
			{
				case ST_SNS_XX_UP:

					if (EV_SNS_XX_DOWN == p_task_sensor_dta->event)
					{
						p_task_sensor_dta->state = ST_SNS_XX_FALLING;
						p_task_sensor_dta->tick = p_task_sensor_cfg->tick_max;
					}

					break;

				case ST_SNS_XX_FALLING:

					if (EV_SNS_XX_UP == p_task_sensor_dta->event && p_task_sensor_dta->tick > 0)
					{
						p_task_sensor_dta->state = ST_SNS_XX_UP;
					}

					if (EV_SNS_XX_DOWN == p_task_sensor_dta->event && p_task_sensor_dta->tick > 0)
					{
						p_task_sensor_dta->tick--;

					}

					if (EV_SNS_XX_DOWN == p_task_sensor_dta->event && p_task_sensor_dta->tick == 0)
					{

						if(set_up_mode == true)
							put_event_task_set_up(p_task_sensor_cfg->signal_down);
						else
							put_event_task_normal(p_task_sensor_cfg->signal_down);

						p_task_sensor_dta->state = ST_SNS_XX_DOWN;
					}

					break;

				case ST_SNS_XX_DOWN:

					if (EV_SNS_XX_UP == p_task_sensor_dta->event)
					{
						p_task_sensor_dta->tick = p_task_sensor_cfg->tick_max;
						p_task_sensor_dta->state = ST_SNS_XX_RISING;
					}

					break;

				case ST_SNS_XX_RISING:

					if (EV_SNS_XX_DOWN == p_task_sensor_dta->event && p_task_sensor_dta->tick > 0)
					{
						p_task_sensor_dta->state = ST_SNS_XX_DOWN;
					}
					if (EV_SNS_XX_UP == p_task_sensor_dta->event && p_task_sensor_dta->tick > 0)
					{
						p_task_sensor_dta->tick--;
					}
					if (EV_SNS_XX_UP == p_task_sensor_dta->event && p_task_sensor_dta->tick == 0)
					{
						if(set_up_mode == true)
							put_event_task_set_up(p_task_sensor_cfg->signal_up);
						else
							put_event_task_normal(p_task_sensor_cfg->signal_up);

						p_task_sensor_dta->state = ST_SNS_XX_UP;
					}

					break;

				default:

					p_task_sensor_dta->tick  = DEL_SNS_XX_MIN;
					p_task_sensor_dta->state = ST_SNS_XX_UP;
					p_task_sensor_dta->event = EV_SNS_XX_UP;

					break;
			}
		}
    }
}

/********************** end of file ******************************************/

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
 * @file   : task_actuator.c
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
#include "task_actuator_attribute.h"
#include "task_actuator_interface.h"

/********************** macros and definitions *******************************/
#define G_TASK_ACT_CNT_INIT			0ul
#define G_TASK_ACT_TICK_CNT_INI		0ul

#define DEL_ACT_XX_PUL				250ul
#define DEL_ACT_XX_BLI				500ul
#define DEL_ACT_XX_MIN				0ul

/********************** internal data declaration ****************************/
const task_actuator_cfg_t task_actuator_cfg_list[] = {
	{ID_ACT_01,  ACT_01_PORT,  ACT_01_PIN, ACT_01_ON,  ACT_01_OFF, DEL_ACT_XX_BLI, DEL_ACT_XX_PUL},
	{ID_ACT_02,  ACT_02_PORT,  ACT_02_PIN, ACT_02_ON,  ACT_02_OFF, DEL_ACT_XX_BLI, DEL_ACT_XX_PUL},
	{ID_ACT_03,  ACT_03_PORT,  ACT_03_PIN, ACT_03_ON,  ACT_03_OFF, DEL_ACT_XX_BLI, DEL_ACT_XX_PUL},
	{ID_ACT_04,  ACT_04_PORT,  ACT_04_PIN, ACT_04_ON,  ACT_04_OFF, DEL_ACT_XX_BLI, DEL_ACT_XX_PUL},
	{ID_ACT_05,  ACT_05_PORT,  ACT_05_PIN, ACT_05_ON,  ACT_05_OFF, DEL_ACT_XX_BLI, DEL_ACT_XX_PUL},
};

#define ACTUATOR_CFG_QTY	(sizeof(task_actuator_cfg_list)/sizeof(task_actuator_cfg_t))

task_actuator_dta_t task_actuator_dta_list[] = {
	{DEL_ACT_XX_MIN, ST_ACT_XX_OFF, EV_ACT_XX_OFF, false},
	{DEL_ACT_XX_MIN, ST_ACT_XX_OFF, EV_ACT_XX_OFF, false},
	{DEL_ACT_XX_MIN, ST_ACT_XX_OFF, EV_ACT_XX_OFF, false},
	{DEL_ACT_XX_MIN, ST_ACT_XX_OFF, EV_ACT_XX_OFF, false},
	{DEL_ACT_XX_MIN, ST_ACT_XX_OFF, EV_ACT_XX_OFF, false},
};

#define ACTUATOR_DTA_QTY	(sizeof(task_actuator_dta_list)/sizeof(task_actuator_dta_t))

/********************** internal functions declaration ***********************/

/********************** internal data definition *****************************/

/********************** external data declaration ****************************/
uint32_t g_task_actuator_cnt;
volatile uint32_t g_task_actuator_tick_cnt;

/********************** external functions definition ************************/
void task_actuator_init(void *parameters)
{
	uint32_t index;
	const task_actuator_cfg_t *p_task_actuator_cfg;

	g_task_actuator_cnt = G_TASK_ACT_CNT_INIT;

	for (index = 0; ACTUATOR_DTA_QTY > index; index++)
	{
		/* Update Task Actuator Configuration & Data Pointer */
		p_task_actuator_cfg = &task_actuator_cfg_list[index];

		HAL_GPIO_WritePin(p_task_actuator_cfg->gpio_port, p_task_actuator_cfg->pin, p_task_actuator_cfg->led_off);
	}

	g_task_actuator_tick_cnt = G_TASK_ACT_TICK_CNT_INI;
}

void task_actuator_update(void *parameters)
{
	uint32_t index;
	const task_actuator_cfg_t *p_task_actuator_cfg;
	task_actuator_dta_t *p_task_actuator_dta;
	bool b_time_update_required = false;

	/* Update Task Actuator Counter */
	g_task_actuator_cnt++;

	/* Protect shared resource (g_task_actuator_tick_cnt) */
	__asm("CPSID i");	/* disable interrupts*/
    if (G_TASK_ACT_TICK_CNT_INI < g_task_actuator_tick_cnt)
    {
    	g_task_actuator_tick_cnt--;
    	b_time_update_required = true;
    }
    __asm("CPSIE i");	/* enable interrupts*/

    while (b_time_update_required)
    {
		/* Protect shared resource (g_task_actuator_tick_cnt) */
		__asm("CPSID i");	/* disable interrupts*/
		if (G_TASK_ACT_TICK_CNT_INI < g_task_actuator_tick_cnt)
		{
			g_task_actuator_tick_cnt--;
			b_time_update_required = true;
		}
		else
		{
			b_time_update_required = false;
		}
		__asm("CPSIE i");	/* enable interrupts*/

    	for (index = 0; ACTUATOR_DTA_QTY > index; index++)
		{
    		/* Update Task Actuator Configuration & Data Pointer */
			p_task_actuator_cfg = &task_actuator_cfg_list[index];
			p_task_actuator_dta = &task_actuator_dta_list[index];

			switch (p_task_actuator_dta->state)
			{
				case ST_ACT_XX_OFF:
					if(p_task_actuator_dta->flag)
					{

						if (EV_ACT_XX_ON == p_task_actuator_dta->event)
						{
							HAL_GPIO_WritePin(p_task_actuator_cfg->gpio_port, p_task_actuator_cfg->pin, p_task_actuator_cfg->led_on);
							p_task_actuator_dta->state = ST_ACT_XX_ON;
						}

						if(EV_ACT_XX_BLINK == p_task_actuator_dta->event)
						{
							LOGGER_LOG("Hola\n");
							HAL_GPIO_WritePin(p_task_actuator_cfg->gpio_port, p_task_actuator_cfg->pin, p_task_actuator_cfg->led_on);
							p_task_actuator_dta->state = ST_ACT_XX_BLINK_ON;
							p_task_actuator_dta->tick = DEL_ACT_XX_BLI;
						}
						p_task_actuator_dta->flag = false;
					}
					break;

				case ST_ACT_XX_ON:
					if(p_task_actuator_dta->flag)
					{
						if (EV_ACT_XX_OFF == p_task_actuator_dta->event)
						{
							HAL_GPIO_WritePin(p_task_actuator_cfg->gpio_port, p_task_actuator_cfg->pin, p_task_actuator_cfg->led_off);
							p_task_actuator_dta->state = ST_ACT_XX_OFF;
						}
						if(EV_ACT_XX_BLINK == p_task_actuator_dta->event)
						{
							HAL_GPIO_WritePin(p_task_actuator_cfg->gpio_port, p_task_actuator_cfg->pin, p_task_actuator_cfg->led_on);
							p_task_actuator_dta->state = ST_ACT_XX_BLINK_ON;
							p_task_actuator_dta->tick = DEL_ACT_XX_BLI;
						}
						p_task_actuator_dta->flag = false;
					}
					break;

				case ST_ACT_XX_BLINK_ON:
					if(p_task_actuator_dta->flag)
					{

						if(EV_ACT_XX_NOBLINK == p_task_actuator_dta->event || EV_ACT_XX_OFF == p_task_actuator_dta->event)
						{
							HAL_GPIO_WritePin(p_task_actuator_cfg->gpio_port, p_task_actuator_cfg->pin, p_task_actuator_cfg->led_off);
							p_task_actuator_dta->state = ST_ACT_XX_OFF;
						}

						if (EV_ACT_XX_ON == p_task_actuator_dta->event)
						{
							HAL_GPIO_WritePin(p_task_actuator_cfg->gpio_port, p_task_actuator_cfg->pin, p_task_actuator_cfg->led_on);
							p_task_actuator_dta->state = ST_ACT_XX_ON;
						}

						p_task_actuator_dta->flag = false;
					}

					if(p_task_actuator_dta->tick > 0){
						p_task_actuator_dta->tick --;
					}
					if(p_task_actuator_dta->tick == 0){
						HAL_GPIO_WritePin(p_task_actuator_cfg->gpio_port, p_task_actuator_cfg->pin, p_task_actuator_cfg->led_off);
						p_task_actuator_dta->state = ST_ACT_XX_BLINK_OFF;
						p_task_actuator_dta->tick = DEL_ACT_XX_BLI;
					}

					break;

				case ST_ACT_XX_BLINK_OFF:

					if(p_task_actuator_dta->flag){

						if(EV_ACT_XX_NOBLINK == p_task_actuator_dta->event || EV_ACT_XX_OFF == p_task_actuator_dta->event)
						{
							HAL_GPIO_WritePin(p_task_actuator_cfg->gpio_port, p_task_actuator_cfg->pin, p_task_actuator_cfg->led_off);
							p_task_actuator_dta->state = ST_ACT_XX_OFF;
						}

						if (EV_ACT_XX_ON == p_task_actuator_dta->event)
						{
							HAL_GPIO_WritePin(p_task_actuator_cfg->gpio_port, p_task_actuator_cfg->pin, p_task_actuator_cfg->led_on);
							p_task_actuator_dta->state = ST_ACT_XX_ON;
						}

						p_task_actuator_dta->flag = false;
					}

					if(p_task_actuator_dta->tick > 0)
					{
						p_task_actuator_dta->tick --;
					}

					if(p_task_actuator_dta->tick == 0)
					{
						HAL_GPIO_WritePin(p_task_actuator_cfg->gpio_port, p_task_actuator_cfg->pin, p_task_actuator_cfg->led_on);
						p_task_actuator_dta->state = ST_ACT_XX_BLINK_ON;
						p_task_actuator_dta->tick = DEL_ACT_XX_BLI;

					}
					break;

				/*case ST_ACT_XX_PULSE:

					break;
				*/
				default:

					break;
			}
		}
    }
}

/********************** end of file ******************************************/

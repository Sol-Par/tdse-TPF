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
 * @file   : task_adc.c
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

/********************** macros and definitions *******************************/
//#define AVERAGER_SIZE (100)
#define AVERAGER_SIZE (8)

#define TEST_NUMBER (3)

/********************** internal data declaration ****************************/
uint32_t tickstart;
uint16_t sample_idx;

uint16_t sample_array[AVERAGER_SIZE];
uint16_t promedio;
uint16_t aux;
bool b_trig_new_conversion;
/********************** internal functions declaration ***********************/

/********************** internal data definition *****************************/
const char *p_task_adc 		= "Task ADC";

/********************** external data declaration *****************************/

extern ADC_HandleTypeDef hadc1;


/********************** external functions definition ************************/
bool test3_tick();
void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc);
HAL_StatusTypeDef ADC_Poll_Read(uint16_t *value);

void task_adc_init(uint16_t* parameters)
{
	HAL_NVIC_SetPriority(ADC1_2_IRQn, 2, 0);
	HAL_NVIC_EnableIRQ(ADC1_2_IRQn);

	sample_idx = 0;
	tickstart = HAL_GetTick();

	/* Print out: Task Initialized */
	LOGGER_LOG("  %s is running - %s\r\n", GET_NAME(task_adc_init), p_task_adc);

}

void task_adc_update(uint16_t* parameters)
{
// a checkear el static
	bool b_test_done = false;

	if (!b_test_done) {


		b_test_done = test3_tick();



		if (b_test_done) {
			LOGGER_LOG("Test #%u ends. Ticks: %lu\n", TEST_NUMBER, (HAL_GetTick()-tickstart));
		}
	}
}

HAL_StatusTypeDef ADC_Poll_Read(uint16_t *value) {
	HAL_StatusTypeDef res;

	res=HAL_ADC_Start(&hadc1);
	if ( HAL_OK==res ) {
		res=HAL_ADC_PollForConversion(&hadc1, 0);
		if ( HAL_OK==res ) {
			*value = HAL_ADC_GetValue(&hadc1);
		}
	}
	return res;
}

void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc) {

	sample_array[sample_idx++] = HAL_ADC_GetValue(&hadc1);
	if (sample_idx<AVERAGER_SIZE) {
		b_trig_new_conversion = true;
	}
}

bool test3_tick() {

	bool b_done = false;
	bool flag = false;

	if (sample_idx>=AVERAGER_SIZE) {
		b_done = true;
		flag = true;
	}

	/* start of first conversion */
	if (0==sample_idx && flag == false) {
		b_trig_new_conversion = true;
	}


	if (b_trig_new_conversion && flag == false) {
		b_trig_new_conversion = false;
	
		HAL_ADC_Start_IT(&hadc1);
	}

	if (b_done  && flag == true) {
		aux = 0;
		for (sample_idx=0;sample_idx<AVERAGER_SIZE;sample_idx++) {
			promedio = 0;
			LOGGER_LOG("%u\n",sample_array[sample_idx] );
			aux = aux + sample_array[sample_idx];
		}
		promedio = aux/AVERAGER_SIZE;
		LOGGER_LOG("Promedio: %u\n",promedio);
		sample_idx = 0;
	}
	return b_done;
}

/********************** end of file ******************************************/

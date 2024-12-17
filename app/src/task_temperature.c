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
#include "task_temperature.h"

/********************** macros and definitions *******************************/
//#define AVERAGER_SIZE (100)
#define AVERAGER_SIZE (32)

#define TEST_NUMBER (3)

/********************** internal data declaration ****************************/
uint32_t tickstart;

uint32_t sample_id_1;
uint32_t sample_id_2;

uint32_t sample_array_1[AVERAGER_SIZE];
uint32_t sample_array_2[AVERAGER_SIZE];

uint32_t aux1;
uint32_t aux2;

uint32_t inner_temp;
uint32_t promedio;


bool b_trig_new_conversion_1;
bool b_trig_new_conversion_2;
/********************** internal functions declaration ***********************/

/********************** internal data definition *****************************/

/********************** external data declaration *****************************/

extern ADC_HandleTypeDef hadc1;
extern ADC_HandleTypeDef hadc2;


/********************** external functions definition ************************/
bool test3_tick();
void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc);

void task_temperature_init(void *parameters)
{
	HAL_NVIC_SetPriority(ADC1_2_IRQn, 2, 0);
	HAL_NVIC_EnableIRQ(ADC1_2_IRQn);

	sample_id_1 = 0;
	sample_id_2 = 0;
	tickstart = HAL_GetTick();
}

void task_temperature_update(void *parameters)
{
// a checkear el static
	bool b_test_done = false;

	if (!b_test_done) {
		b_test_done = test3_tick();
	}
}


void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc) {

	sample_array_1[sample_id_1++] = HAL_ADC_GetValue(&hadc1);
	if (sample_id_1<AVERAGER_SIZE) {
		b_trig_new_conversion_1 = true;
	}

	sample_array_2[sample_id_2++] = HAL_ADC_GetValue(&hadc2);
	if (sample_id_2<AVERAGER_SIZE) {
		b_trig_new_conversion_2 = true;
	}
}

bool test3_tick() {

	bool b_done = false;
	bool flag1 = false;
	bool flag2 = false;

	if(sample_id_1 >= AVERAGER_SIZE)
		flag1 = true;


	if(sample_id_2 >= AVERAGER_SIZE)
		flag2 = true;

	if(flag1 == true && flag2 == true)
		b_done = true;

	/* start of first conversion */
	if (sample_id_1 == 0 && flag1 == false) {
		b_trig_new_conversion_1 = true;
	}

	if (b_trig_new_conversion_1 == true && flag1 == false) {
		b_trig_new_conversion_1 = false;
		HAL_ADC_Start_IT(&hadc1);
	}

	if (sample_id_2 == 0 && flag2 == false) {
		b_trig_new_conversion_2 = true;
	}

	if (b_trig_new_conversion_2 == true && flag2 == false) {
		b_trig_new_conversion_2 = false;
		HAL_ADC_Start_IT(&hadc2);
	}

	if (b_done  && flag1 == true && flag2 == true) {

		aux1 = 0;

		for (sample_id_1=0;sample_id_1<AVERAGER_SIZE;sample_id_1++) {
			inner_temp = 0;
			aux1 = aux1 + sample_array_1[sample_id_1];
		}

		inner_temp = (((1.43 - ((3.30 * (float)(aux1/AVERAGER_SIZE))/(4096))) / 0.0043) + 25.0);

		sample_id_1 = 0;

		aux2 = 0;

		for (sample_id_2=0;sample_id_2<AVERAGER_SIZE;sample_id_2++) {
			promedio = 0;
			aux2 = aux2 + sample_array_2[sample_id_2];
		}

		promedio = (3.30 * 100.0 * (float)(aux2/AVERAGER_SIZE))/(4096.0);
		sample_id_2 = 0;
	}
	return b_done;
}

/********************** end of file ******************************************/

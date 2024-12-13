/*
 * Copyright (c) 2023 Juan Manuel Cruz <jcruz@fi.uba.ar>.
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
 * @file   : board.h
 * @date   : Set 26, 2023
 * @author : Juan Manuel Cruz <jcruz@fi.uba.ar> <jcruz@frba.utn.edu.ar>
 * @version	v1.0.0
 */

#ifndef BOARD_INC_BOARD_H_
#define BOARD_INC_BOARD_H_

/********************** CPP guard ********************************************/
#ifdef __cplusplus
extern "C" {
#endif

/********************** inclusions *******************************************/

/********************** macros ***********************************************/
#define NUCLEO_F103RC		(0)
#define NUCLEO_F401RE		(1)
#define NUCLEO_F446RE		(2)
#define NUCLEO_F429ZI		(3)
#define NUCLEO_F439ZI		(4)
#define NUCLEO_F413ZH		(5)
#define STM32F429I_DISCO1	(6)

#define BOARD (NUCLEO_F103RC)

/* STM32 Nucleo Boards - 64 Pins */
#if ((BOARD == NUCLEO_F103RC) || (BOARD == NUCLEO_F401RE) || (BOARD == NUCLEO_F446RE))

#define SNS_CONFIG_PIN			SNS_01_Pin
#define SNS_CONFIG_PORT			SNS_01_GPIO_Port
#define SNS_CONFIG_PRESSED		GPIO_PIN_RESET
#define SNS_CONFIG_HOVER		GPIO_PIN_SET

#define SNS_SELECTOR_PIN		SNS_02_Pin
#define SNS_SELECTOR_PORT		SNS_02_GPIO_Port
#define SNS_SELECTOR_PRESSED	GPIO_PIN_RESET
#define SNS_SELECTOR_HOVER		GPIO_PIN_SET

#define SNS_MANUAL_PIN			SNS_03_Pin
#define SNS_MANUAL_PORT			SNS_03_GPIO_Port
#define SNS_MANUAL_PRESSED		GPIO_PIN_RESET
#define SNS_MANUAL_HOVER		GPIO_PIN_SET

#define SNS_EXTERIOR_PIN		SNS_04_Pin
#define SNS_EXTERIOR_PORT		SNS_04_GPIO_Port
#define SNS_EXTERIOR_PRESSED	GPIO_PIN_RESET
#define SNS_EXTERIOR_HOVER		GPIO_PIN_SET

#define SNS_DETECTED_PIN		SNS_05_Pin
#define SNS_DETECTED_PORT		SNS_05_GPIO_Port
#define SNS_DETECTED_PRESSED	GPIO_PIN_RESET
#define SNS_DETECTED_HOVER		GPIO_PIN_SET

#define SNS_OPEN_PIN			SNS_06_Pin
#define SNS_OPEN_PORT			SNS_06_GPIO_Port
#define SNS_OPEN_PRESSED		GPIO_PIN_RESET
#define SNS_OPEN_HOVER			GPIO_PIN_SET

#define SNS_CLOSE_PIN			SNS_07_Pin
#define SNS_CLOSE_PORT			SNS_07_GPIO_Port
#define SNS_CLOSE_PRESSED		GPIO_PIN_RESET
#define SNS_CLOSE_HOVER			GPIO_PIN_SET

#define ACT_01_PIN				ACT_01_Pin
#define ACT_01_PORT				ACT_01_GPIO_Port
#define ACT_01_ON				GPIO_PIN_SET
#define ACT_01_OFF				GPIO_PIN_RESET

#define ACT_02_PIN				ACT_02_Pin
#define ACT_02_PORT				ACT_02_GPIO_Port
#define ACT_02_ON				GPIO_PIN_SET
#define ACT_02_OFF				GPIO_PIN_RESET

#define ACT_03_PIN				ACT_03_Pin
#define ACT_03_PORT				ACT_03_GPIO_Port
#define ACT_03_ON				GPIO_PIN_SET
#define ACT_03_OFF				GPIO_PIN_RESET

#define ACT_04_PIN				ACT_04_Pin
#define ACT_04_PORT				ACT_04_GPIO_Port
#define ACT_04_ON				GPIO_PIN_SET
#define ACT_04_OFF				GPIO_PIN_RESET

#define ACT_05_PIN				ACT_05_Pin
#define ACT_05_PORT				ACT_05_GPIO_Port
#define ACT_05_ON				GPIO_PIN_SET
#define ACT_05_OFF				GPIO_PIN_RESET

#endif/* STM32 Nucleo Boards - 144 Pins */

#if ((BOARD == NUCLEO_F429ZI) || (BOARD == NUCLEO_F439ZI) || (BOARD == NUCLEO_F413ZH))

#define SNS_A_PIN		USER_SNS_Pin
#define SNS_A_PORT		USER_SNS_GPIO_Port
#define SNS_A_PRESSED	GPIO_PIN_SET
#define SNS_A_HOVER		GPIO_PIN_RESET

#define ACT_A_PIN		LD1_Pin
#define ACT_A_PORT		LD1_GPIO_Port
#define ACT_A_ON		GPIO_PIN_SET
#define ACT_A_OFF		GPIO_PIN_RESET

#endif

/* STM32 Discovery Kits */
#if (BOARD == STM32F429I_DISCO1)

#define SNS_A_PIN		B1_Pin
#define SNS_A_PORT		B1_GPIO_Port
#define SNS_A_PRESSED	GPIO_PIN_SET
#define SNS_A_HOVER		GPIO_PIN_RESET

#define ACT_A_PIN		LD3_Pin
#define ACT_A_PORT		LD3_GPIO_Port
#define ACT_A_ON		GPIO_PIN_SET
#define ACT_A_OFF		GPIO_PIN_RESET

#endif

/********************** typedef **********************************************/

/********************** external data declaration ****************************/

/********************** external functions declaration ***********************/

/********************** End of CPP guard *************************************/
#ifdef __cplusplus
}
#endif

#endif /* BOARD_INC_BOARD_H_ */

/********************** end of file ******************************************/

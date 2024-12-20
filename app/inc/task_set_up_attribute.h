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
 * @file   : task_system_attribute.h
 * @date   : Set 26, 2023
 * @author : Juan Manuel Cruz <jcruz@fi.uba.ar> <jcruz@frba.utn.edu.ar>
 * @version	v1.0.0
 */

#ifndef TASK_INC_TASK_SET_UP_ATTRIBUTE_H_
#define TASK_INC_TASK_SET_UP_ATTRIBUTE_H_

/********************** CPP guard ********************************************/
#ifdef __cplusplus
extern "C" {
#endif

/********************** inclusions *******************************************/
#include "task_shared_attribute.h"
/********************** macros ***********************************************/

/********************** typedef **********************************************/


/* Events to excite Task System */


typedef enum task_set_up_ev {	EV_SYS_01_CONFIG = EV_SYS_XX_CONFIG,
								EV_SYS_01_SELECT = EV_SYS_XX_SELECT,
								NOEVENT_01 = NOEVENT,
								EV_SYS_01_IDLE
} task_set_up_ev_t;

/* State of Task System */
typedef enum task_set_up_st {ST_SYS_01_IDLE,
							 ST_SYS_01_MENU,
							 ST_SYS_01_PARAMS,
							 ST_SYS_01_WAIT_TIME,
							 ST_SYS_01_STAY_TIME,
} task_set_up_st_t;

typedef struct
{
	task_set_up_st_t	state;
	task_set_up_ev_t	event;
	uint32_t			index;
	uint32_t 			select;
	uint32_t			submenu;
	bool				flag;
} task_set_up_dta_t;

/********************** external data declaration ****************************/
extern task_set_up_dta_t task_set_up_dta;

/********************** external functions declaration ***********************/

/********************** End of CPP guard *************************************/
#ifdef __cplusplus
}
#endif

#endif /* TASK_INC_TASK_SET_UP_ATTRIBUTE_H_ */

/********************** end of file ******************************************/

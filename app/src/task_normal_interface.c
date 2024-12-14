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
 * @file   : task_system_interface.c
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
#include "task_normal_attribute.h"

/********************** macros and definitions *******************************/
#define NOEVENT	(255)
#define MAX_EVENTS		(16)

/********************** internal data declaration ****************************/

/********************** internal functions declaration ***********************/

/********************** internal data definition *****************************/
struct
{
	uint32_t	head;
	uint32_t	tail;
	uint32_t	count;
	task_normal_ev_t	queue[MAX_EVENTS];
} queue_task_normal;

/********************** external data declaration ****************************/

/********************** external functions definition ************************/
void init_queue_event_task_normal(void)
{
	uint32_t i;

	queue_task_normal.head = 0;
	queue_task_normal.tail = 0;
	queue_task_normal.count = 0;

	for (i = 0; i < MAX_EVENTS; i++)
		queue_task_normal.queue[i] = NOEVENT;
}

void put_event_task_normal(task_normal_ev_t event)
{
	queue_task_normal.count++;
	queue_task_normal.queue[queue_task_normal.head++] = event;

	if (MAX_EVENTS == queue_task_normal.head)
		queue_task_normal.head = 0;
}

task_normal_ev_t get_event_task_normal(void)

{
	task_normal_ev_t event;

	queue_task_normal.count--;
	event = queue_task_normal.queue[queue_task_normal.tail];
	queue_task_normal.queue[queue_task_normal.tail++] = NOEVENT;

	if (MAX_EVENTS == queue_task_normal.tail)
		queue_task_normal.tail = 0;

	return event;
}

bool any_event_task_normal(void)
{
  return (queue_task_normal.head != queue_task_normal.tail);
}

/********************** end of file ******************************************/
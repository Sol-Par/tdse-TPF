/*
 * task_shared_attributes.h
 *
 *  Created on: Dec 13, 2024
 *      Author: USUARIO
 */

#ifndef INC_TASK_SHARED_ATTRIBUTE_H_
#define INC_TASK_SHARED_ATTRIBUTE_H_


/********************** CPP guard ********************************************/
#ifdef __cplusplus
extern "C" {
#endif

/********************** inclusions *******************************************/

/********************** macros ***********************************************/

/********************** typedef **********************************************/


/* Events to excite Task System */


typedef enum task_shared_ev {	EV_SYS_XX_CONFIG,
								EV_SYS_XX_SELECT,
								NOEVENT
} task_shared_ev_t;


/********************** external data declaration ****************************/
extern uint32_t stay_time;
extern uint32_t wait_time;

/********************** external functions declaration ***********************/

/********************** End of CPP guard *************************************/
#ifdef __cplusplus
}
#endif

#endif /* INC_TASK_SHARED_ATTRIBUTE_H_ */

/********************** end of file ******************************************/

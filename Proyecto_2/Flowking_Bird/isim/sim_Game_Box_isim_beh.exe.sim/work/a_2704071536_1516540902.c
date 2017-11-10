/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/juano/Documents/GitHub/Microprocesadores/Proyecto_2/Flowking_Bird/p5a.vhd";
extern char *IEEE_P_2592010699;
extern char *WORK_P_0539175533;

unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
unsigned char ieee_p_2592010699_sub_2507238156_503743352(char *, unsigned char , unsigned char );


static void work_a_2704071536_1516540902_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    int t14;
    int t15;
    int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned char t20;
    unsigned char t21;
    unsigned char t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;

LAB0:    xsi_set_current_line(28, ng0);

LAB3:    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = ((WORK_P_0539175533) + 1168U);
    t3 = *((char **)t1);
    t4 = *((int *)t3);
    t5 = (t4 - 1);
    t6 = (t5 - 5);
    t7 = (t6 * -1);
    t8 = (1U * t7);
    t9 = (0 + t8);
    t1 = (t2 + t9);
    t10 = *((unsigned char *)t1);
    t11 = (t0 + 1672U);
    t12 = *((char **)t11);
    t11 = ((WORK_P_0539175533) + 1168U);
    t13 = *((char **)t11);
    t14 = *((int *)t13);
    t15 = (t14 - 5);
    t16 = (t15 - 5);
    t17 = (t16 * -1);
    t18 = (1U * t17);
    t19 = (0 + t18);
    t11 = (t12 + t19);
    t20 = *((unsigned char *)t11);
    t21 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t10, t20);
    t22 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t21);
    t23 = (t0 + 3920);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    *((unsigned char *)t27) = t22;
    xsi_driver_first_trans_fast(t23);

LAB2:    t28 = (t0 + 3808);
    *((int *)t28) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2704071536_1516540902_p_1(char *t0)
{
    char t18[16];
    char t19[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    int t12;
    int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned char t17;
    char *t20;
    char *t21;
    int t22;
    unsigned int t23;
    unsigned char t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;

LAB0:    xsi_set_current_line(32, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1152U);
    t3 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 3824);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(33, ng0);
    t1 = xsi_get_transient_memory(6U);
    memset(t1, 0, 6U);
    t5 = t1;
    memset(t5, (unsigned char)2, 6U);
    t6 = (t0 + 3984);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 6U);
    xsi_driver_first_trans_fast(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(35, ng0);
    t2 = (t0 + 1352U);
    t5 = *((char **)t2);
    t4 = *((unsigned char *)t5);
    t11 = (t4 == (unsigned char)3);
    if (t11 != 0)
        goto LAB7;

LAB9:
LAB8:    goto LAB3;

LAB7:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 1672U);
    t6 = *((char **)t2);
    t2 = ((WORK_P_0539175533) + 1168U);
    t7 = *((char **)t2);
    t12 = *((int *)t7);
    t13 = (t12 - 2);
    t14 = (5 - t13);
    t15 = (t14 * 1U);
    t16 = (0 + t15);
    t2 = (t6 + t16);
    t8 = (t0 + 1832U);
    t9 = *((char **)t8);
    t17 = *((unsigned char *)t9);
    t10 = ((IEEE_P_2592010699) + 4024);
    t20 = (t19 + 0U);
    t21 = (t20 + 0U);
    *((int *)t21) = 4;
    t21 = (t20 + 4U);
    *((int *)t21) = 0;
    t21 = (t20 + 8U);
    *((int *)t21) = -1;
    t22 = (0 - 4);
    t23 = (t22 * -1);
    t23 = (t23 + 1);
    t21 = (t20 + 12U);
    *((unsigned int *)t21) = t23;
    t8 = xsi_base_array_concat(t8, t18, t10, (char)97, t2, t19, (char)99, t17, (char)101);
    t23 = (5U + 1U);
    t24 = (6U != t23);
    if (t24 == 1)
        goto LAB10;

LAB11:    t21 = (t0 + 3984);
    t25 = (t21 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memcpy(t28, t8, 6U);
    xsi_driver_first_trans_fast(t21);
    goto LAB8;

LAB10:    xsi_size_not_matching(6U, t23, 0);
    goto LAB11;

}

static void work_a_2704071536_1516540902_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(41, ng0);

LAB3:    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 4048);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 6U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 3840);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_2704071536_1516540902_init()
{
	static char *pe[] = {(void *)work_a_2704071536_1516540902_p_0,(void *)work_a_2704071536_1516540902_p_1,(void *)work_a_2704071536_1516540902_p_2};
	xsi_register_didat("work_a_2704071536_1516540902", "isim/sim_Game_Box_isim_beh.exe.sim/work/a_2704071536_1516540902.didat");
	xsi_register_executes(pe);
}

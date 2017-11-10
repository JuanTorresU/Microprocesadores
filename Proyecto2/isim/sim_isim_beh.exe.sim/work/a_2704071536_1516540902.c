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
static const char *ng0 = "C:/Proyectos ISE/Proyecto2/p5a.vhd";
extern char *IEEE_P_2592010699;
extern char *WORK_P_0539175533;

unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
unsigned char ieee_p_2592010699_sub_2507238156_503743352(char *, unsigned char , unsigned char );


static void work_a_2704071536_1516540902_p_0(char *t0)
{
    char t28[16];
    char t29[16];
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
    unsigned char t30;
    char *t31;
    char *t32;
    char *t33;

LAB0:    xsi_set_current_line(20, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = ((WORK_P_0539175533) + 1168U);
    t3 = *((char **)t1);
    t4 = *((int *)t3);
    t5 = (t4 - 1);
    t6 = (t5 - 6);
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
    t16 = (t15 - 6);
    t17 = (t16 * -1);
    t18 = (1U * t17);
    t19 = (0 + t18);
    t11 = (t12 + t19);
    t20 = *((unsigned char *)t11);
    t21 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t10, t20);
    t22 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t21);
    t23 = (t0 + 3392);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    *((unsigned char *)t27) = t22;
    xsi_driver_first_trans_fast(t23);
    xsi_set_current_line(22, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t10 = *((unsigned char *)t2);
    t20 = (t10 == (unsigned char)3);
    if (t20 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1152U);
    t10 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t10 != 0)
        goto LAB5;

LAB6:
LAB3:    xsi_set_current_line(29, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 3520);
    t3 = (t1 + 56U);
    t11 = *((char **)t3);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t2, 7U);
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 3312);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(23, ng0);
    t1 = xsi_get_transient_memory(7U);
    memset(t1, 0, 7U);
    t3 = t1;
    memset(t3, (unsigned char)2, 7U);
    t11 = (t0 + 3456);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t23 = (t13 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t1, 7U);
    xsi_driver_first_trans_fast(t11);
    goto LAB3;

LAB5:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t20 = *((unsigned char *)t3);
    t21 = (t20 == (unsigned char)3);
    if (t21 != 0)
        goto LAB7;

LAB9:
LAB8:    goto LAB3;

LAB7:    xsi_set_current_line(26, ng0);
    t2 = (t0 + 1672U);
    t11 = *((char **)t2);
    t2 = ((WORK_P_0539175533) + 1168U);
    t12 = *((char **)t2);
    t4 = *((int *)t12);
    t5 = (t4 - 2);
    t7 = (6 - t5);
    t8 = (t7 * 1U);
    t9 = (0 + t8);
    t2 = (t11 + t9);
    t13 = (t0 + 1832U);
    t23 = *((char **)t13);
    t22 = *((unsigned char *)t23);
    t24 = ((IEEE_P_2592010699) + 4024);
    t25 = (t29 + 0U);
    t26 = (t25 + 0U);
    *((int *)t26) = 5;
    t26 = (t25 + 4U);
    *((int *)t26) = 0;
    t26 = (t25 + 8U);
    *((int *)t26) = -1;
    t6 = (0 - 5);
    t17 = (t6 * -1);
    t17 = (t17 + 1);
    t26 = (t25 + 12U);
    *((unsigned int *)t26) = t17;
    t13 = xsi_base_array_concat(t13, t28, t24, (char)97, t2, t29, (char)99, t22, (char)101);
    t17 = (6U + 1U);
    t30 = (7U != t17);
    if (t30 == 1)
        goto LAB10;

LAB11:    t26 = (t0 + 3456);
    t27 = (t26 + 56U);
    t31 = *((char **)t27);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    memcpy(t33, t13, 7U);
    xsi_driver_first_trans_fast(t26);
    goto LAB8;

LAB10:    xsi_size_not_matching(7U, t17, 0);
    goto LAB11;

}


extern void work_a_2704071536_1516540902_init()
{
	static char *pe[] = {(void *)work_a_2704071536_1516540902_p_0};
	xsi_register_didat("work_a_2704071536_1516540902", "isim/sim_isim_beh.exe.sim/work/a_2704071536_1516540902.didat");
	xsi_register_executes(pe);
}

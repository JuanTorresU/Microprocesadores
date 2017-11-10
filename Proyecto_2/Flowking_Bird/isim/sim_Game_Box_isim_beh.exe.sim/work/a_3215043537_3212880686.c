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
static const char *ng0 = "C:/Users/juano/Documents/GitHub/Microprocesadores/Proyecto_2/Flowking_Bird/VGA.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

unsigned char ieee_p_3620187407_sub_2546382208_3965413181(char *, char *, char *, int );
unsigned char ieee_p_3620187407_sub_2546418145_3965413181(char *, char *, char *, int );
unsigned char ieee_p_3620187407_sub_2546454082_3965413181(char *, char *, char *, int );
char *ieee_p_3620187407_sub_436279890_3965413181(char *, char *, char *, char *, int );


static void work_a_3215043537_3212880686_p_0(char *t0)
{
    char t17[16];
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
    unsigned char t12;
    unsigned char t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t18;
    unsigned int t19;

LAB0:    xsi_set_current_line(26, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 5688);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(27, ng0);
    t1 = xsi_get_transient_memory(11U);
    memset(t1, 0, 11U);
    t5 = t1;
    memset(t5, (unsigned char)2, 11U);
    t6 = (t0 + 5880);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 11U);
    xsi_driver_first_trans_fast(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(29, ng0);
    t2 = (t0 + 2152U);
    t6 = *((char **)t2);
    t2 = (t0 + 9468U);
    t13 = ieee_p_3620187407_sub_2546418145_3965413181(IEEE_P_3620187407, t6, t2, 1600);
    if (t13 != 0)
        goto LAB10;

LAB12:    xsi_set_current_line(32, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 9468U);
    t5 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t17, t2, t1, 1);
    t6 = (t17 + 12U);
    t18 = *((unsigned int *)t6);
    t19 = (1U * t18);
    t3 = (11U != t19);
    if (t3 == 1)
        goto LAB13;

LAB14:    t7 = (t0 + 5880);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t14 = *((char **)t10);
    memcpy(t14, t5, 11U);
    xsi_driver_first_trans_fast(t7);

LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t11 = *((unsigned char *)t5);
    t12 = (t11 == (unsigned char)3);
    t3 = t12;
    goto LAB9;

LAB10:    xsi_set_current_line(30, ng0);
    t7 = xsi_get_transient_memory(11U);
    memset(t7, 0, 11U);
    t8 = t7;
    memset(t8, (unsigned char)2, 11U);
    t9 = (t0 + 5880);
    t10 = (t9 + 56U);
    t14 = *((char **)t10);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 11U);
    xsi_driver_first_trans_fast(t9);
    goto LAB11;

LAB13:    xsi_size_not_matching(11U, t19, 0);
    goto LAB14;

}

static void work_a_3215043537_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(37, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 9468U);
    t3 = ieee_p_3620187407_sub_2546418145_3965413181(IEEE_P_3620187407, t2, t1, 1600);
    if (t3 != 0)
        goto LAB3;

LAB4:
LAB5:    t9 = (t0 + 5944);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = (unsigned char)2;
    xsi_driver_first_trans_fast(t9);

LAB2:    t14 = (t0 + 5704);
    *((int *)t14) = 1;

LAB1:    return;
LAB3:    t4 = (t0 + 5944);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast(t4);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_3215043537_3212880686_p_2(char *t0)
{
    char t20[16];
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
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    unsigned char t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned int t21;
    unsigned int t22;

LAB0:    xsi_set_current_line(41, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 5720);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(42, ng0);
    t1 = xsi_get_transient_memory(10U);
    memset(t1, 0, 10U);
    t5 = t1;
    memset(t5, (unsigned char)2, 10U);
    t6 = (t0 + 6008);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 10U);
    xsi_driver_first_trans_fast(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 2472U);
    t6 = *((char **)t2);
    t13 = *((unsigned char *)t6);
    t14 = (t13 == (unsigned char)3);
    if (t14 != 0)
        goto LAB10;

LAB12:    xsi_set_current_line(50, ng0);

LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t11 = *((unsigned char *)t5);
    t12 = (t11 == (unsigned char)3);
    t3 = t12;
    goto LAB9;

LAB10:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 2312U);
    t7 = *((char **)t2);
    t2 = (t0 + 9484U);
    t15 = ieee_p_3620187407_sub_2546418145_3965413181(IEEE_P_3620187407, t7, t2, 525);
    if (t15 != 0)
        goto LAB13;

LAB15:    xsi_set_current_line(48, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 9484U);
    t5 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t20, t2, t1, 1);
    t6 = (t20 + 12U);
    t21 = *((unsigned int *)t6);
    t22 = (1U * t21);
    t3 = (10U != t22);
    if (t3 == 1)
        goto LAB16;

LAB17:    t7 = (t0 + 6008);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t16 = *((char **)t10);
    memcpy(t16, t5, 10U);
    xsi_driver_first_trans_fast(t7);

LAB14:    goto LAB11;

LAB13:    xsi_set_current_line(46, ng0);
    t8 = xsi_get_transient_memory(10U);
    memset(t8, 0, 10U);
    t9 = t8;
    memset(t9, (unsigned char)2, 10U);
    t10 = (t0 + 6008);
    t16 = (t10 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t8, 10U);
    xsi_driver_first_trans_fast(t10);
    goto LAB14;

LAB16:    xsi_size_not_matching(10U, t22, 0);
    goto LAB17;

}

static void work_a_3215043537_3212880686_p_3(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(56, ng0);
    t2 = (t0 + 2152U);
    t3 = *((char **)t2);
    t2 = (t0 + 9468U);
    t4 = ieee_p_3620187407_sub_2546454082_3965413181(IEEE_P_3620187407, t3, t2, 1320);
    if (t4 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB8:    t13 = (t0 + 6072);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((unsigned char *)t17) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t13);

LAB2:    t18 = (t0 + 5736);
    *((int *)t18) = 1;

LAB1:    return;
LAB3:    t8 = (t0 + 6072);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t8);
    goto LAB2;

LAB5:    t5 = (t0 + 2152U);
    t6 = *((char **)t5);
    t5 = (t0 + 9468U);
    t7 = ieee_p_3620187407_sub_2546382208_3965413181(IEEE_P_3620187407, t6, t5, 1512);
    t1 = t7;
    goto LAB7;

LAB9:    goto LAB2;

}

static void work_a_3215043537_3212880686_p_4(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(57, ng0);
    t2 = (t0 + 2312U);
    t3 = *((char **)t2);
    t2 = (t0 + 9484U);
    t4 = ieee_p_3620187407_sub_2546454082_3965413181(IEEE_P_3620187407, t3, t2, 493);
    if (t4 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB8:    t13 = (t0 + 6136);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((unsigned char *)t17) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t13);

LAB2:    t18 = (t0 + 5752);
    *((int *)t18) = 1;

LAB1:    return;
LAB3:    t8 = (t0 + 6136);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t8);
    goto LAB2;

LAB5:    t5 = (t0 + 2312U);
    t6 = *((char **)t5);
    t5 = (t0 + 9484U);
    t7 = ieee_p_3620187407_sub_2546382208_3965413181(IEEE_P_3620187407, t6, t5, 496);
    t1 = t7;
    goto LAB7;

LAB9:    goto LAB2;

}

static void work_a_3215043537_3212880686_p_5(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(60, ng0);

LAB3:    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 6200);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 11U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 5768);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3215043537_3212880686_p_6(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(61, ng0);

LAB3:    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 6264);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 10U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 5784);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3215043537_3212880686_p_7(char *t0)
{
    char t9[16];
    char t11[16];
    char t16[16];
    char t23[16];
    char t25[16];
    char *t1;
    char *t3;
    char *t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    char *t8;
    char *t10;
    char *t12;
    char *t13;
    int t14;
    unsigned int t15;
    char *t17;
    int t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t24;
    char *t26;
    char *t27;
    int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned char t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;

LAB0:    xsi_set_current_line(63, ng0);

LAB3:    t1 = (t0 + 9532);
    t3 = (t0 + 2312U);
    t4 = *((char **)t3);
    t5 = (9 - 5);
    t6 = (t5 * 1U);
    t7 = (0 + t6);
    t3 = (t4 + t7);
    t10 = ((IEEE_P_2592010699) + 4024);
    t12 = (t11 + 0U);
    t13 = (t12 + 0U);
    *((int *)t13) = 0;
    t13 = (t12 + 4U);
    *((int *)t13) = 0;
    t13 = (t12 + 8U);
    *((int *)t13) = 1;
    t14 = (0 - 0);
    t15 = (t14 * 1);
    t15 = (t15 + 1);
    t13 = (t12 + 12U);
    *((unsigned int *)t13) = t15;
    t13 = (t16 + 0U);
    t17 = (t13 + 0U);
    *((int *)t17) = 5;
    t17 = (t13 + 4U);
    *((int *)t17) = 0;
    t17 = (t13 + 8U);
    *((int *)t17) = -1;
    t18 = (0 - 5);
    t15 = (t18 * -1);
    t15 = (t15 + 1);
    t17 = (t13 + 12U);
    *((unsigned int *)t17) = t15;
    t8 = xsi_base_array_concat(t8, t9, t10, (char)97, t1, t11, (char)97, t3, t16, (char)101);
    t17 = (t0 + 2152U);
    t19 = *((char **)t17);
    t15 = (10 - 6);
    t20 = (t15 * 1U);
    t21 = (0 + t20);
    t17 = (t19 + t21);
    t24 = ((IEEE_P_2592010699) + 4024);
    t26 = (t25 + 0U);
    t27 = (t26 + 0U);
    *((int *)t27) = 6;
    t27 = (t26 + 4U);
    *((int *)t27) = 0;
    t27 = (t26 + 8U);
    *((int *)t27) = -1;
    t28 = (0 - 6);
    t29 = (t28 * -1);
    t29 = (t29 + 1);
    t27 = (t26 + 12U);
    *((unsigned int *)t27) = t29;
    t22 = xsi_base_array_concat(t22, t23, t24, (char)97, t8, t9, (char)97, t17, t25, (char)101);
    t29 = (1U + 6U);
    t30 = (t29 + 7U);
    t31 = (14U != t30);
    if (t31 == 1)
        goto LAB5;

LAB6:    t27 = (t0 + 6328);
    t32 = (t27 + 56U);
    t33 = *((char **)t32);
    t34 = (t33 + 56U);
    t35 = *((char **)t34);
    memcpy(t35, t22, 14U);
    xsi_driver_first_trans_fast_port(t27);

LAB2:    t36 = (t0 + 5800);
    *((int *)t36) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(14U, t30, 0);
    goto LAB6;

}


extern void work_a_3215043537_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3215043537_3212880686_p_0,(void *)work_a_3215043537_3212880686_p_1,(void *)work_a_3215043537_3212880686_p_2,(void *)work_a_3215043537_3212880686_p_3,(void *)work_a_3215043537_3212880686_p_4,(void *)work_a_3215043537_3212880686_p_5,(void *)work_a_3215043537_3212880686_p_6,(void *)work_a_3215043537_3212880686_p_7};
	xsi_register_didat("work_a_3215043537_3212880686", "isim/sim_Game_Box_isim_beh.exe.sim/work/a_3215043537_3212880686.didat");
	xsi_register_executes(pe);
}

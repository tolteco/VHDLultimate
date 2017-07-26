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
static const char *ng0 = "C:/Users/JFPS/Documents/GitHub/VHDLultimate/SE/VHDLAdderMultiplier/MultiplicadorSomador8.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1258338084_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_2835018339_3212880686_p_0(char *t0)
{
    char *t1;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(92, ng0);

LAB3:    t1 = (t0 + 13100);
    t3 = (t0 + 6560);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 2U);
    xsi_driver_first_trans_fast(t3);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_2835018339_3212880686_p_1(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned int t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned char t19;
    char *t20;

LAB0:    xsi_set_current_line(144, ng0);
    t1 = (t0 + 1312U);
    t2 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 6480);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(145, ng0);
    t3 = (t0 + 2152U);
    t4 = *((char **)t3);
    t3 = (t0 + 4808U);
    t5 = *((char **)t3);
    t6 = 1;
    if (16U == 16U)
        goto LAB8;

LAB9:    t6 = 0;

LAB10:    if (t6 != 0)
        goto LAB5;

LAB7:    t1 = (t0 + 3112U);
    t3 = *((char **)t1);
    t1 = (t0 + 4808U);
    t4 = *((char **)t1);
    t2 = 1;
    if (16U == 16U)
        goto LAB16;

LAB17:    t2 = 0;

LAB18:    if (t2 != 0)
        goto LAB14;

LAB15:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(146, ng0);
    t9 = (t0 + 4808U);
    t10 = *((char **)t9);
    t9 = (t0 + 6624);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t10, 16U);
    xsi_driver_first_trans_fast_port(t9);
    goto LAB6;

LAB8:    t7 = 0;

LAB11:    if (t7 < 16U)
        goto LAB12;
    else
        goto LAB10;

LAB12:    t3 = (t4 + t7);
    t8 = (t5 + t7);
    if (*((unsigned char *)t3) != *((unsigned char *)t8))
        goto LAB9;

LAB13:    t7 = (t7 + 1);
    goto LAB11;

LAB14:    xsi_set_current_line(148, ng0);
    t8 = (t0 + 1992U);
    t9 = *((char **)t8);
    t15 = (15 - 15);
    t16 = (t15 * -1);
    t17 = (1U * t16);
    t18 = (0 + t17);
    t8 = (t9 + t18);
    t6 = *((unsigned char *)t8);
    t19 = (t6 == (unsigned char)3);
    if (t19 != 0)
        goto LAB22;

LAB24:    xsi_set_current_line(151, ng0);
    t1 = (t0 + 2792U);
    t3 = *((char **)t1);
    t1 = (t0 + 6624);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t8 = (t5 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t3, 16U);
    xsi_driver_first_trans_fast_port(t1);

LAB23:    goto LAB6;

LAB16:    t7 = 0;

LAB19:    if (t7 < 16U)
        goto LAB20;
    else
        goto LAB18;

LAB20:    t1 = (t3 + t7);
    t5 = (t4 + t7);
    if (*((unsigned char *)t1) != *((unsigned char *)t5))
        goto LAB17;

LAB21:    t7 = (t7 + 1);
    goto LAB19;

LAB22:    xsi_set_current_line(149, ng0);
    t10 = (t0 + 2472U);
    t11 = *((char **)t10);
    t10 = (t0 + 6624);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t20 = *((char **)t14);
    memcpy(t20, t11, 16U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB23;

}


extern void work_a_2835018339_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2835018339_3212880686_p_0,(void *)work_a_2835018339_3212880686_p_1};
	xsi_register_didat("work_a_2835018339_3212880686", "isim/tb_mult_isim_beh.exe.sim/work/a_2835018339_3212880686.didat");
	xsi_register_executes(pe);
}

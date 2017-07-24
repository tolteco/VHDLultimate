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

LAB0:    xsi_set_current_line(83, ng0);

LAB3:    t1 = (t0 + 12640);
    t3 = (t0 + 6400);
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
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned char t7;
    unsigned int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(123, ng0);
    t2 = (t0 + 1312U);
    t3 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t2, 0U, 0U);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 6320);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(124, ng0);
    t10 = (t0 + 3112U);
    t11 = *((char **)t10);
    t10 = (t0 + 6464);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t11, 16U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB3;

LAB5:    t4 = (t0 + 3272U);
    t5 = *((char **)t4);
    t4 = (t0 + 4648U);
    t6 = *((char **)t4);
    t7 = 1;
    if (16U == 16U)
        goto LAB8;

LAB9:    t7 = 0;

LAB10:    t1 = t7;
    goto LAB7;

LAB8:    t8 = 0;

LAB11:    if (t8 < 16U)
        goto LAB12;
    else
        goto LAB10;

LAB12:    t4 = (t5 + t8);
    t9 = (t6 + t8);
    if (*((unsigned char *)t4) != *((unsigned char *)t9))
        goto LAB9;

LAB13:    t8 = (t8 + 1);
    goto LAB11;

}


extern void work_a_2835018339_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2835018339_3212880686_p_0,(void *)work_a_2835018339_3212880686_p_1};
	xsi_register_didat("work_a_2835018339_3212880686", "isim/tb_mult_isim_beh.exe.sim/work/a_2835018339_3212880686.didat");
	xsi_register_executes(pe);
}

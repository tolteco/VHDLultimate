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
static const char *ng0 = "C:/Users/JFPS/Documents/GitHub/VHDLultimate/SE/VHDLAdderMultiplier/Reg.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1258338084_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_1732191779_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(18, ng0);

LAB3:    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 3616);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 3520);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1732191779_3212880686_p_1(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    unsigned char t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(22, ng0);
    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 3536);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(23, ng0);
    t7 = (t0 + 1032U);
    t8 = *((char **)t7);
    t9 = *((unsigned char *)t8);
    t7 = (t0 + 3680);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = t9;
    xsi_driver_first_trans_delta(t7, 0U, 1, 8000LL);
    t14 = (t0 + 3680);
    xsi_driver_intertial_reject(t14, 8000LL, 8000LL);
    goto LAB3;

LAB5:    t2 = (t0 + 1152U);
    t6 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t2, 0U, 0U);
    t1 = t6;
    goto LAB7;

}


extern void work_a_1732191779_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1732191779_3212880686_p_0,(void *)work_a_1732191779_3212880686_p_1};
	xsi_register_didat("work_a_1732191779_3212880686", "isim/tb_u_mult_isim_beh.exe.sim/work/a_1732191779_3212880686.didat");
	xsi_register_executes(pe);
}

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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    work_a_1959069323_3212880686_init();
    work_a_3798783386_3212880686_init();
    work_a_1153420228_3212880686_init();
    work_a_3386528679_3212880686_init();
    work_a_2081461157_3212880686_init();
    work_a_1948088636_3212880686_init();
    work_a_2389725926_3212880686_init();
    work_a_3521255095_3212880686_init();
    work_a_3105833659_3212880686_init();
    work_a_0598895731_3212880686_init();
    work_a_4271842915_3212880686_init();
    work_a_1278465592_3212880686_init();
    work_a_1732191779_3212880686_init();
    work_a_2092195719_3212880686_init();
    work_a_1231996903_3212880686_init();
    work_a_3676351843_3212880686_init();


    xsi_register_tops("work_a_3676351843_3212880686");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");

    return xsi_run_simulation(argc, argv);

}

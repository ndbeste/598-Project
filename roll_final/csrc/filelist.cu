CU_MOD_OBJS =  \
objs/rh1Rm_d.o objs/Wby01_d.o objs/kdWLs_d.o objs/axrid_d.o objs/bCQEN_d.o  \
objs/j5MKC_d.o objs/reYIK_d.o objs/HPPym_d.o amcQwB.o objs/amcQw_d.o  \
objs/z40MJ_d.o objs/b9Nxj_d.o objs/SeF8F_d.o 

CU_MOD_C_OBJS =  \


$(CU_MOD_C_OBJS): %.o: %.c
	$(CC_CG) $(CFLAGS_CG) -c -o $@ $<
CU_UDP_OBJS = \


CU_LVL_OBJS = \
SIM_l.o 

CU_OBJS = $(CU_MOD_OBJS) $(CU_MOD_C_OBJS) $(CU_UDP_OBJS) $(CU_LVL_OBJS)


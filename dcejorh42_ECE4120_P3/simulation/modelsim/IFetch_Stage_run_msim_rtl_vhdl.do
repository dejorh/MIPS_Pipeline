transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/PC_reg_package.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/Adder32.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/Adder32_package.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/proctypes_package.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/decoder5_to_32.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/decoder5to32_package.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/Reg32en.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/Reg32en_package.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/mux_2to1.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/mux2to1_package.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/mux4to1_package.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/mux32to1_package.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/SignExtend.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/SignExtend_package.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/alu_1.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/ALU_package.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/Control.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/ALU_Control.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/ALUcontrol_package.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/Control_package.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/ShiftLeft_2.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/ShiftLeft2_package.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/IF_ID_package.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/ID_EX_REG.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/ID_EX_package.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/EX_MEM_REG.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/EX_MEM_package.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/MEM_WB_REG.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/MEM_WB_package.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/FWD_Unit.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/FWD_Unit_package.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/Hazard_Detect.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/HDU_1_package.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/Hazard_Detect_2.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/HDU_2_package.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/I_Mem.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/I_Mem_package.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/D_Mem.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/D_Mem_package.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/mux32.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/mux32_package.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/Reg_Bank_32.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/RegBank32_package.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/mux_4to1.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/WriteUnit_package.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/ReadUnit_package.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/RegisterFile_package.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/IF_ID_REG.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/WriteUnit.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/ReadUnit.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/RegisterFile.vhd}
vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/MIPS_Pipeline.vhd}

vcom -93 -work work {/home/dennisejorh/Documents/Project_pt1/TB_MIPS_Pipe.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  TB_MIPS_Pipe

add wave *
view structure
view signals
run 3 us

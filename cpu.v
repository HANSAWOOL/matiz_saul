`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:37:34 07/26/2018 
// Design Name: 
// Module Name:    cpu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module cpu(
input clk_from_external,
input [31:0] inputdata_from_external_bus,
input reset_from_external,
input interrupt_from_external,

output  [31:0] outputdata_to_external_bus,
output  [31:0] address_to_external_bus_from_cpu,
output  [3:0] control_output_to_external_bus,
output  interrupt_grant_from_pc
);


//reg control_output_to_external_bus = 0;    /// =====================          
//reg outputdata_to_external_bus =0;


	
//pc
//wire [31:0] address_add_offset_shift;
//wire branch_or_not;
wire [31:0] pc_4;
wire [31:0] address_from_pc;


assign pc_4 = address_from_pc + 32'b00000000_00000000_00000000_00000100;

// cpu_io
//wire clk_from_external_for_cpu_io ;
//wire [31:0] address_from_pc_for_cpu_io;
//wire [31:0] address_from_alu_for_cpu_io;
//wire [31:0] data_from_register_value_2_for_cpu_io;
//wire [31:0] data_from_bus_for_cpu_io;
//wire memwrite_from_control_for_cpu_io;

wire [31:0] address_to_bus_for_cpu_io;
wire [31:0] data_to_bus_for_cpu_io;
wire [31:0] data_to_cpu_for_cpu_io;
wire [3:0] control_to_bus_for_cpu_io;



//control
//wire [5:0] opcode_for_control;

//wire branch_from_control;
//wire wb_from_control;
//wire jal_from_control;
//wire jalr_from_control;
//wire reg_write_from_control;
//wire reg_write_mux_from_control;
//wire mem_write_from_control;
//wire alu_input_mux_from_control;
//wire store_from_control;
//wire i_type_from_control;
//wire s_type_from_control;
//wire b_type_from_control;
//wire j_type_from_control;
//wire u_type_from_control;

// register
//wire [4:0] reg1_for_register;
//wire [4:0] reg2_for_register;
//wire [4:0] write_register_address;
//wire write_for_register;  // write control  
//wire reset_for_register;  //  reset  
//wire [31:0]write_data_to_register;

//wire[4:0] output_from_reg_address_write_mux;

wire [31:0]register_value_1;
wire [31:0]register_value_2;
//wire [31:0] filtered_rs2_out;
//wire [31:0] filtered_reg_write;

// makeoffset 
//wire [25:0] instruction_for_makeoffset;
//wire I_type_for_makeoffset;
//wire S_type_for_makeoffset;
//wire B_type_for_makeoffset;
//wire U_type_for_makeoffset;
//wire J_type_for_makeoffset;

wire [31:0] offset;


//alu control
//wire [6:0] alu_control_funct7;
//wire [2:0] alu_control_funct3;

wire [3:0] alu_control_from_control;

// alu
//wire [31:0]input1_for_alu;
//wire [31:0]input2_for_allu;
//wire [2:0]alu_control_for_alu;
 
//wire zero ; 
wire [31:0]result_from_alu;

// regwrite_mux 
//wire [31:0]pc_4_for_regwire_mux;
//wire [31:0]load_data_for_regwrite_mux;
//wire jal_for_regwrite_mux;

wire [31:0]regwrite_mux_dataout;

// input_alu_mux
//wire [31:0] register_value_2_for_alu_mux;
//wire [31:0] offset_for_alu_mux;
//wire select_for_alu_mux;
 
//wire [31:0]dataout_from_alu_mux;

// load_mux
//wire [31:0] data_from_alu_result_for_load_mux ;
//wire [31:0] data_from_mem_for_load_mux ;
//wire wb_from_control_for_load_mux ;

wire [31:0] load_mux_dataout;


//wire use_at_reg_address_write_mux_selector;


//assign use_at_reg_address_write_mux_selector = ( jal_from_control | jalr_from_control ) ;
//  fetch  
//assign address_add_offset_shift = address_from_pc + (offset << 1 );
//assign branch_or_not = (branch_from_control & zero );

//assign branch_address_for_pc = address_add_offset_shift_2;
//assign jumpoffset_for_pc = offset ;
//assign jalr_address_for_pc = result_from_alu;
//assign branch_for_pc = branch_or_not;


//assign reg1_for_register = data_to_cpu_for_cpu_io [19:15];
//assign reg2_for_register = data_to_cpu_for_cpu_io [30:24];
//assign opcode_for_control = data_to_cpu_for_cpu_io [6:0];
//assign instruction_for_makeoffset = data_to_cpu_for_cpu_io [31:7];
//assign write_register_address = data_to_cpu_for_cpu_io [11:7];
//assign alu_control_funct7 = data_to_cpu_for_cpu_io[31:25];
//assign alu_control_funct3 = data_to_cpu_for_cpu_io[14:12];
//assign write_data_to_register = regwrite_mux_dataout;
//assign write_for_register = reg_write_from_control;  // control moudule   
//assign reset_for_register = reset_from_external;   // reset  cpu  .
//assign I_type_for_makeoffset = i_type_from_control;
//assign S_type_for_makeoffset = s_type_from_control;
//assign B_type_for_makeoffset = b_type_from_control;
//assign U_type_for_makeoffset = u_type_from_control;
//assign J_type_for_makeoffset = j_type_from_control;
//assign load_data_for_regwrite_mux = load_mux_dataout;
//assign jal_for_regwrite_mux = jal_from_control;
//assign pc_4_for_regwire_mux = pc_4;
//-------------------------------------------------
//assign register_value_2_for_alu_mux = register_value_2;
//assign offset_for_alu_mux = offset;
//assign select_for_alu_mux = alu_input_mux_from_control;
//assign input2_for_allu =  dataout_from_alu_mux;
//assign input1_for_alu = register_value_1;
//assign alu_control_for_alu = alu_control;
//assign   = result_from_alu;



//assign data_from_bus_for_cpu_io = inputdata_from_external_bus;
//assign clk_from_external_for_cpu_io = clk_from_external;
//assign address_from_pc_for_cpu_io =  address_from_pc;
//assign address_from_alu_for_cpu_io = result_from_alu;
//assign data_from_register_value_2_for_cpu_io = register_value_2;
//assign memwrite_from_control_for_cpu_io =                                               ////--------    

assign address_to_external_bus_from_cpu = address_to_bus_for_cpu_io ;
assign  outputdata_to_external_bus = data_to_bus_for_cpu_io ;
// assign  inputdata_from_bus = data_to_cpu_for_cpu_io ;
assign  control_output_to_external_bus = control_to_bus_for_cpu_io ;
//assign interrupt_grant = interrupt_grant_from_pc ;
//assign data_from_alu_result_for_load_mux = result_from_alu ;
//assign data_from_mem_for_load_mux = data_to_cpu_for_cpu_io;
//assign wb_from_control_for_load_mux = wb_from_control;



	cpu_pc cpu_pc_module (
		.clk(clk_from_external), 
		.offset(offset),
		//.useoffset(useoffset_from_control),
		.reset(reset_from_external),
		.interrupt(interrupt_from_external),
		.branch(branch_from_control),
		.zero(zero),
		.jal(jal_from_control),
		.jalr(jalr_from_control),
		.result_from_alu(result_from_alu),
		
		.pc(address_from_pc),
		.interrupt_grant(interrupt_grant_from_pc)
	);
	

	mux regwrite_mux (
			.inputdata_0(pc_4), 
			.inputdata_1(load_mux_dataout),   // load mux     32 
			.selecter(reg_write_mux_from_control), 
			
			.outputdata(regwrite_mux_dataout)
		);


	cpu_io cpu_io_module (
		.clk(clk_from_external),  // 1 , 2 
		.address_from_pc(address_from_pc),   // 1
		.address_from_alu(result_from_alu),    // 2 
		.data_from_register_value_2(register_value_2),  // 1 
		.data_from_bus(inputdata_from_external_bus),  //  1 , 2 
		.store(store_from_control),  //  2 
		.load(load_from_control),
		.reset(reset_from_external),
		.interrupt(interrupt_from_external),
		
		.address_to_bus(address_to_bus_for_cpu_io),  // 1 , 2 
		.data_to_bus(data_to_bus_for_cpu_io),  //  1 , 2  
		.data_to_cpu(data_to_cpu_for_cpu_io),  //  1
		.control_to_bus(control_to_bus_for_cpu_io) // 1 ,2 
	);


	cpu_reg register (
		//input
		.reg1(data_to_cpu_for_cpu_io [19:15]), 
		.reg2(data_to_cpu_for_cpu_io [24:20]), 
		.write_reg(data_to_cpu_for_cpu_io[11:7]), 
		.write(reg_write_from_control),  // from control 
		.reset(reset_from_external), 
		.write_data(regwrite_mux_dataout),   // wb   
		.store(store_from_control),
		.load(load_from_control),
		.funct3(data_to_cpu_for_cpu_io[14:12]),

		//output
		.read1(register_value_1), 
		.read2(register_value_2)
	);
	


	
	cpu_control cpu_control_module (
		//input
		.instruction(data_to_cpu_for_cpu_io [31:0]), 
		//output
		.branch(branch_from_control), 
		.WB(wb_from_control), 
		.jal(jal_from_control), 
		.jalr(jalr_from_control),
		.reg_write(reg_write_from_control), 
		.reg_wirte_mux(reg_write_mux_from_control), 
		.mem_write(mem_write_from_control), 
		.alu_input_mux(alu_input_mux_from_control), 
		.store(store_from_control), 
		.load(load_from_control),
		//.useoffset(useoffset_from_control),
		.I_type(i_type_from_control), 
		.S_type(s_type_from_control), 
		.B_type(b_type_from_control), 
		.U_type(u_type_from_control), 
		.J_type(j_type_from_control),
		.alu_control(alu_control_from_control),
		.shamt(shamt_from_control),
		.LUI(LUI_from_control),
		.AUIPC(AUIPC_from_control)

	);

	
	cpu_make_offset makeoffset (
		//input
		.instruction(data_to_cpu_for_cpu_io [31:0]), 
		.I_type(i_type_from_control), 
		.S_type(s_type_from_control), 
		.B_type(b_type_from_control), 
		.U_type(u_type_from_control), 
		.J_type(j_type_from_control), 
		.LUI(LUI_from_control),
		.AUIPC(AUIPC_from_control),
		
		//output
		.offset(offset)
	);
	
	//cpu_alu_control alu_control_module (
		//input
	//	.funct7(data_to_cpu_for_cpu_io[31:25]), 
	//	.funct3(data_to_cpu_for_cpu_io[14:12]), 
		//output
	//	.alu_control(alu_control)
	//);

	
	//mux_5bit reg_address_write_mux (
		//input
	//	.inputdata_0(data_to_cpu_for_cpu_io [11:7]), 
	//	.inputdata_1(5'b11111),   
	//	.selecter(use_at_reg_address_write_mux_selector), 
		//output
	//	.outputdata(output_from_reg_address_write_mux)
	//);
	
	
	cpu_alu alu (
		//input
		.rs1(register_value_1), 
		.rs2(register_value_2), 
		.alu_control(alu_control_from_control),
		.offset(offset),
		.input_alu_mux_select(alu_input_mux_from_control),
		.shamt(shamt_from_control),
		.pc(address_from_pc),
		.LUI(LUI_from_control),
		.AUIPC(AUIPC_from_control),
		//output
		.zero(zero), 
		.result(result_from_alu)
	);
	
	
	mux load_mux (
		//input
		.inputdata_0(result_from_alu), 
		.inputdata_1(data_to_cpu_for_cpu_io), 
		.selecter(wb_from_control), 
		//output
		.outputdata(load_mux_dataout)
	);


endmodule

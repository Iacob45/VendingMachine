`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2023 12:01:29 AM
// Design Name: 
// Module Name: test_vendinge_machine
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test_vendinge_machine();
    reg ck_t;
    reg reset_t;
    reg b_t;
    reg m_t;
    wire out_t;
    
    vending_machine dut(.ck(ck_t),.reset(reset_t),.b(b_t),.m(m_t),.out(out_t));
    
    initial begin
        ck_t = 0;
        forever #10 ck_t = ~ck_t;
    end
    
    initial begin
        reset_t = 1;
        b_t = 0;
        m_t = 0;
        #20 reset_t = 0;
        #20 b_t = 1;
        #20 b_t = 0; m_t = 1;
        #20 b_t = 1; m_t = 1;
        #20 b_t = 1; m_t = 0;
        #20 b_t = 0; m_t = 0;
        #20 b_t = 1; m_t = 1;
        
        
        
        #50 $stop;
    end
    

endmodule

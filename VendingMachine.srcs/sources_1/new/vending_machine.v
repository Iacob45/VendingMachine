`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/13/2023 11:32:52 PM
// Design Name: 
// Module Name: vending_machine
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


module vending_machine(
    input ck,
    input reset,
    input b,
    input m,
    output reg out
    );
    
    localparam  q0 = 3'b000, q05 = 3'b001, q1 = 3'b010, q15 = 3'b011,
q2 = 3'b100, q25 = 3'b101;

    reg [2:0]state;
    reg [2:0]next_state;
    
    
    always @ (posedge ck)
        if(reset)
            state <= q0;
        else
            state <= next_state;
    
    
    
    
    
    //CLCQ
    always @ (*)
        case(state)
        q0:
        begin
            if(b && m)
                next_state = q15;
            else if(b)
                next_state = q1;
            else if(m)
                next_state = q05;
            else
                next_state = q0;
        end
        q05:
        begin
            if(b && m)
                next_state = q2;
            else if(b)
                next_state = q15;
            else if(m)
                next_state = q1;
            else
                next_state = q05;
        end
        q1:
        begin
            if(b && m)
                next_state = q25;
            else if(b)
                next_state = q2;
            else if(m)
                next_state = q15;
            else
                next_state = q1;
        end
        q15:
        begin
            if(b && m)
                next_state = q0;
            else if(b)
                next_state = q25;
            else if(m)
                next_state = q2;
            else
                next_state = q15;
        end
        q2:
        begin
            if(b && m)
                next_state = q05;
            else if(b)
                next_state = q0;
            else if(m)
                next_state = q25;
            else
                next_state = q2;
        end
        q25:
        begin
            if(b && m)
                next_state = q1;
            else if(b)
                next_state = q05;
            else if(m)
                next_state = q0;
            else
                next_state = q25;
        end
        default: 
            next_state = q0;
        endcase
    
    
    
    //CLCY
    always @ (posedge ck)
        case(state)
        q0:
            out <= 0;
        q05:
            out <= 0;
        q1:
            out <= 0;
        q15:
            if(b && m)
                out <= 1;
            else
                out <= 0;
        q2:
            if(b && m)
                out <= 1;
            else if(b)
                out <= 1;
            else
                out <= 0;
        q25:
            if(b && m)
                out <= 1;
            else if(b)
                out <= 1;
            else if(m)
                out <= 1;
            else
                out <= 0;
        default: out <= 0;
        endcase
    
endmodule

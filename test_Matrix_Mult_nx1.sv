`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2018 10:41:25 PM
// Design Name: 
// Module Name: test_Matrix_Mult_nx1
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


module test_Matrix_Mult_nx1(

    );
    localparam WIDTH = 16;
    localparam nos = 4;
    localparam ints = 16;
    logic clk, startMult;
    logic [WIDTH-1:0] Fdnk [0:nos-1][0:nos-1];
    logic [WIDTH-1:0] Q [0:nos-1];
    logic [WIDTH-1:0] c [0:nos-1];
    logic endMult;
    
     Matrix_Mult_nx1#(
            WIDTH,
            nos,//number of states
            ints //number of outputs
        ) MM(
        //Inputs
        .clk(clk),
        .startMult(startMult),
        .A(Fdnk),
        .B(Q),
        .Res(c),
        .endMult(endMult)
        );
    always #2  clk = ~clk;
    
    initial begin
        clk=0;
        startMult = 0;
        Fdnk[0][0] = 16'd7; Fdnk[0][1] = 16'd3; Fdnk[0][2] = 16'd9; Fdnk[0][3] = 16'd6;
        Fdnk[1][0] = 16'd1; Fdnk[1][1] = 16'd6; Fdnk[1][2] = 16'd5; Fdnk[1][3] = 16'd2;
        Fdnk[2][0] = 16'd2; Fdnk[2][1] = 16'd4; Fdnk[2][2] = 16'd3; Fdnk[2][3] = 16'd3;
        Fdnk[3][0] = 16'd3; Fdnk[3][1] = 16'd5; Fdnk[3][2] = 16'd5; Fdnk[3][3] = 16'd7;
        
 
        Q[0] = 16'd3;// Q[0][1] = 16'd8; Q[0][2] = 16'd3; Q[0][3] = 16'd3;
        Q[1] = 16'd5;// Q[1][1] = 16'd5; Q[1][2] = 16'd7; Q[1][3] = 16'd5;
        Q[2] = 16'd7;// Q[2][1] = 16'd1; Q[2][2] = 16'd3; Q[2][3] = 16'd7;
        Q[3] = 16'd5;// Q[3][1] = 16'd3; Q[3][2] = 16'd8; Q[3][3] = 16'd3;
        
        
        #3 startMult = 1;
        #20 startMult = 0;
    end
endmodule

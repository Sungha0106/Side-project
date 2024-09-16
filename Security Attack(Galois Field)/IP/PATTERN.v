//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright Laboratory System Integration and Silicon Implementation
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   2020 ICLAB Fall Course
//   Lab06       : GF 2k Arithmetic Soft IP
//   Author      : Tien-Hui Lee (bnfw623@gmail.com)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : PATTERN_IP.v
//   Module Name : PATTERN_IP
//   Release version : v2.0
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################
`define CYCLE_TIME 50.0

module PATTERN_IP #(parameter DEG = 2, parameter OP = 0) (
           // Output signals
           output reg[DEG:0] POLY,
           output reg[DEG-1:0] IN1,
           output reg[DEG-1:0] IN2,
           // Input signals
           input [DEG-1:0] RESULT
       );

//================================================================
// local parameter
//================================================================
integer patdeg,patop;


//================================================================
//   INPUT AND OUTPUT DECLARATION
//================================================================

//================================================================
// clock
//================================================================
reg clk;
real	CYCLE = `CYCLE_TIME;
always	#(CYCLE/2.0) clk = ~clk;
initial
    clk = 0;

//================================================================
//   FILE
//================================================================
integer fin,fout,in_hold,out_hold;
integer patcount,PATNUM,total_latency;
integer SEED = 123;//$urandom_range(2,4);
integer wait_val_time;
integer i,j,iii,jjj;
integer golden_ans;

//================================================================
// pattern
//================================================================


//================================================================
// initial
//================================================================
initial
begin
    fin=$fopen("/home/lab911_1/Desktop/7112064132/Iclab_2021_Fall/ICLAB_06/IP/in.txt","r");
    fout=$fopen("/home/lab911_1/Desktop/7112064132/Iclab_2021_Fall/ICLAB_06/IP/out.txt","r");

    POLY = 'bx;
    IN1 = 'bx;
    IN2 = 'bx;


    repeat(3) @(negedge clk);
    in_hold = $fscanf(fin,"%d",PATNUM);
    in_hold = $fscanf(fin,"%d",patdeg);
    in_hold = $fscanf(fin,"%d",patop);

    for(patcount = 0; patcount < PATNUM; patcount = patcount + 1)
    begin
        input_data;
        repeat(1) @(negedge clk);
        check_ans;
        repeat(3) @(negedge clk);
    end


    YOU_PASS_task;
    repeat(3) @(negedge clk);
    $finish;
end

//================================================================
// task
//================================================================
task input_data;
    begin
        in_hold = $fscanf(fin,"%d",POLY);
        in_hold = $fscanf(fin,"%d",IN1);
        in_hold = $fscanf(fin,"%d",IN2);
    end
endtask

task check_ans;
    begin
        out_hold = $fscanf(fout,"%d",golden_ans);
        if(RESULT!==golden_ans)
        begin
            $display ("-------------------------------------------------------------------");
            $display ("                             FAIL !                                ");
            $display ("                             PATTERN NO.%4d 	                      ", patcount);
            $display ("             answer should be : %d , your answer is : %d           ", golden_ans, RESULT);
            $display ("-------------------------------------------------------------------");
            #(100);
            $finish ;
        end
        else
            $display ("             \033[0;32mPass Pattern NO. %d  | DEG=%d, OP=%d, Gold=%d, RESULT=%d \033[m         ", patcount,DEG,OP,golden_ans,RESULT);
    end
endtask

task YOU_PASS_task;
    begin
        $display ("--------------------------------------------------------------------");
        $display ("          ~( ˘ω˘ )~(๑╹ᆺ╹)~(｡•ᴗ•｡)~(๑╹ᆺ╹)~(*´꒳`*)ﾟ*.・♡            ");
        $display ("                         Congratulations!                           ");
        $display ("                  You have passed all patterns!                     ");
        $display ("--------------------------------------------------------------------");

        #(20);
        $finish;
    end
endtask

endmodule

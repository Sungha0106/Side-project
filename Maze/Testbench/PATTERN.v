
// `ifdef RTL
`timescale 1ns/10ps
// `include "MAZE.v"
`define CYCLE_TIME 10.0
// `endif
// `ifdef GATE
// 	`timescale 1ns/10ps
// 	`include "MAZE_SYN.v"
//     `define CYCLE_TIME 10.0
// `endif

module PATTERN(
           // Output signals
           clk,
           rst_n,
           in_valid,
           in,

           // Input signals
           out_valid,
           out
       );

output reg clk, rst_n, in_valid, in;
input out_valid;
input [1:0] out;	//right:00 down:01 left:10 up:11
//================================================================
// wires & registers
//================================================================
reg xy_map[16:0][16:0];
reg [4:0] current_x , current_y;

//================================================================
// parameters & integer
//================================================================
integer total_cycles;
integer patcount;
integer cycles;
integer b,i;
integer input_file;
integer gap;
integer golden_step;

parameter PATNUM=300;	//patnum
//================================================================
// clock
//================================================================
always	#(`CYCLE_TIME/2.0) clk = ~clk;
initial
    clk = 0;

//================================================================
// initial
//================================================================
initial
begin
    rst_n    = 1'b1;
    in_valid = 1'b0;
    in     =  'dx;

    force clk = 0;
    total_cycles = 0;
    reset_task;			//ALL OUTPUT SHOULD BE RESET TO LOW AFTER THE RESET SIGNAL IS ASSERTED

    input_file=$fopen("/home/lab911_1/Desktop/7111064115/ICLAB_03/input1.txt","r");
    @(negedge clk);  //? NEGATIVE EDGE
    for (patcount=0;patcount<PATNUM;patcount=patcount+1)
    begin	 //PATERN NUMBERS
        input_data;
        check_ans;
        $display("\033[0;34mPASS PATTERN NO.%4d,\033[m \033[0;32m Cycles: %3d\033[m", patcount ,(golden_step + cycles));
        $display ("--------------------------------------------------------------------");
        $display ("          ~(￣▽￣)~(＿△＿)~(￣▽￣)~(＿△＿)~(￣▽￣)~               ");
        $display ("                         Congratulations!                           ");
        $display ("        You have costed\033[0;35m%6d\033[m cycles to pass pattern0!             ",total_cycles);
        $display ("--------------------------------------------------------------------");
    end
    #(4000);
    YOU_PASS_task;
    $finish;
end

//NEXT INPUT WILL COME IN 2~4 CYCLES AFTER YOUR OUT_VALID PULL DOWN
task input_data ;
    begin
        gap = $urandom_range(2,4);
        //repeat(gap)@(negedge clk);
        while(gap !== 0)
        begin
            if(out !== 0)
            begin
                $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
                $display ("                                                     				SPEC 4 IS FAIL!                                                        ");
                $display ("                                                  THE OUT SHOULD BE PULLED DOWN AS OUT_VALID ASSERTED! BAD!          				       ");
                $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
                @(negedge clk);
                $finish;
            end
            gap = gap - 1;
            @(negedge clk);
        end
        in_valid = 'b1;
        for(i=0;i<289;i=i+1)
        begin
            if(out_valid !== 0)
            begin
                $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
                $display ("                                                                       SPEC 5 IS FAIL!                                                      ");
                $display ("                                                  THE OUT_VALID SHOULD BE PULLED DOWN AS IN_VALID ASSERTED                                  ");
                $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
                @(negedge clk);
                // #(`CYCLE_TIME*10);
                $finish ;
            end
            if(out !== 0)
            begin
                $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
                $display ("                                                     				SPEC 4 IS FAIL!                                                        ");
                $display ("                                                  THE OUT SHOULD BE PULLED DOWN AS OUT_VALID ASSERTED! BAD!          					   ");
                $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
                @(negedge clk);
                $finish ;
            end
            b = $fscanf(input_file,"%d",in);
            xy_map[(i/17)][(i%17)] = in;
            @(negedge clk);
        end
        in_valid     = 'b0;
        in        = 'bx;
    end
endtask
//CHECK THE OUTPUT WHETHER ASSERTED TO LOW
task reset_task ;
    begin
        #(10);
        rst_n = 0;
        #(10);
        if((out !== 0) || (out_valid !== 0))
        begin
            $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
            $display ("                                                       SPEC 3 IS FAIL!                                                      ");
            $display ("                                            MY TA IS THE MOST HANDSOME MAN I HAVE SEEN!                                        ");
            $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
            #(100);
            $finish ;
        end
        #(10);
        rst_n = 1 ;
        #(3.0);
        release clk;
    end
endtask
//CHECK THE FROM START TO END WITHOUT HITTING THE WALL
task check_ans;
    begin
        current_x = 0;
        current_y = 0;
        cycles = 0;
        golden_step = 0;
        while(out_valid === 0)
        begin
            cycles = cycles + 1;
            if(out !== 0)
            begin
                $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
                $display ("                                                     				SPEC 4 IS FAIL!                                                        ");
                $display ("                                                  THE OUT SHOULD BE PULLED DOWN AS OUT_VALID ASSERTED! BAD!          					   ");
                $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
                @(negedge clk);
                $finish ;
            end
            if(cycles > 4000)
            begin
                $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
                $display ("                                                                SPEC 6 IS FAIL!                                       					   ");
                $display ("                                                  YOU HAVE COSTED TOO MANY CYCLES! BAD!                                      			   ");
                $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
                @(negedge clk);
                $finish;
            end
            @(negedge clk);
        end
        while(out_valid === 1)
        begin
            golden_step = golden_step + 1;
            case(out)
                2'd0:
                    current_y = current_y + 1;	//RIGHT
                2'd1:
                    current_x = current_x + 1;	//DOWN
                2'd2:
                    current_y = current_y - 1;	//LEFT
                2'd3:
                    current_x = current_x - 1;	//UP
            endcase
            if(xy_map[current_x][current_y] === 0 || current_x > 16 || current_y > 16)
            begin
                $display ("------------------------------------------------------");
                $display ("          			SPEC 7 IS FAIL!           	     ");
                $display ("  	YOU CRUSH THE WALL OR CROSS BOUNDARY! BAD!       ");
                $display ("------------------------------------------------------");
                @(negedge clk);
                $finish;
            end
            if((cycles + golden_step) > 4000)
            begin
                $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
                $display ("                                                                SPEC 6 IS FAIL!                                       					   ");
                $display ("                                                  YOU HAVE COSTED TOO MANY CYCLES! BAD!                                      			   ");
                $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
                @(negedge clk);
                $finish;
            end
            @(negedge clk);
        end
        if((current_x !== 16) || (current_y !== 16))
        begin
            $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
            $display ("                                                                       SPEC 7 IS FAIL!                                                      ");
            $display ("                                                               YOU DIDNT APPROACH THE END! BAD!                                             ");
            $display ("--------------------------------------------------------------------------------------------------------------------------------------------");
            @(negedge clk);
            $finish;
        end
        total_cycles = total_cycles + cycles + golden_step;
    end
endtask
//PASS
task YOU_PASS_task;
    begin
        $display ("--------------------------------------------------------------------");
        $display ("          ~(￣▽￣)~(＿△＿)~(￣▽￣)~(＿△＿)~(￣▽￣)~               ");
        $display ("                         Congratulations!                           ");
        $display ("        You have costed\033[0;35m%6d\033[m cycles to pass all patterns!             ",total_cycles);
        $display ("--------------------------------------------------------------------");

        #(500);
        $finish;
    end
endtask
endmodule


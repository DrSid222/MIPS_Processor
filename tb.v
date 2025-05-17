`timescale 1ns / 1ps
module CPU_tb;
    reg clk;
    reg ex;
    reg [31:0] inst_data;
    reg [9:0] address;
    reg write_instruction, write_data;
    wire [31:0] OutputOfRs;

    // Instantiate the CPU
    cpu uut(
    clk,
    address,
    write_instruction,
    inst_data,
     ex,
    OutputOfRs
);
    // Clock Generation
    always #10 clk = ~clk;
    initial begin
      // This code implements insertion sort of 10 numbers
      // Loading the numbers in data memory at address 0 to 9

        uut.data_mem.Address_locations[0] = 30;
        uut.data_mem.Address_locations[1] = 69;
        uut.data_mem.Address_locations[2] = 12;
        uut.data_mem.Address_locations[3] = 69;
        uut.data_mem.Address_locations[4] = 30;
        uut.data_mem.Address_locations[5] = 12;
        uut.data_mem.Address_locations[6] = 69;
        uut.data_mem.Address_locations[7] = 30;
        uut.data_mem.Address_locations[8] = 12;
        uut.data_mem.Address_locations[9] = 19;

      
        clk = 0;
        ex=0;
        address = 0;
        write_instruction = 0;
        write_data = 0;
        inst_data = 32'b0;

        #10;
        // Write the addi instruction to instruction memory at address 0
        write_instruction = 1;
       
        address = 0;
        // addi $1, $0, 10  ---> initialize n = 10
        inst_data = 32'b001000_00000_00001_0000_0000_0000_1010;
        #20;
        address = 4;
        // addi $2, $0, 1  ---> initialize i = 1
        inst_data = 32'b001000_00000_00010_0000_0000_0000_0001;
        #20;
// outer loop
        address = 8;
        //bgte $2, $1, 13  ---> if i > n, jump to end
        inst_data = {6'b010000, 5'd2, 5'd1, 16'd13};
        #20;
        address = 12;
        // lw $3, 0($2)  ---> $3 = a[i]
        inst_data = 32'h8C430000;
        #20;
        address = 16;
        // addi $6, $3, 0  ---> key = a[i]
       inst_data = 32'h20660000;
        #20;

        address = 20;
        // addi $4, $2, -1  ---> j = i - 1
        inst_data = 32'h2044FFFF;
        #20;
// inner loop

        address = 24;
        // ble $4, $0, 5 ---> if j < 0, jump to insert
        inst_data = {6'b000001, 5'd4, 5'd0, 16'd5};
        #20;
        address = 28;
        // lw $5, 0($4)  ---> $5 = a[j]
       inst_data = 32'h8C850000;
        #20;
        address = 32;
        // bgte $6, $5, 3  ---> if key >= a[j], jump to insert
            inst_data = 32'h40C50003;
        #20;
        address = 36;
        // sw $5, 1($4)  ---> a[j+1] = a[j]
        inst_data = 32'hAC850001;// ERROR: 4 kaha ayega vo dekhana hai
        #20;
        address = 40;
        // addi $4, $4, -1  ---> j = j - 1
        inst_data = 32'h2084FFFF;
        #20;
        address = 44;
        // j 6 ---> jump to inner loop
        inst_data = 32'h08000006;
        #20;
    // insert block
        address = 48;
        // addi $4, $4, 1  ---> j = j + 1
        inst_data = 32'h20840001;
        #20;
        address = 52;
        // sw $6, 0($4)  ---> a[j+1] = key
        inst_data = 32'hAC860000;
        #20;
        address = 56;
        // addi $2, $2, 1  ---> i = i + 1
        inst_data = 32'h20420001;
        #20;
        address = 60;
        // j 2  ---> jump to outer loop
        inst_data = 32'h08000002;
        #20;
        //end
        address = 64;
        // addi $1, $0, 0  ---> n = 0
        inst_data = 32'h20010000;
        #20;

        #52
        ex = 1;
        write_instruction = 0;
        #60000;
        $display("Array values:");
        for (integer i = 0; i < 10; i = i + 1) begin
            $display("a[%0d] = %d", i, uut.data_mem.Address_locations[i]);
        end

        $finish;
    end
endmodule

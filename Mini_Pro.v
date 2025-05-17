module fp_adder (
    input  [31:0] a,
    input  [31:0] b,
    output reg [31:0] sum
);
    wire        sign_a   = a[31];
    wire [7:0]  exp_a    = a[30:23];
    wire [22:0] frac_a   = a[22:0];
    wire        sign_b   = b[31];
    wire [7:0]  exp_b    = b[30:23];
    wire [22:0] frac_b   = b[22:0];
    wire [23:0] sig_a = (exp_a == 8'b0) ? {1'b0, frac_a} : {1'b1, frac_a};
    wire [23:0] sig_b = (exp_b == 8'b0) ? {1'b0, frac_b} : {1'b1, frac_b};
    wire exp_a_gt_exp_b = (exp_a > exp_b);
    wire [7:0] exp_diff = exp_a_gt_exp_b ? (exp_a - exp_b) : (exp_b - exp_a);
    wire [26:0] aligned_sig_a = exp_a_gt_exp_b ? {sig_a, 3'b000} : ({sig_a, 3'b000} >> exp_diff);
    wire [26:0] aligned_sig_b = exp_a_gt_exp_b ? ({sig_b, 3'b000} >> exp_diff) : {sig_b, 3'b000};
    wire add_op = (sign_a == sign_b);
    wire [27:0] ext_sig_a = {1'b0, aligned_sig_a};
    wire [27:0] ext_sig_b = {1'b0, aligned_sig_b};
    wire [27:0] raw_sum = add_op ? (ext_sig_a + ext_sig_b) : (aligned_sig_a >= aligned_sig_b ? (ext_sig_a - ext_sig_b) : (ext_sig_b - ext_sig_a));
    wire result_sign = add_op ? sign_a : (aligned_sig_a >= aligned_sig_b ? sign_a : sign_b);
    reg [27:0] norm_sig;
    reg [7:0]  norm_exp;
    integer i;

    always @(*) begin
        norm_exp = exp_a_gt_exp_b ? exp_a : exp_b;
        norm_sig = raw_sum;
        if (add_op && norm_sig[27]) begin
            norm_sig = norm_sig >> 1;
            norm_exp = norm_exp + 1;
        end
        else begin
            if (norm_sig[26] == 1'b0 && norm_exp > 0 && norm_sig != 0) begin
                norm_sig = norm_sig << 1;
                norm_exp = norm_exp - 1;
            end
            else begin
                norm_sig = norm_sig;
                norm_exp = norm_exp;
            end
            if (norm_sig[26] == 1'b0 && norm_exp > 0 && norm_sig != 0) begin
                norm_sig = norm_sig << 1;
                norm_exp = norm_exp - 1;
            end
            else begin
                norm_sig = norm_sig;
                norm_exp = norm_exp;
            end
            if (norm_sig[26] == 1'b0 && norm_exp > 0 && norm_sig != 0) begin
                norm_sig = norm_sig << 1;
                norm_exp = norm_exp - 1;
            end
            else begin
                norm_sig = norm_sig;
                norm_exp = norm_exp;
            end
            if (norm_sig[26] == 1'b0 && norm_exp > 0 && norm_sig != 0) begin
                norm_sig = norm_sig << 1;
                norm_exp = norm_exp - 1;
            end
            else begin
                norm_sig = norm_sig;
                norm_exp = norm_exp;
            end
            if (norm_sig[26] == 1'b0 && norm_exp > 0 && norm_sig != 0) begin
                norm_sig = norm_sig << 1;
                norm_exp = norm_exp - 1;
            end
            else begin
                norm_sig = norm_sig;
                norm_exp = norm_exp;
            end
            if (norm_sig[26] == 1'b0 && norm_exp > 0 && norm_sig != 0) begin
                norm_sig = norm_sig << 1;
                norm_exp = norm_exp - 1;
            end
            else begin
                norm_sig = norm_sig;
                norm_exp = norm_exp;
            end
            if (norm_sig[26] == 1'b0 && norm_exp > 0 && norm_sig != 0) begin
                norm_sig = norm_sig << 1;
                norm_exp = norm_exp - 1;
            end
            else begin
                norm_sig = norm_sig;
                norm_exp = norm_exp;
            end
            if (norm_sig[26] == 1'b0 && norm_exp > 0 && norm_sig != 0) begin
                norm_sig = norm_sig << 1;
                norm_exp = norm_exp - 1;
            end
            else begin
                norm_sig = norm_sig;
                norm_exp = norm_exp;
            end
            if (norm_sig[26] == 1'b0 && norm_exp > 0 && norm_sig != 0) begin
                norm_sig = norm_sig << 1;
                norm_exp = norm_exp - 1;
            end
            else begin
                norm_sig = norm_sig;
                norm_exp = norm_exp;
            end
            if (norm_sig[26] == 1'b0 && norm_exp > 0 && norm_sig != 0) begin
                norm_sig = norm_sig << 1;
                norm_exp = norm_exp - 1;
            end
            else begin
                norm_sig = norm_sig;
                norm_exp = norm_exp;
            end
            if (norm_sig[26] == 1'b0 && norm_exp > 0 && norm_sig != 0) begin
                norm_sig = norm_sig << 1;
                norm_exp = norm_exp - 1;
            end
            else begin
                norm_sig = norm_sig;
                norm_exp = norm_exp;
            end
            if (norm_sig[26] == 1'b0 && norm_exp > 0 && norm_sig != 0) begin
                norm_sig = norm_sig << 1;
                norm_exp = norm_exp - 1;
            end
            else begin
                norm_sig = norm_sig;
                norm_exp = norm_exp;
            end
            if (norm_sig[26] == 1'b0 && norm_exp > 0 && norm_sig != 0) begin
                norm_sig = norm_sig << 1;
                norm_exp = norm_exp - 1;
            end
            else begin
                norm_sig = norm_sig;
                norm_exp = norm_exp;
            end
            if (norm_sig[26] == 1'b0 && norm_exp > 0 && norm_sig != 0) begin
                norm_sig = norm_sig << 1;
                norm_exp = norm_exp - 1;
            end
            else begin
                norm_sig = norm_sig;
                norm_exp = norm_exp;
            end
            if (norm_sig[26] == 1'b0 && norm_exp > 0 && norm_sig != 0) begin
                norm_sig = norm_sig << 1;
                norm_exp = norm_exp - 1;
            end
            else begin
                norm_sig = norm_sig;
                norm_exp = norm_exp;
            end
            if (norm_sig[26] == 1'b0 && norm_exp > 0 && norm_sig != 0) begin
                norm_sig = norm_sig << 1;
                norm_exp = norm_exp - 1;
            end
            else begin
                norm_sig = norm_sig;
                norm_exp = norm_exp;
            end
            if (norm_sig[26] == 1'b0 && norm_exp > 0 && norm_sig != 0) begin
                norm_sig = norm_sig << 1;
                norm_exp = norm_exp - 1;
            end
            else begin
                norm_sig = norm_sig;
                norm_exp = norm_exp;
            end
            if (norm_sig[26] == 1'b0 && norm_exp > 0 && norm_sig != 0) begin
                norm_sig = norm_sig << 1;
                norm_exp = norm_exp - 1;
            end
            else begin
                norm_sig = norm_sig;
                norm_exp = norm_exp;
            end
            if (norm_sig[26] == 1'b0 && norm_exp > 0 && norm_sig != 0) begin
                norm_sig = norm_sig << 1;
                norm_exp = norm_exp - 1;
            end
            else begin
                norm_sig = norm_sig;
                norm_exp = norm_exp;
            end
            if (norm_sig[26] == 1'b0 && norm_exp > 0 && norm_sig != 0) begin
                norm_sig = norm_sig << 1;
                norm_exp = norm_exp - 1;
            end
            else begin
                norm_sig = norm_sig;
                norm_exp = norm_exp;
            end
            if (norm_sig[26] == 1'b0 && norm_exp > 0 && norm_sig != 0) begin
                norm_sig = norm_sig << 1;
                norm_exp = norm_exp - 1;
            end
            else begin
                norm_sig = norm_sig;
                norm_exp = norm_exp;
            end
            if (norm_sig[26] == 1'b0 && norm_exp > 0 && norm_sig != 0) begin
                norm_sig = norm_sig << 1;
                norm_exp = norm_exp - 1;
            end
            else begin
                norm_sig = norm_sig;
                norm_exp = norm_exp;
            end
            if (norm_sig[26] == 1'b0 && norm_exp > 0 && norm_sig != 0) begin
                norm_sig = norm_sig << 1;
                norm_exp = norm_exp - 1;
            end
            else begin
                norm_sig = norm_sig;
                norm_exp = norm_exp;
            end
            if (norm_sig[26] == 1'b0 && norm_exp > 0 && norm_sig != 0) begin
                norm_sig = norm_sig << 1;
                norm_exp = norm_exp - 1;
            end
            else begin
                norm_sig = norm_sig;
                norm_exp = norm_exp;
            end
            if (norm_sig[26] == 1'b0 && norm_exp > 0 && norm_sig != 0) begin
                norm_sig = norm_sig << 1;
                norm_exp = norm_exp - 1;
            end
            else begin
                norm_sig = norm_sig;
                norm_exp = norm_exp;
            end
            if (norm_sig[26] == 1'b0 && norm_exp > 0 && norm_sig != 0) begin
                norm_sig = norm_sig << 1;
                norm_exp = norm_exp - 1;
            end
            else begin
                norm_sig = norm_sig;
                norm_exp = norm_exp;
            end
            if (norm_sig[26] == 1'b0 && norm_exp > 0 && norm_sig != 0) begin
                norm_sig = norm_sig << 1;
                norm_exp = norm_exp - 1;
            end
            else begin
                norm_sig = norm_sig;
                norm_exp = norm_exp;
            end
            if (norm_sig[26] == 1'b0 && norm_exp > 0 && norm_sig != 0) begin
                norm_sig = norm_sig << 1;
                norm_exp = norm_exp - 1;
            end
            else begin
                norm_sig = norm_sig;
                norm_exp = norm_exp;
            end
            if (norm_sig[26] == 1'b0 && norm_exp > 0 && norm_sig != 0) begin
                norm_sig = norm_sig << 1;
                norm_exp = norm_exp - 1;
            end
            else begin
                norm_sig = norm_sig;
                norm_exp = norm_exp;
            end
        end
    end
    wire [22:0] final_frac = norm_sig[25:3];
    always @(*) begin
        sum = {result_sign, norm_exp, final_frac};
    end
endmodule

module ieee754_compare (
    input  [31:0] a,
    input  [31:0] b,
    output reg eq,
    output reg lt,
    output reg le,
    output reg gt,
    output reg ge
);
    wire sign_a = a[31];
    wire sign_b = b[31];
    wire [7:0] exp_a = a[30:23];
    wire [7:0] exp_b = b[30:23];
    wire [22:0] frac_a = a[22:0];
    wire [22:0] frac_b = b[22:0];
    // NaN check: exponent = 255 and mantissa != 0
    wire is_nan_a = (exp_a == 8'hFF) && (frac_a != 0);
    wire is_nan_b = (exp_b == 8'hFF) && (frac_b != 0);
    wire is_nan = is_nan_a || is_nan_b;
    // Zero check (treat +0 and -0 as equal)
    wire is_zero_a = (exp_a == 0) && (frac_a == 0);
    wire is_zero_b = (exp_b == 0) && (frac_b == 0);
    wire is_zero_cmp = is_zero_a && is_zero_b;
    always @(*) begin
        // Default all false
        eq = 0;
        lt = 0;
        le = 0;
        gt = 0;
        ge = 0;
        if (is_nan) begin
            // All comparisons with NaN are false
            eq = 0;
            lt = 0;
            le = 0;
            gt = 0;
            ge = 0;
        end
        else if (is_zero_cmp) begin
            // +0 == -0
            eq = 1;
            le = 1;
            ge = 1;
        end
        else if (a == b) begin
            eq = 1;
            le = 1;
            ge = 1;
        end
        else if (sign_a && !sign_b) begin
            // a negative, b positive
            lt = 1;
            le = 1;
        end
        else if (!sign_a && sign_b) begin
            // a positive, b negative
            gt = 1;
            ge = 1;
        end
        else if (!sign_a && !sign_b) begin
            // Both positive
            if (a < b) begin
                lt = 1;
                le = 1;
            end else begin
                gt = 1;
                ge = 1;
            end
        end
        else begin
            // Both negative: higher bit pattern = smaller magnitude
            if (a > b) begin
                lt = 1;
                le = 1;
            end else begin
                gt = 1;
                ge = 1;
            end
        end
    end
endmodule

module DistributedMemory (
 input wire [8:0] a, input wire[8:0] dpra , input we , input clk ,
 input wire [31 : 0] d , output wire [31 : 0] dpo
);
    reg [31:0] Address_locations [1023:0];
    assign dpo = Address_locations[dpra];
    always @(negedge clk) begin
        if(we) begin
            Address_locations[a] = d;
        end
        else begin
            Address_locations[a] = Address_locations[a];
        end
    end
endmodule
module cpu(
    clk,
    a,
    we,
    d,
    ex,
    out
);
    input clk;  // clock
    reg [31:0] ins;        // current instruction being executed
    reg [31:0] pc;
    reg [31:0] rd;         // value to be returned
    reg [4:0]  rd_addr;    // return destination address
    reg [5:0]  alu_op;     // each instruction has a unique alu_op value depending on its opcode and func value
    reg zero;              // output of ALU
    reg [31:0] reg_memory[31:0];     // register memory (32 registers each of size 32 bits)
    reg [4:0]  shamt;      // shift amount
    reg [31:0] ra;         // return address

    input [8:0] a;
    reg [8:0] dpra;
    input we;
    wire [31:0] dpo;
    input ex;
    input [31:0] d;
    reg [8:0] a1, dpra1;
    reg we1;
    wire [31:0] dpo1;
    reg [31:0] d1;
    output [31:0] out;

    assign out = lo;

    dist_mem_gen_0 instruction (
        .a(a),        // input wire [8 : 0] a
        .d(d),        // input wire [31 : 0] d
        .dpra(dpra),  // input wire [8 : 0] dpra
        .clk(clk),    // input wire clk
        .we(we),      // input wire we
        .dpo(dpo)     // output wire [31 : 0] dpo
    );

   DistributedMemory data_mem (
        .a(a1),        // input wire [8 : 0] a
        .d(d1),        // input wire [31 : 0] d
        .dpra(dpra1),  // input wire [8 : 0] dpra
        .clk(clk),     // input wire clk
        .we(we1),      // input wire we
        .dpo(dpo1)     // output wire [31 : 0] dpo
    );
    initial begin
        pc = 0;
        for (integer i = 0; i < 32; i = i + 1) begin
            reg_memory[i] = 0;
        end

       fp_reg[24]=32'b01000000110100000000000000000000;
       fp_reg[18]=32'b01000000000100000000000000000000;
    end

    reg [31:0] arg1, arg2; // argument1 and argument2 of the ALU
    reg [31:0] lo, hi, rd1;
    // Floating Point Register File
    reg [31:0] fp_reg[31:0];
    reg [7:0] fcc;
    wire eq;   // a == b
    wire lt;   // a <  b
    wire le;   // a <= b
    wire gt;   // a >  b
    wire ge;

    ieee754_compare inst(arg1, arg2, eq, lt, le, gt, ge);
    wire[31:0] sum;

    fp_adder inst1(
        arg1,
        arg2,
        sum
    );

    always @(posedge clk&& ex) begin
        // Instruction fetch phase (instruction is fetched from the instruction memory)
        dpra = pc[8:0];
        #0.1ins = dpo;
        pc = pc + 4;  // at every positive edge of the clock, program counter is increased by 4
        // Decoding phase (instruction is decoded according to its opcode and func value)
        case (ins[31:26])
            0: begin
                if (ins[5:0] == 0) begin
                    alu_op = 0;   // sll
                end else if (ins[5:0] == 2) begin
                    alu_op = 1;   // srl
                end else if (ins[5:0] == 3) begin
                    alu_op = 2;   // sra
                end else if (ins[5:0] == 8) begin
                    alu_op = 3;   // jr
                end else if (ins[5:0] == 9) begin
                    alu_op = 4;   // jalr
                end else if (ins[5:0] == 16) begin
                    alu_op = 5;   // mfhi
                end else if (ins[5:0] == 17) begin
                    alu_op = 6;   // mthi
                end else if (ins[5:0] == 18) begin
                    alu_op = 7;   // mflo
                end else if (ins[5:0] == 19) begin
                    alu_op = 8;   // mtlo
                end else if (ins[5:0] == 24) begin
                    alu_op = 9;   // mult
                end else if (ins[5:0] == 25) begin
                    alu_op = 10;  // multu
                end else if (ins[5:0] == 26) begin
                    alu_op = 43;  // div
                end else if (ins[5:0] == 27) begin
                    alu_op = 11;  // divu
                end else if (ins[5:0] == 32) begin
                    alu_op = 12;  // add
                end else if (ins[5:0] == 33) begin
                    alu_op = 13;  // addu
                end else if (ins[5:0] == 34) begin
                    alu_op = 14;  // sub
                end else if (ins[5:0] == 35) begin
                    alu_op = 15;  // subu
                end else if (ins[5:0] == 36) begin
                    alu_op = 16;  // and
                end else if (ins[5:0] == 37) begin
                    alu_op = 17;  // or
                end else if (ins[5:0] == 38) begin
                    alu_op = 18;  // xor
                end else if (ins[5:0] == 39) begin
                    alu_op = 19;  // nor
                end else if (ins[5:0] == 42) begin
                    alu_op = 20;  // slt
                end
            end
            1: begin
                alu_op = 21;    // blt
            end
            2: begin
                alu_op = 22;    // j
            end
            3: begin
                alu_op = 23;    // jal
            end
            4: begin
                alu_op = 25;    // beq
            end
            5: begin
                alu_op = 26;    // bne
            end
            6: begin
                alu_op = 27;    // ble
            end
            7: begin
                alu_op = 28;    // bgt
            end
            8: begin
                alu_op = 29;    // addi
            end
            9: begin
                alu_op = 30;    // addiu
            end
            10: begin
                alu_op = 31;    // slti
            end
            11: begin
                alu_op = 32;    // sltiu
            end
            12: begin
                alu_op = 33;    // andi
            end
            13: begin
                alu_op = 34;    // ori
            end
            14: begin
                alu_op = 35;    // xori
            end
            15: begin
                alu_op = 36;    // lui
            end
            35: begin
                alu_op = 37;    // lw
            end
            16: begin
                alu_op = 38;    // bge
            end
            17: begin
                alu_op = 39;    // bltu
            end
            18: begin
                alu_op = 40;    // bgtu
            end
            43: begin
                alu_op = 42;    // sw
            end
            19: begin
                case (ins[5:0])
                    6'b100000: alu_op = 54; // mfc1
                    6'b100001: alu_op = 55; // mtc1
                    6'b000000: alu_op = 50; // add.s
                    6'b000001: alu_op = 51; // sub.s
                    6'b100010: alu_op = 56; // c.eq.s
                    6'b100011: alu_op = 57; // c.le.s
                    6'b100100: alu_op = 58; // c.lt.s
                    6'b100101: alu_op = 59; // c.ge.s
                    6'b100110: alu_op = 60; // c.gt.s
                    6'b100111: alu_op = 61; // mov.s cc
                    default:   alu_op = 6'b111111; // undefined
                endcase
            end
        endcase
        // Memory access stage (data is fetched from the main memory and stored conveniently to input into the ALU)
        if (alu_op[5:0] == 5 || alu_op[5:0] == 6 || alu_op[5:0] == 7 ||
            alu_op[5:0] == 8 || alu_op[5:0] == 9 || alu_op[5:0] == 10 ||
            alu_op[5:0] == 43 || alu_op[5:0] == 11 || alu_op[5:0] == 12 ||
            alu_op[5:0] == 13 || alu_op[5:0] == 14 || alu_op[5:0] == 15 ||
            alu_op[5:0] == 16 || alu_op[5:0] == 17 || alu_op[5:0] == 18 ||
            alu_op[5:0] == 19 || alu_op[5:0] == 20) begin
            arg1 = reg_memory[ins[25:21]];
            arg2 = reg_memory[ins[20:16]];
            rd_addr = ins[15:11];
        end else if (alu_op[5:0] == 28 || alu_op[5:0] == 27 ||
                    alu_op[5:0] == 26 || alu_op[5:0] == 25 ||
                    alu_op[5:0] == 21 || alu_op[5:0] == 38 ||
                    alu_op[5:0] == 39 || alu_op[5:0] == 40) begin
            arg1 = reg_memory[ins[25:21]];
            arg2 = reg_memory[ins[20:16]];
        end else if (alu_op[5:0] == 0 || alu_op[5:0] == 2 || alu_op[5:0] == 3) begin
            // Shifting instruction
            arg1 = reg_memory[ins[20:16]];
            shamt = ins[10:6];
        end else if (alu_op[5:0] == 33 || alu_op[5:0] == 34 || alu_op[5:0] == 35) begin
            arg1 = reg_memory[ins[25:21]];
            rd_addr = ins[20:16];
            arg2 = {16'd0, ins[15:0]};
        end else if (alu_op == 50) begin
            // add.s, sub.s
            arg1 = fp_reg[ins[15:11]];
            arg2 = fp_reg[ins[20:16]];
            rd_addr = ins[10:6];

        end else if (alu_op == 51) begin
            // sub.s
            arg1 = fp_reg[ins[15:11]];
            arg2 = {~fp_reg[ins[20:16]][31],fp_reg[ins[20:16]][30:0]};

            rd_addr =ins[10:6];

        end else if (alu_op >= 56 && alu_op <= 60) begin
            // c.eq.s, c.le.s, c.lt.s, c.ge.s, c.gt.s
            arg1 = fp_reg[ins[20:16]];
            arg2 = fp_reg[ins[15:11]];
        end else begin
            arg1 = reg_memory[ins[25:21]];
            rd_addr = ins[20:16];
            if (ins[15] == 1) begin
                arg2 = {16'b1111111111111111, ins[15:0]};
            end else begin
                arg2 = {16'd0, ins[15:0]};
            end
            shamt = ins[10:6];
        end
        // ALU Phase (operation is performed depending on the instruction type)
        case (alu_op)
            0: begin    // sll
                rd = (arg1 << shamt);
                zero = 0;
            end
            2: begin    // srl
                rd = (arg1 >> shamt);
            end
            3: begin    // sra
                rd = (arg1 >>> shamt);
            end
            4: begin    // jr
                zero = 1;
            end
            5: begin    // jalr
                zero = 1;
            end
            9: begin    // mult
                {rd1, rd} = $signed(arg1) * $signed(arg2);
                zero = 0;
            end
            10: begin   // multu
                {rd1, rd} = arg1 * arg2;
                zero = 0;
            end
            43: begin   // div
                rd1 = $signed(arg1) % $signed(arg2);
                rd = $signed(arg1) / $signed(arg2);
                zero = 0;
            end
            11: begin   // divu
                rd1 = arg1 % arg2;
                rd = arg1 / arg2;
                zero = 0;
            end
            12: begin   // add, addu
                rd = arg1 + arg2;
                zero = 0;
            end
            13: begin   // add, addu
                rd = arg1 + arg2;
                zero = 0;
            end
            14: begin   // sub, subu
                rd = arg1 - arg2;
                zero = 0;
            end
            15: begin   // sub, subu
                rd = arg1 - arg2;
                zero = 0;
            end
            16: begin   // and
                rd = arg1 & arg2;
                zero = 0;
            end
            17: begin   // or
                rd = arg1 | arg2;
            end
            18: begin   // xor
                rd = arg1 ^ arg2;
            end
            19: begin   // nor
                rd = ~(arg1 | arg2);
            end
            20: begin   // slt
                if ($signed(arg1) < $signed(arg2)) begin
                    rd = 1;
                end else begin
                    rd = 0;
                end
            end
            21: begin   // blt
                if ($signed(arg1) < $signed(arg2)) begin
                    zero = 1;
                end else begin
                    zero = 0;
                 end
                end
            22: begin   // j
                zero = 1;
              end
            23: begin   // jal
                zero = 1;
              end
            25: begin   // beq
                if (arg1 == arg2) begin
                  zero = 1;
                end else begin
                  zero = 0;
                end
              end
            27: begin   // ble
                if ($signed(arg1) <= $signed(arg2)) begin
                  zero = 1;
                end else begin
                  zero = 0;
                end
              end
            28: begin   // bgt
                if ($signed(arg1) > $signed(arg2)) begin
                  zero = 1;
                end else begin
                  zero = 0;
                end
              end
            6'b011101: begin   // addi, addiu
                rd = arg1 + arg2;
                zero = 0;
              end
            30: begin   // addi, addiu
                rd = arg1 + arg2;
                zero = 0;
              end
            31: begin   // slti
                if ($signed(arg1) < $signed(arg2)) begin
                  rd = 1;
                end else begin
                  rd = 0;
                end
              end
            32: begin   // sltiu
                if (arg1 < arg2) begin
                  rd = 1;
                end else begin
                  rd = 0;
                end
              end
            33: begin   // andi
                rd = arg1 & arg2;
                zero = 0;
              end
            34: begin   // ori
                rd = arg1 | arg2;
              end
            35: begin   // xori
                rd = arg1 ^ arg2;
              end
            36: begin   // lui
                rd = {16'd0, arg2[15:0]};
              end
            37: begin   // lw
                rd = arg1 + arg2;
              end
            38: begin   // bge
                if ($signed(arg1) >= $signed(arg2)) begin
                  zero = 1;
                end else begin
                  zero = 0;
                end
              end
            39: begin   // bltu
                if (arg1 < arg2) begin
                  zero = 1;
                end else begin
                  zero = 0;
                end
              end
            40: begin   // bgtu
                if (arg1 < arg2) begin
                  zero = 1;
                end else begin
                  zero = 0;
                end
              end
            42: begin   // sw
                rd = arg1 + arg2;
              end
            50: begin // add

              rd = sum;

            end
            51: begin // sub

              rd = sum;

            end
            54: begin // mfc1
              // Move from FP to integer

              rd = fp_reg[ins[15:11]];
              rd_addr=ins[20:16];
            end
            55: begin // mtc1
              // Move from integer to FP

              rd = reg_memory[ins[20:16]];
              rd_addr=ins[15:11];
            end
            56: begin // c.eq.s
              // Compare equality: set fcc[cc] = 1 if arg1 == arg2, else 0
            if(eq==1)
            rd= 32'd1;
              else
            rd= 32'd0;
            end
            57: begin // c.le.s
              if(le==1)
            rd= 32'd1;
              else
            rd = 32'd0;
            end
            58: begin // c.lt.s
            if(lt==1)
            rd= 32'd1;
              else
            rd = 32'd0;
            end
            59: begin // c.ge.s
            if(ge==1)
            rd= 32'd1;
              else
            rd = 32'd0;
            end
            60: begin // c.gt.s
            if(gt==1)
            rd= 32'd1;
              else
            rd = 32'd0;
            end
            61: begin // mov.s cc f0, f1

              rd = fp_reg[ins[15:11]];

              rd_addr = ins[20:16]; // leave it unchanged
            end
            default:begin rd=0;end
          endcase
          // Memory write phase (the output from the ALU is written accordingly in the main memory)
          if (alu_op == 3) begin
            pc = reg_memory[ins[25:21]];  // jr

          end else if (alu_op == 4) begin
            ra = pc + 4;                  // ra is set
            pc = reg_memory[ins[25:21]];   // jalr

          end else if (alu_op == 5) begin
            reg_memory[ins[15:11]] = hi;   // mfhi

          end else if (alu_op == 6) begin
            hi = reg_memory[ins[25:21]];   // mthi

          end else if (alu_op == 7) begin
            reg_memory[ins[15:11]] = lo;   // mflo

          end else if (alu_op == 8) begin
            lo = reg_memory[ins[25:21]];   // mtlo

          end else if (alu_op == 9) begin
            hi = rd1;
            lo = rd;                     // mult

          end else if (alu_op == 10) begin
            hi = rd1;
            lo = rd;                     // multu

          end else if (alu_op == 43) begin
            hi = rd1;
            lo = rd;                     // div

          end else if (alu_op == 11) begin
            hi = rd1;
            lo = rd;                     // divu

          end else if (alu_op == 37) begin
            dpra1 = rd;
            #0.01reg_memory[ins[20:16]] = dpo1;  // data is read from the main memory and stored in the register

          end else if (alu_op == 42) begin
            we1 = 1;
            a1 = rd;
            d1 = reg_memory[ins[20:16]];
          end else if (alu_op == 22) begin
            pc = {pc[31:28], (ins[25:0] << 2)};  // j
          end else if (alu_op == 23) begin
            ra = pc + 4;                         // ra is set
            pc = {pc[31:28], (ins[25:0] << 2)};   // jal
            end else if (alu_op == 21 || alu_op == 25 || alu_op == 26 ||
                      alu_op == 27 || alu_op == 28 || alu_op == 38 ||
                      alu_op == 39) begin
            if (zero == 1) begin
              if (ins[15] == 1) begin
                pc = pc - {14'd0, ((~ins[15:0] + 1) << 2)};  // program counter decremented accordingly
              end else begin
                pc = pc + {14'd0, (ins[15:0] << 2)};           // program counter incremented accordingly
              end
            end
            end
           else if (alu_op == 55||alu_op==61||alu_op==54) begin
          fp_reg[rd_addr] = rd;
          end
          else if(alu_op==50||alu_op==51)
          begin
          #0.1 fp_reg[rd_addr] = sum;
          end
          else if (alu_op >= 56 && alu_op <= 60) begin
          fcc = rd[7:0];
          end else begin
            reg_memory[rd_addr] = rd;  // output rd is written to the register specified by rd_addr
          end
        end
      endmodule
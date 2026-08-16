`timescale 1ns/1ps

module sixteenBitALU_tb;

    // DUT inputs
    reg  [15:0] AI, BI;
    reg  [3:0]  SEL;

    // DUT outputs
    wire        COUT, SIGN_BIT, OVERFLOW, ZERO;
    wire [15:0] Result;

    integer errors = 0;

    // Instantiate the DUT 
    sixteenBitALU_TopLevelModule DUT (
        .AI(AI),
        .BI(BI),
        .SEL(SEL),
        .COUT(COUT),
        .SIGN_BIT(SIGN_BIT),
        .OVERFLOW(OVERFLOW),
        .ZERO(ZERO),
        .Result(Result)
    );

    // Task to apply inputs, wait, then check the result
    task run_test;
        input [15:0] a, b;
        input [3:0]  sel;
        input [15:0] expected;
        input [127:0] test_name; // string label
        begin
            AI  = a;
            BI  = b;
            SEL = sel;
            #10; // let signals settle
            if (Result !== expected) begin
                $display("FAIL: %0s | SEL=%b AI=%h BI=%h -> Result=%h (expected %h)",
                           test_name, sel, a, b, Result, expected);
                errors = errors + 1;
            end else begin
                $display("PASS: %0s | SEL=%b AI=%h BI=%h -> Result=%h",
                           test_name, sel, a, b, Result);
            end
        end
    endtask

    initial begin
        $display("---- Starting sixteenBitALU testbench ----");

        // ADDR: SEL = 0000 -> AS=0 -> straight add
        run_test(16'h0005, 16'h0003, 4'b0000, 16'h0008, "ADD 5+3");

        // SUBR: SEL = 0001 -> AS=1 -> subtract
        run_test(16'h0005, 16'h0003, 4'b0001, 16'h0002, "SUB 5-3");

        // ANDR
        run_test(16'hFF00, 16'h0FF0, 4'b0010, 16'h0F00, "AND");

        // ORR
        run_test(16'hFF00, 16'h00FF, 4'b0011, 16'hFFFF, "OR");

        // NOT AR (bitwise NOT of A)
        run_test(16'h0000, 16'h0000, 4'b0110, 16'hFFFF, "NOT A");

        // Pass A
        run_test(16'hABCD, 16'h0000, 4'b1101, 16'hABCD, "PASS A");

        // Pass B
        run_test(16'h0000, 16'h1234, 4'b1110, 16'h1234, "PASS B");

        // Increment A
        run_test(16'h000A, 16'h0000, 4'b1011, 16'h000B, "INCREMENT A");

        // Decrement A
        run_test(16'h000A, 16'h0000, 4'b1100, 16'h0009, "DECREMENT A");

        // Report results
        if (errors == 0)
            $display("---- ALL TESTS PASSED ----");
        else
            $display("---- %0d TEST(S) FAILED ----", errors);

        $finish;
    end

endmodule

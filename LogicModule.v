module LogicModule(
    input [15:0]a,
    input [15:0]b,
    output [15:0]ando,
    output [15:0]oro,
    output [15:0]xoro,
    output [15:0]not_a,
    output [15:0]nando,
    output [15:0]noro
);

    assign ando  = a & b;
    assign oro   = a | b;
    assign not_a = ~a;
    assign nando = ~(a & b);
    assign noro  = ~(a | b);
    assign xoro  = a ^ b;

endmodule

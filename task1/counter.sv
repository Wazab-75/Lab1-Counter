module counter #(
    parameter WIDTH = 8
)(
    input logic         clk,
    input logic         rst,
    input logic         en,
    output logic  [WIDTH-1:0] count
);

always_ff @(posedge clk)
    if (rst) count <= {WIDTH{1'b0}};
    else     count <= count + {{WIDTH-1{1'b0}}, en};
    // The WIDTH-1{1'b0} component sets all 7 bits to 0, 
    // Then we set en as the least significant bit
    // This way, when en = 1, the count will increment by 1

endmodule

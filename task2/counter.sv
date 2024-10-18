module counter #(
    parameter WIDTH = 8
)(
    input logic         clk,
    input logic         rst,
    input logic         en,
    output logic  [WIDTH-1:0] count
);

always_ff @(posedge clk, posedge rst)
    if (rst) count <= {WIDTH{1'b0}};
    else     
        if (en) count <= count + 1'b1;
        else if (count > 0 && en == 0)   count <= count - 1'b1;
        else count <= count;

    // The WIDTH-1{1'b0} component sets all 7 bits to 0, 
    // Then we set en as the least significant bit
    // This way, when en = 1, the count will increment by 1

endmodule

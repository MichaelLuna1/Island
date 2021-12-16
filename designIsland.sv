module island(clk, data_in, out1, out2);
  input clk;
  input [1:0] data_in;
  output reg out1;
  output reg out2;

  reg [3:0] state;

  parameter [1:0]
    STATE_01 = 2'b00,
    STATE_02 = 2'b01,
    STATE_03 = 2'b10,
    STATE_04 = 2'b11;


  always @(posedge clk) begin
      case(state)
         STATE_01:

              case(data_in)
                  2'b01: begin state <= STATE_03; out1 <= 0; out2 <= 0; end
                  2'b11: begin state <= STATE_02; out1 <= 0; out2 <= 0; end
                  default: begin state <= STATE_01; out1 <= 0;out2 <= 0; end
              endcase

         STATE_02:

              case(data_in)
                  2'b10: begin state <= STATE_01; out1 <= 0; out2 <= 0; end
                  2'b00: begin state <= STATE_01; out1 <= 1; out2 <= 0; end
                  default: begin state <= STATE_02; out1 <= 0; out2 <= 0; end
              endcase
        STATE_03:

              case(data_in)
                  2'b00: begin state <= STATE_01; out1 <= 0; out2 <= 0; end
                  2'b10: begin state <= STATE_04; out1 <= 0; out2 <= 0; end
                  default: begin state <= STATE_03; out1 <= 0; out2 <= 0; end
              endcase

          STATE_04:

              case(data_in)
                  2'b00: begin state <= STATE_01; out1 <= 0; out2 <= 1; end
                  2'b11: begin state <= STATE_03; out1 <= 0; out2 <= 0; end
                  default: begin state <= STATE_04; out1 <= 0; out2 <= 0; end
              endcase
         

         default: begin state <= STATE_01; out1 <= 0; out2 <= 0; end

      endcase
  end


endmodule

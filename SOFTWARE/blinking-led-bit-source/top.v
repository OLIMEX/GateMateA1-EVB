`timescale 1ns / 1ps   // cc-pll.v 15.2.24/16.2.24 3rd ver PDR
`default_nettype none  // Cologne Chip CCGM1A1 PLL test
module top (input wire CLK0, // 10MHz
  output wire locked,
  output wire CCEVB_LED, output wire OLIMEX_LED);

reg [23:0] cnt;
wire clk;

assign CCEVB_LED = cnt[23] & locked;
assign OLIMEX_LED = CCEVB_LED;

always @(posedge clk) begin
  cnt <= cnt + 1;
end

CC_PLL #(.REF_CLK("10.0"), .OUT_CLK("16.7857"), .PERF_MD("ECONOMY"),
    .LOW_JITTER(1), .LOCK.REQ(0), .CLK270_DOUB(0), .CLK180_DOUB(0),
    .CI_FILTER_CONST(2), .CP_FILTER_CONST(4))
  pll(.CLK_REF(CLK0), .CLK0(clk), .USR_LOCKED_STDY_RST(1'b0),
    .USR_PLL_LOCKED_STDY(), .USR_PLL_LOCKED(locked),
    .CLK_FEEDBACK(1'b0), .USR_CLK_REF(1'b0), //unused
    .CLK270(), .CLK180(), .CLK90(), .CLK_REF_OUT());

endmodule

/* 
yosys -p 'synth_gatemate -top top -nomx8 -vlog cc-pll-synth.v' cc-pll.v \
  && wine64 ~/cc-toolchain-win/bin/p_r/p_r.exe --fpga_mode 2 \
    -o cc-pll -ccf cc-pll.ccf -i cc-pll-synth.v \
  && openFPGALoader -c dirtyJtag cc-pll_00.cfg \
  && openFPGALoader -b gatemate_evb_jtag cc-pll_00.cfg 

note 20240126: p_r will ignore a misspelt .ccf!!
*/

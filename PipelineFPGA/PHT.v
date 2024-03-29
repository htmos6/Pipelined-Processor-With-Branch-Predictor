module PHT
	(
		input clk,
		input reset,
		input [2:0] PHTinpId,
		input [0:0] branchTakenE,
		input [0:0] branchPredictedE,
		output branchPredictionResult
	);

	reg [0:0] PHT_index [7:0];
	assign branchPredictionResult = PHT_index[PHTinpId];

	always @(negedge clk)
		begin
			
			if (reset == 1)
				begin
					PHT_index[0] <= 0;
					PHT_index[1] <= 0;
					PHT_index[2] <= 0;
					PHT_index[3] <= 0;
					PHT_index[4] <= 0;
					PHT_index[5] <= 0;
					PHT_index[6] <= 0;
					PHT_index[7] <= 0;
				end
			else if ((branchTakenE == 1 && branchPredictedE == 0) || (branchTakenE == 0 && branchPredictedE == 1))   //WRONG PREDICTION
				begin
					PHT_index[PHTinpId] <= ~PHT_index[PHTinpId];
				end
		end
endmodule

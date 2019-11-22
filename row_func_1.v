task compute_rc_r;
    input [43:0] vals;
    input en;
    output [43:0] vals_out;
    integer i;
    integer j;
    reg [43:0] vals_in1;
    reg [43:0] vals_in2;
    reg [43:0] vals_in3;
    reg [43:0] vals_in4;
    reg [43:0] vals_in5;
    reg [43:0] vals_in6;
    reg [43:0] vals_in7;
    reg [43:0] vals_out;
    integer k;
    begin
        k = en;
        i <= 3;
        j <= 2;

        // Enable bit
        if (k == 1) begin
            vals_out          = 44'b0;
            assign vals_in1    = vals;

            i = 3;
            j = 2;
            k = 1;

            // Shift for zero values.
            if (vals_in1[(i*11+10) -: 11] == 0) begin
                if (vals_in1[((i-1)*11+10) -: 11] == 0) begin
                    if (vals_in1[((i-2)*11+10) -: 11] == 0) begin                                  vals_in2[(i*11+10) -: 11] = vals_in1[((i-3)*11+10) -: 11];
                        vals_in2[((i-1)*11+10) -: 11] = 0;
                        vals_in2[((i-2)*11+10) -: 11] = 0;
                        vals_in2[((i-3)*11+10) -: 11] = 0;
                    end
                    else begin
                        vals_in2[(i*11+10) -: 11] = vals_in1[((i-2)*11+10) -: 11];
                        vals_in2[((i-1)*11+10) -: 11] = vals_in1[((i-3)*11+10) -: 11];
                        vals_in2[((i-2)*11+10) -: 11] = 0;
                        vals_in2[((i-3)*11+10) -: 11] = 0;
                    end

                end
                else begin
                  // One leading zero
                  vals_in2[(i*11+10) -: 11] = vals_in1[((i-1)*11+10) -: 11];
                  vals_in2[((i-1)*11+10) -: 11] = vals_in1[((i-2)*11+10) -: 11];
                  vals_in2[((i-2)*11+10) -: 11] = vals_in1[((i-3)*11+10) -: 11];
                  vals_in2[((i-3)*11+10) -: 11] = 0;
                end
            end
            else begin
                // No zero in the first position
                vals_in2[(i*11+10) -: 11] = vals_in1[((i)*11+10) -: 11];
                vals_in2[((i-1)*11+10) -: 11] = vals_in1[((i-1)*11+10) -: 11];
                vals_in2[((i-2)*11+10) -: 11] = vals_in1[((i-2)*11+10) -: 11];
                vals_in2[((i-3)*11+10) -: 11] = vals_in1[((i-3)*11+10) -: 11];
            end

            // Combine if values are the same.
            if (vals_in2[(i*11+10) -: 11] == vals_in2[((i-1)*11+10) -: 11]) begin
                vals_in3[(i*11+10) -: 11] = vals_in2[(i*11+10) -: 11]*2;
                vals_in3[((i-1)*11+10) -: 11] = vals_in2[((i-2)*11+10) -: 11];
                vals_in3[((i-2)*11+10) -: 11] = vals_in2[((i-3)*11+10) -: 11];
                vals_in3[((i-3)*11+10) -: 11] = 0;
            end
            else begin
                vals_in3[(i*11+10) -: 11] = vals_in2[((i)*11+10) -: 11];
                vals_in3[((i-1)*11+10) -: 11] = vals_in2[((i-1)*11+10) -: 11];
                vals_in3[((i-2)*11+10) -: 11] = vals_in2[((i-2)*11+10) -: 11];
                vals_in3[((i-3)*11+10) -: 11] = vals_in2[((i-3)*11+10) -: 11];
            end



            // Second iteration

            // Shift for zero values.
            if (vals_in3[(j*11+10) -: 11] == 0) begin
                if (vals_in3[((j-1)*11+10) -: 11] == 0) begin
                    vals_in5[(i*11+10) -: 11] = vals_in3[(i*11+10) -: 11];
                    vals_in4[(j*11+10) -: 11] = vals_in3[((j-2)*11+10) -: 11];
                    vals_in4[((j-1)*11+10) -: 11] = 0;
                    vals_in4[((j-2)*11+10) -: 11] = 0;
                end
                else begin
                    vals_in5[(i*11+10) -: 11] = vals_in3[(i*11+10) -: 11];
                    vals_in4[(j*11+10) -: 11] = vals_in3[((j-1)*11+10) -: 11];
                    vals_in4[((j-1)*11+10) -: 11] = vals_in3[((j-2)*11+10) -: 11];
                    vals_in4[((j-2)*11+10) -: 11] = 0;
                end
            end
            else begin
                // No zero in the first position
                vals_in5[(i*11+10) -: 11] = vals_in3[(i*11+10) -: 11];
                vals_in4[(j*11+10) -: 11] = vals_in3[((j)*11+10) -: 11];
                vals_in4[((j-1)*11+10) -: 11] = vals_in3[((j-1)*11+10) -: 11];
                vals_in4[((j-2)*11+10) -: 11] = vals_in3[((j-2)*11+10) -: 11];
            end

            // Combine if values are the same.
            if (vals_in4[(j*11+10) -: 11] == vals_in4[((j-1)*11+10) -: 11]) begin
                vals_in5[(j*11+10) -: 11] = vals_in4[(j*11+10) -: 11]*2;
                vals_in5[((j-1)*11+10) -: 11] = vals_in4[((j-2)*11+10) -: 11];
                vals_in5[((j-2)*11+10) -: 11] = 0;
                $display("vals_in5: %b", vals_in5);
            end
            else begin
                vals_in5[(j*11+10) -: 11] = vals_in4[((j)*11+10) -: 11];
                vals_in5[((j-1)*11+10) -: 11] = vals_in4[((j-1)*11+10) -: 11];
                vals_in5[((j-2)*11+10) -: 11] = vals_in4[((j-2)*11+10) -: 11];
            end

            // Third iteration

            // Shift for zero values.
            if (vals_in5[(k*11+10) -: 11] == 0) begin
                vals_in7[((i)*11+10) -: 11] = vals_in3[(i*11+10) -: 11];
                vals_in7[((j)*11+10) -: 11] = vals_in5[(j*11+10) -: 11];
                vals_in6[((k)*11+10) -: 11] = vals_in5[((k-1)*11+10) -: 11];
                vals_in6[((k-1)*11+10) -: 11] = 0;
                $display("vals_in6: %b", vals_in6);
                end
            else begin
                // No zero in the first position
                vals_in7[((i)*11+10) -: 11] = vals_in3[(i*11+10) -: 11];
                vals_in7[((j)*11+10) -: 11] = vals_in5[(j*11+10) -: 11];
                vals_in6[((k)*11+10) -: 11] = vals_in5[(k*11+10) -: 11];
                vals_in6[((k-1)*11+10) -: 11] = vals_in5[((k-1)*11+10) -: 11];
                $display("vals_in6: %b", vals_in6);
            end

            // Combine if values are the same.
            if (vals_in6[(k*11+10) -: 11] == vals_in6[((k-1)*11+10) -: 11]) begin
                vals_in7[(k*11+10) -: 11] = vals_in6[(k*11+10) -: 11]*2;
                vals_in7[((k-1)*11+10) -: 11] = 0;
            end
            else begin
                vals_in7[(k*11+10) -: 11] = vals_in6[((k)*11+10) -: 11];
                vals_in5[((k-1)*11+10) -: 11] = vals_in6[((k-1)*11+10) -: 11];
            end
            vals_out = vals_in7;
        end
    end
endtask


            


task compute_rc;
    input [43:0] vals;
    input en;
    output [43:0] vals_out;
    integer i;
    integer j;
    reg [43:0] vals_in;
    reg [43:0] vals_out;
    integer k;
    begin
        k = en;
        i = 3;
        j = 2;
        if (k == 1) begin
            vals_out          = 44'b0;
            assign vals_in    = vals;
            $display("Vals_in = %b", vals_in);
            for (i = 3; i > -1; i = i - 1) begin
                for (j = i-1; j > -1; j = j-1) begin
                    if (vals_in[(i*11+10) -: 11] == 11'b0) begin
                        vals_out[(i*11+10) -: 11] = vals_in[(j*11+10) -: 11];
                        vals_out[(j*11+10) -: 11] = 11'b0;
                        $display("Vals_in           = %b", vals_in);
                        $display("i equals 0");
                        $display("j        = %d", j);
                        $display("i        = %d", i);
                        $display("vals_out = %b", vals_out);
                        vals_in[43:0]    = vals_out[43:0];
                    end
                    else if (vals_in[(j*11+10) -: 11] == 11'b0) begin
                        $display("Vals_in = %b", vals_in);
                        $display("j equals 0");
                        $display("j        = %d", j);
                        $display("i        = %d", i);
                        $display("vals_out = %b", vals_out);
                    end
                        else if (vals_in[(i*11+10) -: 11] == vals_in[(j*11+10) -: 11]) begin
                        vals_out[(i*11+10) -: 11] = vals_in[(i*11+10) -: 11]*2;
                        vals_out[(j*11+10) -: 11] = 11'b0;
                        $display("Vals_in         = %b", vals_in);
                        $display("i equals j");
                        $display("j        = %d", j);
                        $display("i        = %d", i);
                        $display("vals_out = %b", vals_out);
                        vals_in[43:0]    = vals_out[43:0];
                        $display("Vals_in  = %b", vals_in);
                        //vals_out[43:0]    = compute_rc(vals_in[43:0], 1);
                        end
                    else begin
                        $display("Vals_in = %b", vals_in);
                        $display("j not equal to i");
                        $display("vals_out = %b", vals_out);
                        $display("j        = %d", j);
                        $display("i        = %d", i);
                        i                  = j;
                        $display("j        = %d", j);
                        $display("i        = %d", i);
                        vals_in            = vals_out;
                    end
                end
            end
            k <= 0;
        end
        $display("vals_out = %b", vals_out);
    end
endtask

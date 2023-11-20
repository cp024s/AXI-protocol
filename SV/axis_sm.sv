module tb_axis_s_m();
    
    bit areset_n, aclk, send;
    logic finish;
    logic slave_finish;
    
    logic tready;
    logic tvalid;
    logic tlast;
    logic [31:0] tdata;
    
    logic [31:0] data;
    logic [31:0] slave_data;
    logic slave_ready;
    
    // cloking block
    default clocking 
        cb @(posedge aclk);
    endclocking
    
    axis_m inst_axis_m(.areset_n(areset_n),
                       .aclk(aclk),
                       .data(data),
                       .send(send),
                       .tready(tready),
                       .tvalid(tvalid),
                       .tlast(tlast),
                       .tdata(tdata),
                       .finish(finish));

    axis_s inst_axis_s(.areset_n(areset_n),
                       .aclk(aclk),
                       .data(slave_data),
                       .ready(slave_ready),
                       .tready(tready),
                       .tvalid(tvalid),
                       .tlast(tlast),
                       .tdata(tdata),
                       .finish(slave_finish));                       
 
    initial
        forever #2 aclk++;
        
    initial
    begin
        areset_n <= 0;
        ##4 areset_n <= 1;
    end 
    
    initial
    begin
        ##10 send <= 1;
        ##1  send <= 0;
        ##20 send <= 1;
        ##1  send <= 0;
    end  
    
    initial
    begin   
        slave_ready <= 0;
        ##15 slave_ready <= 1;
        ##5  slave_ready <= 0;
    end                       
    
    initial
    begin
        data <= 32'haaaa_bbbb;
        ##25 data <= 32'hcccc_dddd;
    end
    
    initial
        ##40 $finish;       
endmodule

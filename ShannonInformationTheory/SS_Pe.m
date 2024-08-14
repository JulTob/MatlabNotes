num_of_err = 0; % Initialize error counter

for i = 1:N
    % Generate the next data bit
    if rand < 0.5
        data = -1;
    else
        data = 1;
    end
    
    % Repeat the bit Lc times (spread spectrum)
    repeated_data = data * ones(1, Lc);
    
    % Generate the PN sequence for the duration of the bit
    pn_seq = 2 * (rand(1, Lc) > 0.5) - 1;
    
    % Generate the transmitted signal
    trans_sig = sqrt(E_chip) * repeated_data .* pn_seq;
    
    % Additive White Gaussian Noise (AWGN)
    noise = sgma * randn(1, Lc);
    
    % Interference signal
    n = (i - 1) * Lc + 1:i * Lc;
    interference = A * sin(w0 * n);
    
    % Received signal
    rec_sig = trans_sig + noise + interference;
    
    % Determine the decision variable
    decision_variable = sum(rec_sig .* pn_seq);
    
    % Make decision based on the decision variable
    if decision_variable < 0
        decision = -1;
    else
        decision = 1;
    end
    
    % Increment the error counter if there is an error
    if decision ~= data
        num_of_err = num_of_err + 1;
    end
end

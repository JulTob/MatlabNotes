function [er, trans_sig, rec_sig] = ss_Pe(snr_in_dB, Lc, A, w0)
    % ss_Pe calculates the bit error rate (BER) for a spread spectrum system.
    % Inputs:
    %   snr_in_dB - Signal-to-noise ratio in dB
    %   Lc - Number of chips per bit
    %   A - Amplitude of interference
    %   w0 - Angular frequency of interference
    % Outputs:
    %   er - Estimated error rate (BER)
    %   trans_sig - Transmitted signal for the last bit
    %   rec_sig - Received signal for the last bit

    % Convert SNR from dB to linear scale
    snr = 10^(snr_in_dB/10);
    
    % Fixed noise standard deviation
    sgma = 1;
    
    % Calculate signal energy per bit (Eb) required for the given SNR
    Eb = 2 * sgma^2 * snr;
    
    % Calculate energy per chip
    E_chip = Eb / Lc;
    
    % Define the number of bits to transmit
    N = 10000;

    % Initialize error counter
    num_of_err = 0;

    % Loop through each bit to simulate transmission and reception
    for i = 1:N
        % Generate a random bit (-1 or 1)
        if rand < 0.5
            data = -1;
        else
            data = 1;
        end
        
        % Repeat the bit Lc times to create the spread spectrum signal
        repeated_data = data * ones(1, Lc);
        
        % Generate the PN sequence for the bit duration
        pn_seq = 2 * (rand(1, Lc) > 0.5) - 1;
        
        % Generate the transmitted signal by modulating the PN sequence
        trans_sig = sqrt(E_chip) * repeated_data .* pn_seq;
        
        % Generate Additive White Gaussian Noise (AWGN)
        noise = sgma * randn(1, Lc);
        
        % Generate interference signal
        n = (i - 1) * Lc + 1:i * Lc;
        interference = A * sin(w0 * n);
        
        % Combine transmitted signal, noise, and interference to form the received signal
        rec_sig = trans_sig + noise + interference;
        
        % Calculate the decision variable by correlating received signal with the PN sequence
        decision_variable = sum(rec_sig .* pn_seq);
        
        % Make a decision based on the sign of the decision variable
        if decision_variable < 0
            decision = -1;
        else
            decision = 1;
        end
        
        % Increment error counter if the decision does not match the transmitted bit
        if decision ~= data
            num_of_err = num_of_err + 1;
        end
    end

    % Calculate the measured error rate
    er = num_of_err / N;
end

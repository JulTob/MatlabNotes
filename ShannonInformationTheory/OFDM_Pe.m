function [Perror] = OFDM_Pe(snr_dB, N, L)
    % OFDM_Pe calculates the Bit Error Rate (BER) for an OFDM system.
    % Inputs:
    %   snr_dB - Signal-to-noise ratio in dB
    %   N - Number of subcarriers
    %   L - Length of the cyclic prefix
    % Output:
    %   Perror - Bit Error Rate (BER)

    % Define the number of bits to transmit
    N_bits = 2 * N * 10000; % 2 bits per symbol (4-PSK), N subcarriers, 10000 OFDM symbols
    snr = 10^(snr_dB/10); % Convert SNR from dB to linear scale

    % TRANSMITTER
    % 4-PSK Modulation (Gray coded)
    modulator = modem.pskmod('M', 4, 'SymbolOrder', 'Gray', 'InputType', 'Bit');
    
    % Generate random binary data
    bit_data = round(rand(N_bits, 1));
    
    % Modulate the binary data using 4-PSK
    modulated_data = modulate(modulator, bit_data);

    % Reshape modulated data into OFDM symbols
    ofdm_symbols = reshape(modulated_data, N, ceil(length(modulated_data)/N));
    
    % Apply IFFT to get time-domain OFDM signal
    time_domain_signal = sqrt(N) * ifft(ofdm_symbols, N);
    
    % Add cyclic prefix
    cyclic_prefix_signal = [time_domain_signal((N-(L-1)):N,:); time_domain_signal];
    
    % Convert matrix to a vector for transmission
    tx_signal = cyclic_prefix_signal(:);

    % CHANNEL (Assuming no multipath, just AWGN)
    % Apply channel effects (AWGN noise)
    received_signal = tx_signal + sqrt(.5/snr)*(randn(size(tx_signal)) + 1i*randn(size(tx_signal)));

    % RECEIVER
    % Reshape received signal back into OFDM symbols with cyclic prefix
    received_signal_cp = reshape(received_signal, L+N, ceil(length(tx_signal)/(L+N)));
    
    % Remove cyclic prefix
    received_signal_no_cp = received_signal_cp(L+1:end,:);
    
    % Apply FFT to convert back to frequency domain
    freq_domain_signal = sqrt(1/N) * fft(received_signal_no_cp, N);
    
    % Reshape frequency domain signal back into a vector
    demodulated_vector = reshape(freq_domain_signal, 1, length(modulated_data));

    % Demodulate the received signal to recover the binary data
    demodulator = modem.pskdemod(modulator);
    received_bits = demodulate(demodulator, demodulated_vector);
    received_bits = received_bits(:);

    % Estimate the Bit Error Rate (BER)
    Perror = mean(abs(received_bits - bit_data));
end

% Simulation Parameters
Nb = 10000; % Number of bits to transmit
vector_SNR = 0:2:10; % Array of SNR values in dB to test
M = 2; % Modulation order (BPSK)
Ax = modem.pskmod('M', M, 'SymbolOrder', 'gray', 'InputType', 'bit'); % BPSK modulator

% Calculate the number of symbols (same as Nb for BPSK)
N = Nb / log2(M); 

% Initialize array to store BER results
berBPSK = zeros(size(vector_SNR)); 

% Index to keep track of SNR iterations
m = 1; 

% Loop over each SNR value
for SNR = vector_SNR
    
    % Step 1: Generate random binary data
    b = randi([0 1], 1, Nb); % Generates a sequence of random bits (0s and 1s)
    
    % Step 2: Modulate the binary data using BPSK
    x = modulate(Ax, b); % Apply BPSK modulation to the bit sequence

    % Step 3: Generate complex Gaussian noise based on the SNR
    snr_linear = 10^(SNR/10); % Convert SNR from dB to linear scale
    noise_variance = 1 / snr_linear; % Calculate noise variance
    n = (randn(1, N) + 1j * randn(1, N)) * sqrt(noise_variance / 2); % Generate noise
    
    % Step 4: Transmit the signal through the noisy channel
    y = x + n; % Received signal = transmitted signal + noise
    
    % Step 5: Demodulate the received signal
    demodulator = modem.pskdemod(Ax); % Create a demodulator object
    br = demodulate(demodulator, y); % Recover the transmitted bits
    
    % Step 6: Calculate the Bit Error Rate (BER)
    berBPSK(m) = sum(b ~= br) / Nb; % Compare transmitted and received bits
    
    % Move to the next SNR value
    m = m + 1; 
end

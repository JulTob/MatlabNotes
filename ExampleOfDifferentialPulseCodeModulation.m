% Example of Differential Pulse Code Modulation (DPCM)

% Step 1: Generate the Original Signal (already sampled)
t = 0:0.005:1; % Time vector from 0 to 1 with a step of 0.005
sig = 2*sin(2*pi*3*t) - cos(2*pi*5*t); % Original signal: sum of sine and cosine waves

% Step 2: Differential Encoding
sig_prev = [0, sig(1:end - 1)]; % Shifted signal (one sample back), starting with 0
sig_diff = sig - sig_prev; % Differential signal: current sample minus previous sample
sig_diff = sig_diff(2:end); % Removing the first sample (no previous sample to differ with)

% Step 3: Quantization of the Differential Signal
Num_Bits = 3; % Number of bits used for quantization
Num_Levels = 2^Num_Bits; % Number of quantization levels

Xsc = max(abs(sig_diff)); % Maximum absolute value of the differential signal
A = 2 * Xsc / Num_Levels; % Quantization step size

% Define the quantization partitions and codebook (quantized values)
partition = -Xsc + A : A : Xsc - A; % Partition boundaries between levels
codebook = -Xsc + A/2 : A : Xsc; % Quantized values corresponding to each partition

% Apply quantization to the differential signal
[index, quants] = quantiz(sig_diff, partition, codebook); % `index` stores the partition indices, `quants` stores quantized values

% Step 4: Plotting the Differential Signal and Quantized Signal
figure;
plot(t(2:end), sig_diff, 'x', t(2:end), quants, '.'); % Plot original differential signal vs quantized signal
title('Differential Signal and Quantized Signal');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Original Differential Signal', 'Quantized Signal');

% Step 5: Differential Decoding
N = length(sig); % Number of samples in the original signal
sig_decoded = zeros(1, N); % Initialize the decoded signal with zeros
sig_decoded(1) = -1; % Set an arbitrary initial value for the first sample

% Reconstruct the original signal by summing up the quantized differences
for idx = 2:N
    sig_decoded(idx) = sig_decoded(idx - 1) + quants(idx - 1); % Summing up quantized differences
end

% Step 6: Plotting the Original Signal and Decoded Signal
figure;
plot(t, sig, 'x', t, sig_decoded, '.'); % Plot original signal vs decoded signal
title('Original Signal vs Decoded Signal');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Original Signal', 'Decoded Signal');

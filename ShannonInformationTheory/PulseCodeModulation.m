% Pulse Code Modulation (PCM) Example

% Step 1: Define the Original Signal (already sampled)
t = 0:0.005:1; % Time vector from 0 to 1 with a step of 0.005 seconds
sig = 2*sin(2*pi*3*t) - cos(2*pi*5*t); % Original signal: combination of sine and cosine waves

% Step 2: Quantization Parameters
Num_Bits = 3; % Number of bits used for quantization
Num_Levels = 2^Num_Bits; % Number of quantization levels
Xsc = 3; % Signal scaling factor (determines the range of quantization)
A = 2 * Xsc / Num_Levels; % Quantization step size

% Step 3: Define the Quantization Partitions and Codebook
partition = -Xsc + A : A : Xsc - A; % Partition boundaries between quantization levels
codebook = -Xsc + A/2 : A : Xsc; % Quantized values corresponding to each partition

% Apply quantization to the original signal
[index, quants] = quantiz(sig, partition, codebook); % Quantize the signal, returning the index and quantized values

% Step 4: Plot the Original and Quantized Signals
figure;
plot(t, sig, 'x', t, quants, '.'); % Plot original signal vs quantized signal
legend('Original Signal', 'Quantized Signal'); % Add legend to the plot
title('PCM Example: Original Signal vs Quantized Signal'); % Add title to the plot
xlabel('Time (s)'); % Label x-axis
ylabel('Amplitude'); % Label y-axis

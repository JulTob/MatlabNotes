% Hamming Code Example

clear all % Clear all variables from the workspace

% Step 1: Initialize Hamming Code Parameters
r = 3; % Number of parity bits (r=3 for a (7,4) Hamming code)
[H, G, n, k] = hammgen(r); % Generate parity-check matrix H, generator matrix G, codeword length n, and message length k
syndrome_table = syndtable(H); % Generate the syndrome table used for error correction

% Step 2: Encode the Information Block
info_block = [1 0 0 1]; % Information block to be transmitted (4 bits)
tx_block = rem(info_block * G, 2); % Generate the transmitted block (codeword) by multiplying with G and taking modulo 2

% Display the transmitted block
disp('Transmitted Block (Codeword):');
disp(tx_block);

% Step 3: Introduce an Error in the Transmitted Block
error_vector = [0 0 0 0 1 0 0]; % Error vector with an error in the 5th bit
rx_block = rem(tx_block + error_vector, 2); % Received block with error added

% Display the received block with error
disp('Received Block with Error:');
disp(rx_block);

% Step 4: Calculate the Syndrome for Error Detection
syndrome = rem(rx_block * H', 2); % Calculate the syndrome by multiplying with H transpose and taking modulo 2
syndrome_decimal = bi2de(syndrome, 'left-msb'); % Convert the binary syndrome to decimal for indexing the syndrome table

% Display the syndrome in both binary and decimal formats
disp(['Syndrome = ', num2str(syndrome_decimal), ' (decimal), ', num2str(syndrome), ' (binary)']);

% Step 5: Correct the Error Using the Syndrome Table
error_correction = syndrome_table(1 + syndrome_decimal, :); % Retrieve the error correction vector from the syndrome table
rx_block_corrected = rem(rx_block + error_correction, 2); % Correct the received block by adding the error correction vector and taking modulo 2

% Display the corrected received block
disp('Corrected Received Block:');
disp(rx_block_corrected);

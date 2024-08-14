% Hamming Code Example with Encoding, Error Introduction, and Decoding

clear all % Clear all variables from the workspace

% Step 1: Define Hamming Code Parameters
n = 7; % Length of the Hamming codeword (7 bits)
k = 4; % Length of the information block (4 bits)

% Step 2: Encode the Information Block
info_block = [1 0 0 1]; % Information block to be transmitted (4 bits)
tx_block = encode(info_block, n, k, 'hamming/binary'); % Encode the information block using Hamming (7,4) binary code

% Display the transmitted block (codeword)
disp('Transmitted Block (Codeword):');
disp(tx_block);

% Step 3: Introduce an Error in the Transmitted Block
error_vector = [0 0 0 0 1 0 0]; % Error vector with an error in the 5th bit
rx_block = rem(tx_block + error_vector, 2); % Received block with error added (using modulo 2 arithmetic)

% Display the received block with error
disp('Received Block with Error:');
disp(rx_block);

% Step 4: Correct the Error and Decode the Received Block
corrected_info_block = decode(rx_block, n, k, 'hamming/binary'); % Decode the received block and correct any single-bit errors

% Display the corrected information block
disp('Corrected Information Block:');
disp(corrected_info_block);

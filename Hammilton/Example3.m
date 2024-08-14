% Hamming Code Example: Encoding, Error Introduction, and Decoding

clear all % Clear all variables from the workspace

% Step 1: Generate Hamming Code Matrices and Syndrome Table
r = 3; % Number of parity bits (r=3 for a (7,4) Hamming code)
[H, G, n, k] = hammgen(r); % Generate Hamming code matrices H (parity-check), G (generator), and parameters n, k
syndrome_table = syndtable(H); % Generate syndrome table for error correction (not used in this specific script)

% Step 2: Encode the Information Block
info_block = [1 0 0 1]; % Information block to be transmitted (4 bits)
tx_block = encode(info_block, n, k, 'linear', G); % Encode the information block using the generator matrix G

% Display the transmitted block (codeword)
disp('Transmitted Block (Codeword):');
disp(tx_block);

% Step 3: Introduce an Error in the Transmitted Block
error_vector = [0 1 0 0 0 0 0]; % Error vector with an error in the 2nd bit
rx_block = rem(tx_block + error_vector, 2); % Received block with error added (using modulo 2 arithmetic)

% Display the received block with error
disp('Received Block with Error:');
disp(rx_block);

% Step 4: Decode the Received Block to Correct the Error
corrected_info_block = decode(rx_block, n, k, 'linear', G); % Decode the received block to correct any single-bit errors

% Display the corrected information block
disp('Corrected Information Block:');
disp(corrected_info_block);

% Repetition Code Example: Encoding, Error Introduction, and Decoding

clear all % Clear all variables from the workspace

% Step 1: Define Code Parameters and Generator Matrix
n = 3; % Length of the codeword (each bit is repeated 3 times)
k = 1; % Length of the information block (1 bit per block)
G = [1 1 1]; % Generator matrix for repetition code (each bit is repeated 3 times)

% Step 2: Encode the Information Block
info_block = [1 0 0 1]; % Information block to be transmitted (4 bits)
tx_block = encode(info_block, n, k, 'linear', G); % Encode the information block using the generator matrix G

% Display the transmitted block (codeword)
disp('Transmitted Block (Codeword):');
disp(tx_block);

% Step 3: Introduce Random Errors in the Transmitted Block
reset(RandStream.getGlobalStream); % Reset the random number generator for reproducibility
error_vector = rand(1, length(tx_block)) < 0.6; % Generate a random error vector (60% chance of error per bit)

% Display the generated error vector
disp('Generated Error Vector:');
disp(error_vector);

% Apply the error vector to the transmitted block
rx_block = rem(tx_block + error_vector, 2); % Received block with error added (using modulo 2 arithmetic)

% Display the received block with error
disp('Received Block with Error:');
disp(rx_block);

% Step 4: Decode the Received Block to Correct the Error
corrected_info_block = decode(rx_block, n, k, 'linear', G); % Decode the received block to correct any errors

% Display the corrected information block
disp('Corrected Information Block:');
disp(corrected_info_block);

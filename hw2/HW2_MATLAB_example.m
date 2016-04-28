% HW 2 EE 370
% by Efren Cruz

% First of all, what is sequence1.mat?
% these files contain nothing but a bunch of 1's and 0's
% A 1 is assigned for a head, a zero for a tail. As you know, these are
% intended to be random, but we are to discover some of them are not.

% your idea of knowing if the companies are fraudulent is the following:
% if you can compute the probability of n heads in a row in their sequence
% (by counting the total number of times this event happens and then
% dividing by the total number of flips), then you can compare it to the
% ideal number and know if they are doing it right.

% Compute first analitically (by hand, in paper) the probabilities of
% getting 1, 2, 3, 4, 5 and n heads in a row. You are to compare if each
% company satisfies the different probabilities.

% First, the sequences files should be in your directory (that list of
% files to the left of these window) or otherwise you'll have to press the
% button add to path when you want to load them.

% Let's start!

clear all, close all; % These two commands clear the previous variables
                      % and close the windows you had opened before.

% Load your first sequence using the command 'load'.

load sequence3.mat;

% Note in the workspace (window to your right) that there is a new 
% variable, it is indeed a long vector called test_sequence. Let's find
% out how many elements ("coin flips") it has, use the 'length' command.
% Store this value in some variable.

N = length(test_sequence);

% Store your test_sequence in another variable to avoid writing too much.

x = test_sequence;

% Now let's compute the actual probability.

% For the case of two Heads in a row, let's use a 'for' loop. If we
% have two 1's in a row, then we count it; at the end, we divide over the
% number of flips to get the probability.

count = 0;      % Initialize your count to 0
for k = 1:N-1     
    if x(k) == x(k+1) && x(k) == 1  % compare previous value with current 
                                    % value of vector element.
                                    
    % Note on the 'if' statement we used '==' and '&&', these expressions
    % do not assign a value to x(k), but evaluate the expression to know
    % if it is true. In the case where x(k) equals x(k+1) and also equals
    % 1, the 'if' loop is executed.
       
    count  = count +1;          % If above statement is true, 
                                % add 1 to your count.
        
    end
end

p = count/N       % Divide over total number of flips

% Can you do it now for 1 Head? What about 3, 4, 5?

% Note that the 'for' loop is getting cumbersome. There is an easier way to
% compute it,but a little bit harder to understand if you don't know
% convolution.
% You can use the command: sum(1==conv(1/2 * [1 1], test_sequence))
% If you have taken 380 you'll understand it and are welcome to use it,
% otherwise you can ask your T.A.
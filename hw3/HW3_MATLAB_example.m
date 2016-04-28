% HW 4 EE 370
% By Efren Cruz Cortes

trials = 100000;

X_vector = random('Binomial', 10, 0.6, [1, trials]);
% Study those numbers carefully. Following the coin tossing analogy
% there are n = 10 tosses with probability of heads p = 0.6.
% random('Binomial',10,.6) generates ONE resulting random variable with
% these parameters (refer to pg. 77 in your textbook). Note that the
% possible values will be between zero and 10, since this is the span of
% possible numbers of times heads come up.

% The [1,trials] vector indicates you will generate N = trials number of
% random variables and put them in a vector of 1xN dimensions called
% X_vector.

% Now, let's get some information from such vector.

% In the following 'for' loop, there will be a matrix of 11x2 dimensions
% called 'count'. Note that we indicate the i'th element of the first
% column by 'count(i,1)'.

for i =1:11     % 'for' loops in matlab can't start at 0
    count (i, 1) = i-1 ; % lower the numbers to 0-10
    count (i, 2) = sum( (i-1) == X_vector ); % how many "i-1" values are
                        %this is a vector    % found in the vector
                                            
    % Note that you can make a vector resulting from boolean expressions,
    % this is a common technique in matlab programming and EE, since a lot
    % of times we are interested in 1's and 0's. The sum command takes this
    % generated vector and adds all the elements in it.
end

% In other words, we just compared how many of the variables "landed" in
% each of the values from 0 to 10, in this way we can see what number
% of heads most probably comes up after every 10-tosses sequence.

% If you're a little bit confused on what just happened, try typing 'count'
% in the command window and look at the result.

% How do we get the probability from our results? We just divide the
% resulting numbers over the total number of trials:

pvec = count(:, 2)/trials;

% Now, let's take the statistics of our randomly generated variables and
% plot them.

bar ( count(:, 1), pvec); % the ':' indicates all elemnts in
                                        % the row/column

% Here we just plotted the first column of our vector against the second
% one. If you're still confused about the 'bar' command, use the matlab
% help.

% Why do we divide the second column by the number of trials? How is this
% related to the normalization property?


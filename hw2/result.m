clear all, close all;

load sequence1.mat;
p = [0 0 0 0 0; 0 0 0 0 0; 0 0 0 0 0; 0 0 0 0 0; 0 0 0 0 0; 0 0 0 0 0];
x = test_sequence;
N = length(test_sequence);
p(1,1) = sum(1==conv(1/1 * [1], test_sequence))/N;
p(1,2) = sum(1==conv(1/2 * [1 1], test_sequence))/N;
p(1,3) = sum(1==conv(1/3 * [1 1 1], test_sequence))/N;
p(1,4) = sum(1==conv(1/4 * [1 1 1 1], test_sequence))/N;
p(1,5) = sum(1==conv(1/5 * [1 1 1 1 1], test_sequence))/N;


load sequence2.mat;
x = test_sequence;
N = length(test_sequence);
p(2,1) = sum(1==conv(1/1 * [1], test_sequence))/N;
p(2,2) = sum(1==conv(1/2 * [1 1], test_sequence))/N;
p(2,3) = sum(1==conv(1/3 * [1 1 1], test_sequence))/N;
p(2,4) = sum(1==conv(1/4 * [1 1 1 1], test_sequence))/N;
p(2,5) = sum(1==conv(1/5 * [1 1 1 1 1], test_sequence))/N;

load sequence3.mat;
x = test_sequence;
N = length(test_sequence);
p(3,1) = sum(1==conv(1/1 * [1], test_sequence))/N;
p(3,2) = sum(1==conv(1/2 * [1 1], test_sequence))/N;
p(3,3) = sum(1==conv(1/3 * [1 1 1], test_sequence))/N;
p(3,4) = sum(1==conv(1/4 * [1 1 1 1], test_sequence))/N;
p(3,5) = sum(1==conv(1/5 * [1 1 1 1 1], test_sequence))/N;

load sequence4.mat;
x = test_sequence;
N = length(test_sequence);
p(4,1) = sum(1==conv(1/1 * [1], test_sequence))/N;
p(4,2) = sum(1==conv(1/2 * [1 1], test_sequence))/N;
p(4,3) = sum(1==conv(1/3 * [1 1 1], test_sequence))/N;
p(4,4) = sum(1==conv(1/4 * [1 1 1 1], test_sequence))/N;
p(4,5) = sum(1==conv(1/5 * [1 1 1 1 1], test_sequence))/N;

load sequence5.mat;
x = test_sequence;
N = length(test_sequence);
p(5,1) = sum(1==conv(1/1 * [1], test_sequence))/N;
p(5,2) = sum(1==conv(1/2 * [1 1], test_sequence))/N;
p(5,3) = sum(1==conv(1/3 * [1 1 1], test_sequence))/N;
p(5,4) = sum(1==conv(1/4 * [1 1 1 1], test_sequence))/N;
p(5,5) = sum(1==conv(1/5 * [1 1 1 1 1], test_sequence))/N;

load sequence6.mat;
x = test_sequence;
N = length(test_sequence);
p(6,1) = sum(1==conv(1/1 * [1], test_sequence))/N;
p(6,2) = sum(1==conv(1/2 * [1 1], test_sequence))/N;
p(6,3) = sum(1==conv(1/3 * [1 1 1], test_sequence))/N;
p(6,4) = sum(1==conv(1/4 * [1 1 1 1], test_sequence))/N;
p(6,5) = sum(1==conv(1/5 * [1 1 1 1 1], test_sequence))/N;
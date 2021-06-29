clear; close all; clc;
bio = dlmread('Biometrics.txt')
ht = bio(:, 1);
wt = bio(:, 2);

p = polyfit(ht, wt, 1)
figure(1); plot(ht, wt, 'o')
figure(1); hold on; plot(ht, p(1)*ht+p(2), 'r')
b = robustfit(ht, wt)
figure(1); hold on; plot(ht, b(2)*ht+b(1), 'g')

figure(2); plot(ht, wt, 'o');
hold on;
plot(ht, polyval(p, ht), 'c');
 
figure(3)
res = wt - polyval(p, ht)
subplot(211)
plot(ht, res, 'o')
subplot(212)
hist(res)

figure(4)
subplot(211)
plot(ht, wt, 'o'), hold on
plot(ht, p(1)*ht+p(2), 'r')
subplot(212)
stem(ht, res)
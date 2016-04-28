trials = 100000;

figure(1);
B_vector = random('Binomial', 20, 0.2, [1, trials]);

for i =1:21    
    count (i, 1) = i-1 ;
    count (i, 2) = sum( (i-1) == B_vector ); 
end
pvec1 = count(:, 2)/trials;
bar ( count(:, 1), pvec1);
title('Binomial','Fontweight','bold')
clear count;

figure(2);
G_vector = random('Geometric', 0.1, [1, trials]);

for i =1:21    
    count (i, 1) = i-1 ;
    count (i, 2) = sum( (i-1) == G_vector ); 
end
pvec2 = count(:, 2)/trials;
bar ( count(:, 1), pvec2);
title('Geometric','Fontweight','bold')
clear count;

figure(3);
P_vector = random('Poisson', 3, [1, trials]);

for i =1:21    
    count (i, 1) = i-1 ;
    count (i, 2) = sum( (i-1) == P_vector ); 
end
pvec3 = count(:, 2)/trials;
bar ( count(:, 1), pvec3);
title('Poisson','Fontweight','bold')
clear count;

figure(4);
B1_vector = random('Binomial', 4, 0.25, [1, trials]);
B1_function = (B1_vector-1).^2;

for i =1:21    
    count (i, 1) = i-1 ;
    count (i, 2) = sum( (i-1) == B1_function ); 
end
pvec4 = count(:, 2)/trials;
bar ( count(:, 1), pvec4);
title('Function Reflected','Fontweight','bold')
clear count;
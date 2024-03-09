% Main program
%Functions1
f1 = inline('((x + 1).^3) .* (x - 2)');
df1 = inline('((x+1).^2) .* (4*x - 5)');

f2=inline('exp(x)-(x).^2-2');
df2=inline('exp(x)-2.*x');

% Errors
e_b = 0.5 * 10^(-2);
e_NR = 0.5 * 10^(-6);

n = 100; % max iterations

options = menu('Choose between', 'Syndiasmos_D_NR',' Syndiasmos_D_T','Graph');

switch options
  case 1
    disp('-----------------------------------------------')

    disp('Question 1.2 - syndyasmos_D_NR')
    disp('      a         b         x0        xn       n');
    result1 = syndyasmos_D_NR(f1, df1, e_b, e_NR, -3, 0, n); 
    disp(result1(1, 1:5));
    result2 = syndyasmos_D_NR(f1, df1, e_b, e_NR, 0, 10, n); 
    disp(result2(1, 1:5));
    result3 = syndyasmos_D_NR(f2, df2, e_b, e_NR, -1, 3, n); 
    disp(result3(1, 1:5));
    disp('-----------------------------------------------')


    disp('Question 1.3 - ERRORS - syndyasmos_D_NR')

  for k=1:2 %k =P (taksi sigklisis)
       fprintf( 'P = %0.f\n', k);

    % f1 with ξ = -1
    disp('Function f1 and root of -1')
    root = -1;
    table1 = zeros(result1(1,5), 3);    % initialize space of size n (iterations) rows and 3 columns

    for i = 0 : result1(1,5)-1
        table1(i+1, 1) = i;
        table1(i+1, 2) = abs(result1(2, i+1) - root);   % calculation of e_n
    end

    table1(1, 3) = abs(table1(2, 2))/abs(table1(1, 2));

    for i = 1 : result1(1,5)-2
        table1(i+1, 3) = abs(table1(i+2, 2))/(abs(table1(i+1, 2))).^k;    % calculation of e_(n+1)/e_n
    end

    table1(end, 1) = result1(1,5)-1;
    table1(end, 2) = abs(result1(2, result1(1,5)) - root);   % calculation of last ε_n 
    table1(end, 3) = NaN;                  % error fraction for last xn is undefined

    disp('      n        e_n      e_n+1/e_n')
    fprintf('%12.8f %12.8f %12.8f\n', table1') 

    disp('-----------------------------------------------')

    disp('Function f1 and root of 2')
   
    %This is for f1 and root of 2
    %Same work as in the above case

    root = 2;
    table2 = zeros(result2(1,5), 3);    % initialize space of size n (iterations) rows and 3 columns

    for i = 0 : result2(1,5)-1
        table2(i+1, 1) = i;
        table2(i+1, 2) = abs(result2(2, i+1) - root);   % calculation of e_n
    end

    table2(1, 3) = abs(table2(2, 2))/abs(table2(1, 2));

    for i = 1 : result2(1,5)-2
        table2(i+1, 3) = abs(table2(i+2, 2))/(abs(table2(i+1, 2))).^k;    % calculation of e_(n+1)/e_n
    end

    table2(end, 1) = result2(1,5)-1;
    table2(end, 2) = abs(result2(2, result2(1,5)) - root);   % calculation of last ε_n 
    table2(end, 3) = NaN;                  % error fraction for last xn is undefined

    disp('      n        e_n      e_n+1/e_n')
    fprintf('%12.8f %12.8f %12.8f\n', table2') 

    disp('-----------------------------------------------')
    disp('Function f2')
    
    table3 = zeros(result3(1,5), 3);    
    table3(1, 1) = 0;
    table3(1, 2) = NaN;
    table3(1, 3) = NaN;

    for i = 1 : result3(1,5) - 2
      table3(i+1, 1) = i;
      table3(i+1, 2) = abs(result3(2, i+1) - (result3(2, i)).^2);           
    end

    for i = 1 : result3(1,5) - 2 
      table3(i+1, 3) = abs(result3(2, i+2) - result3(2, i+1))/ ((abs(result3(2, i+1) - result3(2, i)).^2)).^k;
    end

    table3(end, 1) = result3(1,5)-1;
    table3(end, 2) = 0;  
    table3(end, 3) = NaN;

    
    disp('      n          e_n     e_n+1/e_n')
     fprintf('%12.8f %12.8f %12.8f\n', table3') 
    disp('-----------------------------------------------')

  end

     
    %The answer to Question 1.4 can be seen at the readme file

  case 2

      %  Question 1.5 
    disp('-----------------------------------------------')
    disp('Question 1.5 - results  for syndyasmos_D_Τ')
    disp('-----------------------------------------------')

    disp('Row 1: f1 & ξ = -1, Row 2: f1 & ξ = 2, Row 3: f2 & ξ =~ 1.31');
    disp('     a           b        x0          xn          n');
    result1= syndyasmos_D_T(f1, e_b, e_NR, -3, 0, n); %Starting [a,b] = [-3, 0]
    disp(result1(1, 1:5));
    result2 = syndyasmos_D_T(f1, e_b, e_NR, 0, 10, n);  %Starting [a,b] = [0, 10]
    disp(result2(1, 1:5));
    result3 = syndyasmos_D_T(f2, e_b, e_NR, -1, 3, n);  %Starting [a,b] = [-1, 3]
    disp(result3(1, 1:5));

    disp('Question 1.3 - ERRORS - syndyasmos_D_T')

    for k=1:2
    fprintf( 'P = %0.f\n', k);


    % f1 with ξ = -1
    disp('Function f1 and root of -1')
    root = -1;
    table1 = zeros(result1(1,5), 3);    % initialize space of size n (iterations) rows and 3 columns


    for i = 0 : result1(1,5)-1
      table1(i+1, 1) = i;
      table1(i+1, 2) = abs(result1(2, i+1) - root);   % calculation of e_n
    end

    table1(1, 3) = abs(table1(2, 2))/(abs(table1(1, 2))).^k;

    for i = 1 : result1(1,5)-2
      table1(i+1, 3) = abs(table1(i+2, 2))/abs(table1(i+1, 2));    % calculation of e_(n+1)/e_n
    end

    table1(end, 1) = result1(1,5)-1;
    table1(end, 2) = abs(result1(2, result1(1,5)) - root);   % calculation of last ε_n 
    table1(end, 3) = NaN;                  % error fraction for last xn is undefined

    
    disp('      n        e_n      e_n+1/e_n')
    fprintf('%12.8f %12.8f %12.8f\n', table1') 

    disp('-----------------------------------------------')

    disp('Function f1 and root of 2')
    
    %This is for f1 and root of 2
    %Same work as in the above case
    root = 2;
    table2 = zeros(result2(1,5), 3);    



    for i = 0 : result2(1,5)-1
      table2(i+1, 1) = i;
      table2(i+1, 2) = abs(result2(2, i+1) - root);   % calculation of e_n
    end

    table2(1, 3) = abs(table2(2, 2))/abs(table2(1, 2));

    for i = 1 : result2(1,5)-2
      table2(i+1, 3) = abs(table2(i+2, 2))/(abs(table2(i+1, 2))).^k;    % calculation of e_(n+1)/e_n
    end

    table2(end, 1) = result2(1,5)-1;
    table2(end, 2) = abs(result2(2, result2(1,5)) - root);  
    table2(end, 3) = NaN; 

    
    disp('      n          e_n      e_n+1/e_n')
    fprintf('%12.8f %12.8f %12.8f\n', table2') 
 

    disp('-----------------------------------------------')

    disp('Function f2')
    
    table3 = zeros(result3(1,5), 3);    
    table3(1, 1) = 0;
    table3(1, 2) = NaN;
    table3(1, 3) = NaN;

    for i = 1 : result3(1,5) - 2
      table3(i+1, 1) = i;
      table3(i+1, 2) = abs(result3(2, i+1) - (result3(2, i)).^2);           
    end

    for i = 1 : result3(1,5) - 2 
      table3(i+1, 3) = abs(result3(2, i+2) - result3(2, i+1))/ (abs(result3(2, i+1) - result3(2, i)).^k);
    end

    table3(end, 1) = result3(1,5)-1;
    table3(end, 2) = 0;  
    table3(end, 3) = NaN;

    
    disp('      n          e_n     e_n+1/e_n')
    fprintf('%12.8f %12.8f %12.8f\n', table3') 
    disp('-----------------------------------------------')
      end
   
  case 3
    x=-2:0.1:2; %Some random range for x 
    y1=((x+1).^3).*(x-2);
    y2=exp(x)-(x).^2-2;
    graph_3(x,y1,y2);  
    disp('Graphs can be seen at Figure 1 window')
    
end




















% Question 1.1 - Combined function of bisect and Newton-Raphson

function table = syndyasmos_D_NR (f, df, e1, e2, a, b, n)
  bisect_results = bisect_m(f, a, b, e1, n);
  nr_results = rf_newton2(f, df, bisect_results(end, 4), e2, n);
  
  % Defining the return array 'table'
  row_length = bisect_results(end, 1)+ nr_results(end, 1);
  table = zeros(2, row_length);

  row_length1 = bisect_results(end, 1);
  
  table(1, 1) = bisect_results(end, 2);   % last a value by bisect
  table(1, 2) = bisect_results(end, 3);   % last b value by bisect
  table(1, 3) = bisect_results(end, 4);   % x0 is as close as bisect got to the root
  table(1, 4) = nr_results(end, 2);   % xn is as close as NR got to the root
  table(1, 5) = row_length; % iterations that NR and bisect executed


  table(2, 1:row_length1) = bisect_results(:, 4)';  % the cn values from bisect
  table(2, row_length1+1:row_length) = nr_results(:, 2)';% the xn values from NR
end

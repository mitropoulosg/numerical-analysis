% This is the combined function of Cutting Method and Bisection %

function table = syndyasmos_D_T(f, e1, e2, a, b, n)
  bisect_results = bisect_m(f, a, b, e1, n);
  cut_results = temnousa(f, bisect_results(end, 4), bisect_results(end, 3), e2, n);
  
  % iterations that temnousa and bisect executed 
  row_length = bisect_results(end, 1) + cut_results(end, 1);
  table = zeros(2, row_length);   % create an array with row size equal to the value of row_length
  
   row_length1 = bisect_results(end, 1);

  table(1, 1) = bisect_results(end, 2);   % last a value defined by Bisect
  table(1, 2) = bisect_results(end, 3);   % last b value defined by Bisect
  table(1, 3) = bisect_results(end, 4);   % x0 is as close as Bisect got to ξ
  table(1, 4) = cut_results(end, 2);   % xn is as close as Cutting method got to ξ
  table(1, 5) = row_length;   % iterations that NR and bisect executed 
  
  table(2, 1:row_length1) = bisect_results(:, 4)';                %this row contains the cn values returned from bisect
  table(2, row_length1+1:row_length) = cut_results(:, 2)';        % this row contains the xn values returned from temnousa
end

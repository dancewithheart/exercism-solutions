return function(n)
  if n % 105 == 0 then return 'PlingPlangPlong';
  elseif n % 15 == 0 then return 'PlingPlang';
  elseif n % 21 == 0 then return 'PlingPlong';
  elseif n % 35 == 0 then return 'PlangPlong';
  elseif n % 3 == 0 then return 'Pling';  
  elseif n % 5 == 0 then return 'Plang';
  elseif n % 7 == 0 then return 'Plong';
  else return tostring(n);
  end
end

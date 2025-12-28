return {
  color_code = function(color)
    if color == 'black' then return 0;
    elseif color == 'brown' then return 1;
    elseif color == 'red' then return 2;
    elseif color == 'orange' then return 3;
    elseif color == 'yellow' then return 4;
    elseif color == 'green' then return 5;
    elseif color == 'blue' then return 6;
    elseif color == 'violet' then return 7;
    elseif color == 'grey' then return 8;
    elseif color == 'white' then return 9;
    else return 42;
    end
  end
}

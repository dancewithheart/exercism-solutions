=begin
Write your code for the 'Resistor Color Duo' exercise in this file. Make the tests in
`resistor_color_duo_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/resistor-color-duo` directory.
=end

class ResistorColorDuo
  def self.value(colors)
    nums = colors
      .map{ |c| case c
        when "black"
          0
        when "brown"
          1
        when "red"
          2
        when "orange"
          3
        when "yellow"
          4
        when "green"
          5
        when "blue"
          6     
        when "violet"
          7
        when "grey"
          8
        when "white"
          9              
        else
          0
       end   
      }
    (10 * nums[0]) + nums[1]
  end

end
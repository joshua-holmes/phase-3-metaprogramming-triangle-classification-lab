class Triangle
    def initialize(side_one_length, side_two_length, side_three_length)
        @side_lengths = [side_one_length, side_two_length, side_three_length]
    end
    def kind
        test_1_passes = @side_lengths.sum > 0
        a, b, c = @side_lengths[0], @side_lengths[1], @side_lengths[2]
        test_2_passes = (a + b > c) && (b + c > a) && (c + a > b)
        test_3_passes = a > 0 || b > 0 || c > 0
        if !test_1_passes || !test_2_passes || !test_3_passes
            # binding.pry
            # begin
                raise TriangleError
            # rescue TriangleError => error
            #     puts error.message
            # end
        elsif a == b && a == c
            return :equilateral
        elsif a == b || b == c || c == a
            return :isosceles
        else
            return :scalene
        end
    end

    class TriangleError < StandardError
        def message
            "Side lengths entered to not make a valid triangle"
        end
    end
end

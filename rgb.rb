
# Avrundning, float - int = 0.9111          0.9111 <= 0.5    .ciel eller .floor

# r = 123
# g = 60
# b = 10

def hue_finder_black(rgb)
    r = rgb[0]
    g = rgb[1]
    b = rgb[2]
    if r > g && r > b && r != 255
        hue_black_r = 255 
        hue_black_g = (g * (255.0/r)).to_i
        hue_black_b = (b * (255.0/r)).to_i
    elsif g > r && g > b && g != 255
        hue_black_r = r * (255.0/g)
        hue_black_g = 255
        hue_black_b = b * (255/g)
    elsif b > r && b > g && b != 255
        hue_black_r = (r * (255.0/b)).to_i
        hue_black_g = (g * (255.0/b)).to_i
        hue_black_b = 255
    else
        hue_black_r = r
        hue_black_g = g
        hue_black_b = b
    end
    return [hue_black_r, hue_black_g, hue_black_b]
end

# p hue_finder_black([226, 233, 255])

def hue_finder_white(rgb)
    r = rgb[0]
    g = rgb[1]
    b = rgb[2]
    if r > g && r > b && b != 0 && g != 0
        hue_white_r = r
        if g > b
            hue_white_g = (b*((-255*g/b)+255))/(b-255)
            # (R/255)(255-hue_white_g)+hue_white_g = g
            hue_white_b = 0
        else
            hue_white_g = 0
            hue_white_b = (g*((-255*b/g)+255))/(g-255)
        end

    elsif g > r && g > b && b != 0 && r != 0
        hue_white_g = g
        if r > b
            hue_white_r = (b*((-255*r/b)+255))/(b-255)
            hue_white_b = 0
        else
            hue_white_r = 0
            hue_white_b = (r*((-255*b/r)+255))/(r-255)
        end

    elsif b > g && b > r && r != 0 && g != 0
        hue_white_b = b
        if r > g
            hue_white_r = (g*((-255*r/g)+255))/(g-255)
            hue_white_g = 0
        else
            hue_white_r = 0
            hue_white_g = (r*((-255*g/r)+255))/(r-255)
            # (r((-255*g/r)+255))/(r-255)
        end

    elsif r == 0 || g == 0 || b == 0
        # om alla tal är samma
        # och minst ett av talen är noll
        hue_white_r = r
        hue_white_g = g
        hue_white_b = b
    end

    return [hue_white_r, hue_white_g, hue_white_b]

end

# p hue_finder_white([79, 96, 0])

def hue_finder(rgb)
    return hue_finder_white(hue_finder_black(rgb))
end

# p hue_finder([71, 74, 54])

# OBS RADERA INTE!!!!!11111111!!!!!!!!!!!!!!!!
###################################################################################################
def white(rgb, num)
    r = rgb[0]
    g = rgb[1]
    b = rgb[2]

    # r = r.to_f
    # g = g.to_f
    # b = b.to_f
    
    # n = num
    n = num

    if r == 255 && g == 0
        white_r = r
        white_g = (n*255)/5
        white_b = (n*(255 - b)/5) + b
        # white_b = (4*(255 - b)/5) + b

        # (n*255)/5
    elsif g == 255 && r == 0
        white_r = (n*255)/5
        white_g = g
        white_b = (n*(255 - b)/5) + b
    elsif g == 255 && b == 0
        white_r = (n*(255 - r)/5) + r
        white_g = g
        white_b = (n*255)/5
    elsif b == 255 && g == 0
        white_r = (n*(255 - r)/5) + r
        white_g = (n*255)/5
        white_b = b
    elsif r == 255 && b == 0
        white_r = r
        white_g = (n*(255 - g)/5) + g
        white_b = (n*255)/5
    elsif r == g && g == b && b == r
        white_r = (n*255/5)
        white_g = (n*255/5)
        white_b = (n*255/5)


    else
        white_r = (n*255)/5
        white_g = (n*(255 - g)/5) + g
        white_b = b
    end
    return [white_r, white_g, white_b]
end
        
# p white([255, 135, 0])

def black(rgb, num)
    r = rgb[0]
    g = rgb[1]
    b = rgb[2]

    n = num

    black_r = (n*r)/5
    black_g = (n*g)/5
    black_b = (n*b)/5
    return [black_r, black_g, black_b]
end

# rgb = [90, 3, 5]
# p rgb[2]

# r = hue_finder(rgb)[0]
# g = hue_finder(rgb)[1]
# b = hue_finder(rgb)[2]
# p b

# j = 0

# n = 5 - (j + 1)

# # white_r = r
# # white_g = (n*255)/5
# # white_b = (n*(255 - b)/5) + b
# # white_b = (n*255)/5

# p white([r, g, b], n)[2]

# # r = white_r
# # g = white_g
# # b = white_b
# #  g == 255 && r == 0
# # white_r = (n*255)/5
# # white_g = g
# # white_b = (n*255)/5

# # r = white([r, g, b], 5 - (j + 1))[0]
# # g = white([r, g, b], 5 - (j + 1))[1]
# # b = white([r, g, b], 5 - (j + 1))[2]


# p r
# p g
# p b

# def white_and_black(rgb, num)
#     n = num
#     # r = array[0]
#     # g = array[1]
#     # b = array[2]
#     # p pale(array)[0]
#     # p array
#     return black(white(rgb, n), n)
# end
# p hue_finder([123, 60, 20])
# p black(hue_finder([123, 60, 20]), 4)


    # elsif b == 255 && r == 0
    #     pale_r = 255/2
    #     pale_g = ((255 - b)/2) + b
    #     pale_b = b

# puts "input the main-colour's RGB-values in an array:"

# p "VANLIGTVARDE #{r}"
# p pale_r

# module PortfolioItemsHelper

#     def print_color_palette(colors)
#       color_string = ''
#       colors.each do |c|
#         color_string += content_tag :span, ' ', style: "display: block; float: left;  width: 35px; height: 35px; background: #{c.to_hex}"
#       end
#       content_tag :div, color_string.html_safe, style: "display: inline-block;"
#     end
#   end

# print print_color_palette([71, 74, 54])
  

# image = Camalian::load( File.join( File.dirname(__FILE__), 'colormap.png') )
# colors = image.prominent_colors(15)
# puts colors.map(&:to_hex)


# require 'ruby2d'

# show

# ruby window.rb




# # p "VANLIGTVARDE #{g}"
# # p pale_g


# # p "VANLIGTVARDE #{b}"
# # p pale_b



# p white([0, 68, 255])
# p black([0, 68, 255])
# p white_and_black([0, 68, 255])

# p hue_finder([12, 52, 162])


# #############################################################################################


# @variabel gör den global, det behövs inte!

def white_finder(rgb, j)
    r = rgb[0]
    g = rgb[1]
    b = rgb[2]

    r_tmp = r
    g_tmp = g
    b_tmp = b

    r = white([r_tmp, g_tmp, b_tmp], 5 - (j + 1))[0]
    g = white([r_tmp, g_tmp, b_tmp], 5 - (j + 1))[1]
    b = white([r_tmp, g_tmp, b_tmp], 5 - (j + 1))[2]

    return [r, g, b]
end

def white_and_black_finder(rgb, j, i)
    # p rgb
    if @red_original == @green_original && @green_original == @blue_original
        rgb = [255, 255, 255]
    else
        rgb = hue_finder(rgb)
    end

    rgb = white_finder(rgb, j)

    # p rgb
    # p rgb

    r = black([rgb[0], rgb[1], rgb[2]], 5 - i)[0]
    g = black([rgb[0], rgb[1], rgb[2]], 5 - i)[1]
    b = black([rgb[0], rgb[1], rgb[2]], 5 - i)[2]
    return [r, g, b]
end

def complementary_color_finder(rgb)
    rgb = hue_finder(rgb)
    r = rgb[0]
    g = rgb[1]
    b = rgb[2]
    # 0 och 255 byter plats
    # PROBLEM NÄR 2 VÄRDEN ÄR SAMMA.
    if r == g && g == b && b == r
        r = 255
        g = 255
        b = 255

    elsif r == 255 && g == 0 && r != g && g != b && b != r
        r = 0
        g = 255
        b = 255 - b
    elsif g == 255 && r == 0 && r != g && g != b && b != r
        r = 255
        g = 0
        b = 255 - b

    elsif g == 255 && b == 0 && r != g && g != b && b != r
        r = 255 - r
        b = 255
        g = 0
    elsif b == 255 && g == 0 && r != g && g != b && b != r
        r = 255 - r
        g = 255
        b = 0
    elsif r == 255 && b == 0 && r != g && g != b && b != r
        r = 0
        g = 255 - g
        b = 255
    elsif b == 255 && r == 0 && r != g && g != b && b != r
        r = 255
        g = 255 - g
        b = 0

    elsif r == g && r > b
        r = 0
        g = 0
        b = 255
    elsif r == g && r < b
        r = 255
        g = 255
        b = 0

    elsif g == b && g > r
        r = 255
        g = 0
        b = 0
    elsif g == b && g < r
        r = 0
        g = 255
        b = 255

    elsif b == r && b > g
        r = 0
        g = 255
        b = 0
    elsif b == r && b < g
        r = 255
        g = 0
        b = 255
    else
        r = 255
        g = 255
        b = 255
    end
    return [r, g, b]
end

def randomized_color_finder()
    if @randomized_color_finder_loop_counter != 1
        @randomized_color_finder_loop_counter = 1
        r = rand(0..255)
        g = rand(0..255)
        b = rand(0..255)
        @random_rgb = hue_finder([r, g, b])
    end

    return @random_rgb
end

def mode_selector(rgb, str)
    if str == "2" || str == "complement" || str == "complementary" || str == "c"
        return complementary_color_finder(rgb)
    elsif str == "3" || str == "random" || str == "randomize" || str == "r"
        return randomized_color_finder()
    else
        return rgb
    end
end
# p mode_selector([1, 2, 3], "3")
require 'rubygems'
require 'gosu'   #man får de nödvändiga biblioteken, (behövs rubygems?)

class DemoWindow < Gosu::Window #namnet på fönstret plus Gosu::Window
    def initialize              #initialize ska alltid vara där (för skärmstorlek?)
        super(600,600,false)    #super(bredd,höjd,fullscrren?)
        self.caption = "Monochromatic Color-Finder"
        # BYT NAMN!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        @background_image = Gosu::Image.new("media/quiet_bridge_small.png", :tileable => true)
        # message = ["hej"]
        @font = Gosu::Font.new(32)
        @font2 = Gosu::Font.new(20)
        puts "Input RED-value between 0 and 255:"
        @red_original = gets.chomp.to_i
        puts "Input GREEN-value between 0 and 255:"
        @green_original = gets.chomp.to_i
        puts "Input BLUE-value between 0 and 255:"
        @blue_original = gets.chomp.to_i
        # 22 0 127
        puts "For Normal-Mode, press '1'"
        puts "For Complemmentary Color-Mode, press '2'"
        puts "For Randomized Color-Mode, press '3'"    

        @answer = gets.chomp

        # https://github.com/gosu/gosu-examples/blob/master/examples/text_input.rb
        x = 200
        y = 100
        z = 2

        # behöver inte vara global, minus @
        # color ||= Gosu::Color.argb(255, r, g, b) # Man KAN ANVÄNDA RGB!!!
        # color2 ||= Gosu::Color.new(0x33ebcd1c) # Använder Hex istället för argb
    end

    # def needs_cursor?
    #     true
    # end
    
    # p r.to_s
    # p r.to_s.length
    def button_down id # https://www.engineyard.com/blog/create-ruby-games-using-gosu/ 
        close if id == Gosu::KbEscape || id == Gosu::KbQ # koden stänger av programmet vid tryck på esc eller Q-(quit)
    end
    #     if r.to_s.length < 3

    #         # rgb_value_counter < 3
    #         # || id == Gosu::KbE

    #         # id == Gosu::KbE
    #         # .class == Integer
    #         # p r
    #         if id.class == Integer
    #             # r_hej = id
                
    #             r << (id - 29).to_s


    #         end
    #         # p r
    #         # rgb_value_counter += 1
    #     end

    #     p r
    # end


    # def color_input id
    #     if id == Gosu::Kb
    #         ############################################################################################3

    # r = ""
    # g = ""
    # b = ""
    # rgb_value = r
    # value_input_counter = 0
    # rgb_value_counter = 0


    # def value_input id
    #     while value_input_counter < 3
    #         # id.class == Integer
    #         while id != Gosu::KbEnter || rgb_value.to_s.length < 3
    #             rgb_value << id                
    #         end
    #         if rgb_value_counter == 0
    #             r = rgb_value
    #         elsif rgb_value_counter == 1
    #             g = rgb_value
    #         else
    #             b = rgb_value
    #         end

    #         rgb_value_counter += 1
    #         if rgb_value_counter == 1
    #             rgb_value = g
    #         elsif rgb_value_counter == 2
    #             rgb_value = b
    #         end

    #         value_input_counter += 1
    #     end
    #     return [r.to_i, g.to_i, b.to_i]
    # end

    # r = value_input[0]
    # g = value_input[1]
    # b = value_input[2]

            
    def update
    end

    def draw    

        # r = 0
        # mode_selector([@red_original,@green_original,@blue_original], @answer)[0]


        # red = Gosu::Color.argb(255, 255, 0, 0) # Man KAN ANVÄNDA RGB!!!
        if @answer == "2" || @answer == "complement" || @answer == "complementary" || @answer == "c"
            @font.draw_text("Complementary Color-Finder", 120, 10, 1, 1, 1, Gosu::Color.argb(255, 153, 80, 0))
        elsif @answer == "3" || @answer == "random" || @answer == "randomize" || @answer == "r"
            @font.draw_text("Randomized Color-Finder", 120, 10, 1, 1, 1, Gosu::Color.argb(255, 100, 20, 10))
        else
            @font.draw_text("Monochromatic Color-Finder", 120, 10, 1, 1, 1, Gosu::Color.argb(0xff_000000))
        end

        @font.draw_text("X", 545, 2, 1, 1.5, 1, Gosu::Color::RED)
        @font.draw_text("esc/Q", 533, 27, 1, 0.75, 0.75, Gosu::Color::RED)

        
        @font2.draw_text("RED", 522.5, 75, 2, 1.15, 1.25, Gosu::Color::RED)
        @font.draw_text(hue_finder(mode_selector([@red_original, @green_original, @blue_original], @answer))[0].to_i.to_s, 530, 100, 2)

        @font2.draw_text("GREEN", 522.5, 175, 2, 1.15, 1.25, Gosu::Color::GREEN)
        @font.draw_text(hue_finder(mode_selector([@red_original, @green_original, @blue_original], @answer))[1].to_i.to_s, 530, 200, 2)

        @font2.draw_text("BLUE", 522.5, 275, 2, 1.15, 1.25, Gosu::Color::BLUE)
        @font.draw_text(hue_finder(mode_selector([@red_original, @green_original, @blue_original], @answer))[2].to_i.to_s, 530, 300, 2)

        x_bar = 670
        y_bar= 200
        size_bar = 150

        color3 = Gosu::Color.argb(100, 50, 50, 50)
        # Gosu::Color::GRAY
        draw_quad(x_bar - size_bar, y_bar - size_bar, color3, x_bar + size_bar, y_bar - size_bar, color3, x_bar - size_bar, y_bar + size_bar, color3, x_bar + size_bar, y_bar + size_bar, color3, 1)

        # draw_quad(50, 50, color3, 200, 200, color3, 300, 300, color3, 100, 400, color3, 1)


        # draw_line(x - size, y - size, color, x + size, y + size, color)
        # Ritar en diagonal linje
        # draw_triangle(x - size, y - size, 0xff00ffff, x + size, y - size, 0xff00ffff, x - size, y + size, 0xff00ffff)
        # Ritar en triangel

        # draw_quad(x - size, y - size, 0xff00ffff, x + size, y - size, 0xff00ffff, x - size, y + size, 0xff00ffff, x + size, y + size, 0xff00ffff)

        @background_image.draw(0, 0, 0)
        x = 70
        y = 100
        size = 40 # Variabeldeklarationer
        size2 = 50

        j = 0
        i = 0

        # r = 20
        # g = 10
        # b = 50
        # r = 123
        # g = 60
        # b = 10
        # hue_finder([20, 10, 50])
        # r_original = gets.chomp
        # g_original = gets.chomp
        # b_original = gets.chomp

        while i <= 4

            while j <= 4
                # HA INTE MED TVÅ STRECK, ELLER-TECKNET!!! DET GÖR ATT COLOR ÄR KONSTANT
                # lap_counter += 1

                #########################################
                # rgb = [90, 3, 5]
                # rgb = [255, 0, 6]


                # KRÄVER ATT JAG DEFINIERAR r, g OCH b SOM SINA ORIGINELLA VÄRDEN HÄR UNDER VARJE VARV!!!!!!!!!!!!!!!!!!!!!!!
                
                
                # # r = 0
                # r_original = r_original
                # # g = 255
                # g_original = g_original
                # # b = 147
                # b_original = b_original
                # p r
                # p g
                # p b
                ##########################################

                # rgb = [75, 0, 130]
                # rgb = [230, 100, 20]


                # r = hue_finder(rgb)[0]
                # g = hue_finder(rgb)[1]
                # b = hue_finder(rgb)[2]

                # r_new = r.dup
                # g_original = g.dup
                # b_original = b.dup

                # p r
                # p g
                # p b


                # if j == 0
                #     p r
                #     p g
                #     p b
                # end

                    # p [r, g, b]
                # p r
                # p g
                # p b
                # Ger också bugg, nära 0 och 255? skriv på papper
                # r = hue_finder_black(rgb)[0]
                # g = hue_finder_black(rgb)[1]
                # b = hue_finder_black(rgb)[2]

                # Dessa färgers värden ska vara input-färgerna
                # n = 1
                # VAD ANVÄNDS n TILL? #########################################################################
                # n = 5 - (j + 1)
                # ################################################################################

                # mode_selector([@red_original, @green_original, blue_color], @answer)

                if @red_original == @green_original && @green_original == @blue_original
                    # rgb = [255, 255, 255]
                    rgb = white_and_black_finder([mode_selector([255, 255, 255], @answer)[0], mode_selector([255, 255, 255], @answer)[1], mode_selector([255, 255, 255], @answer)[2]], j, i)
                else
                    rgb = white_and_black_finder([mode_selector([@red_original, @green_original, @blue_original], @answer)[0], mode_selector([@red_original, @green_original, @blue_original], @answer)[1], mode_selector([@red_original, @green_original,@blue_original], @answer)[2]], j, i)
                end

                # rgb = white_and_black_finder([@@red_original,@green_original,@blue_original], j, i)

                color = Gosu::Color.argb(255, rgb[0], rgb[1], rgb[2]) # Man KAN ANVÄNDA RGB!!!
                color2 = Gosu::Color.argb(100, rgb[0], rgb[1], rgb[2]) # Man KAN ANVÄNDA RGB!!!

                # color2 = Gosu::Color.argb(100, 0, 0, 255) # Man KAN ANVÄNDA RGB!!!

                # draw_quad(x - size2, y - size2, color2, x + size2, y - size2, color2, x - size2, y + size2, color2, x + size2, y + size2, color2)
                draw_quad(x - size2, y - size2, color2, x + size2, y - size2, color2, x - size2, y + size2, color2, x + size2, y + size2, color2)

                draw_quad(x - size, y - size, color, x + size, y - size, color, x - size, y + size, color, x + size, y + size, color, 1)

                x += 100
                j += 1

                # r += 10
                # g += 14
                # b += 9
                # lap_counter += 1


            end
            j = 0
            x = 70
            y += 100
            i += 1
            # lap_counter += 1

            # lap_counter += 1
        end
        # 0x[aa][rr][gg][bb]
        # All those two-letter variables have to be a hex-value from 0 to 255, so for example, white is 0xffffffff, blackis 0xff000000, and semi-transparent red is 0x80ff0000.
    end

    def button_down id # https://www.engineyard.com/blog/create-ruby-games-using-gosu/ 
        # x = ""
        # y = ""
        # z = ""
        # r = 0

        if id == Gosu::KB_TAB
            # Tab key will not be 'eaten' by text fields; use for switching through
            # text fields.

        elsif id == Gosu::KB_ESCAPE || id == Gosu::KbQ || id == Gosu::KbX
            # Escape key will not be 'eaten' by text fields; use for deselecting.
            close
        else
            super
        end
      
        # if button_down?(Gosu::Kb1) || button_down?(Gosu::Kb2) || button_down?(Gosu::Kb3) || button_down?(Gosu::Kb4) || button_down?(Gosu::Kb5) || button_down?(Gosu::Kb6) || button_down?(Gosu::Kb7) || button_down?(Gosu::Kb8) || button_down?(Gosu::Kb9)
        #     x = (id - 29).to_s
        #     puts "HEJEHEJEEJEJEJEJEJEJEEJEJEJEJ################################"
        # elsif button_down?(Gosu::Kb0)
        #     x = (id - 39).to_s
        # end
    end
end
DemoWindow.new.show #Namnet plus .new.show visar upp fönstret och får den att köra.


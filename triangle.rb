# KOLLA I PROG_SPEL FÖR HUR MAN ANVÄNDER GOSU!!!!!!!!!!


require "gosu"

class TextField < Gosu::TextInput
  FONT = Gosu::Font.new(20)
  WIDTH = 350
  LENGTH_LIMIT = 3
  PADDING = 5

  INACTIVE_COLOR  = 0xcc_666666
  ACTIVE_COLOR    = 0xcc_ff6666
  SELECTION_COLOR = 0xcc_0000ff
  CARET_COLOR     = 0xff_ffffff

  attr_reader :x, :y

  def initialize(window, x, y)
    # It's important to call the inherited constructor.
    super()

    @window, @x, @y = window, x, y

    # Start with a self-explanatory text in each field.
    self.text = "Click to edit"
  end

  # In this example, we use the filter method to prevent the user from entering a text that exceeds
  # the length limit. However, you can also use this to blacklist certain characters, etc.
  def filter new_text
    allowed_length = [LENGTH_LIMIT - text.length, 0].max
    new_text[0, allowed_length]
  end

  def draw(z)
    # Change the background colour if this is the currently selected text field.
    if @window.text_input == self
      color = ACTIVE_COLOR
    else
      color = INACTIVE_COLOR
    end
    Gosu.draw_rect x - PADDING, y - PADDING, WIDTH + 2 * PADDING, height + 2 * PADDING, color, z

    # Calculate the position of the caret and the selection start.
    pos_x = x + FONT.text_width(self.text[0...self.caret_pos])
    sel_x = x + FONT.text_width(self.text[0...self.selection_start])
    sel_w = pos_x - sel_x

    # Draw the selection background, if any. (If not, sel_x and pos_x will be
    # the same value, making this a no-op call.)
    Gosu.draw_rect sel_x, y, sel_w, height, SELECTION_COLOR, z

    # Draw the caret if this is the currently selected field.
    if @window.text_input == self
      Gosu.draw_line pos_x, y, CARET_COLOR, pos_x, y + height, CARET_COLOR, z
    end

    # Finally, draw the text itself!
    FONT.draw_text self.text, x, y, z
  end

  def height
    FONT.height
  end

  # Hit-test for selecting a text field with the mouse.
  def under_mouse?
    @window.mouse_x > x - PADDING and @window.mouse_x < x + WIDTH + PADDING and
      @window.mouse_y > y - PADDING and @window.mouse_y < y + height + PADDING
  end

  # Tries to move the caret to the position specifies by mouse_x
  def move_caret_to_mouse
    # Test character by character
    1.upto(self.text.length) do |i|
      if @window.mouse_x < x + FONT.text_width(text[0...i])
        self.caret_pos = self.selection_start = i - 1;
        return
      end
    end
    # Default case: user must have clicked the right edge
    self.caret_pos = self.selection_start = self.text.length
  end
end

class TextInputDemo < (Example rescue Gosu::Window)
  def initialize
    super 640, 480
    self.caption = "Text Input Demo"


    text =
      "This demo explains (in the source code) how to use the Gosu::TextInput API by building a little TextField class around it.
      Each text field can take up to 30 characters, and you can use Tab to switch between them.
      As in every example, press <b>E</b> to look at the source code."

    # Remove all leading spaces so the text is left-aligned
    text.gsub! /^ +/, ""

    @text = Gosu::Image.from_markup text, 20, width: 540

    # Set up an array of three text fields.
    @text_fields = Array.new(3) { |index| TextField.new(self, 50, 300 + index * 50) }
  end

  def needs_cursor?
    true
  end

  def draw
    @text.draw 50, 50, 0
    @text_fields.each { |tf| tf.draw(0) }
  end

  def button_down(id)
    if id == Gosu::KB_TAB
      # Tab key will not be 'eaten' by text fields; use for switching through
      # text fields.
      index = @text_fields.index(self.text_input) || -1
      self.text_input = @text_fields[(index + 1) % @text_fields.size]
    elsif id == Gosu::KB_ESCAPE
      # Escape key will not be 'eaten' by text fields; use for deselecting.
      if self.text_input
        self.text_input = nil
      else
        close
      end
    elsif id == Gosu::MS_LEFT
      # Mouse click: Select text field based on mouse position.
      self.text_input = @text_fields.find { |tf| tf.under_mouse? }
      # Also move caret to clicked position
      self.text_input.move_caret_to_mouse unless self.text_input.nil?
    else
      super
    end
  end
end

TextInputDemo.new.show if __FILE__ == $0





# oMinstallera ruby
# sök på ADD GEMS MANUALLY ON RUBY
# Man ska lägga till gem-filen i mappen för gems på datorn

# require 'gosu'

# # # Set the window size
# # set width: 300, height: 200

# # # Create a new shape
# # s = Square.new

# # # Give it some color
# # s.color = 'red'

# # Show the window
# show
# ruby -rgosu -e 'w = Gosu::Window.new(200, 150); w.caption = "It works!"; w.show'

# require 'rubygems'
# require 'gosu'

# class TextField < Gosu::TextInput
#   # Some constants that define our appearance.
#   INACTIVE_COLOR  = 0xcc666666
#   ACTIVE_COLOR    = 0xccff6666
#   SELECTION_COLOR = 0xcc0000ff
#   CARET_COLOR     = 0xffffffff
#   PADDING = 5
  
#   attr_reader :x, :y
  
#   def initialize(window, font, x, y)
#     # TextInput's constructor doesn't expect any arguments.
#     super()
    
#     @window, @font, @x, @y = window, font, x, y
    
#     # Start with a self-explanatory text in each field.
#     self.text = "Click to change text"
#   end
  
#   # Example filter method. You can truncate the text to employ a length limit (watch out
#   # with Ruby 1.8 and UTF-8!), limit the text to certain characters etc.
#   def filter text
#     text.upcase
#   end
  
#   def draw
#     # Depending on whether this is the currently selected input or not, change the
#     # background's color.
#     if @window.text_input == self then
#       background_color = ACTIVE_COLOR
#     else
#       background_color = INACTIVE_COLOR
#     end
#     @window.draw_quad(x - PADDING,         y - PADDING,          background_color,
#                       x + width + PADDING, y - PADDING,          background_color,
#                       x - PADDING,         y + height + PADDING, background_color,
#                       x + width + PADDING, y + height + PADDING, background_color, 0)
    
#     # Calculate the position of the caret and the selection start.
#     pos_x = x + @font.text_width(self.text[0...self.caret_pos])
#     sel_x = x + @font.text_width(self.text[0...self.selection_start])
    
#     # Draw the selection background, if any; if not, sel_x and pos_x will be
#     # the same value, making this quad empty.
#     @window.draw_quad(sel_x, y,          SELECTION_COLOR,
#                       pos_x, y,          SELECTION_COLOR,
#                       sel_x, y + height, SELECTION_COLOR,
#                       pos_x, y + height, SELECTION_COLOR, 0)

#     # Draw the caret; again, only if this is the currently selected field.
#     if @window.text_input == self then
#       @window.draw_line(pos_x, y,          CARET_COLOR,
#                         pos_x, y + height, CARET_COLOR, 0)
#     end

#     # Finally, draw the text itself!
#     @font.draw(self.text, x, y, 0)
#   end

#   # This text field grows with the text that's being entered.
#   # (Usually one would use clip_to and scroll around on the text field.)
#   def width
#     @font.text_width(self.text)
#   end
  
#   def height
#     @font.height
#   end

#   # Hit-test for selecting a text field with the mouse.
#   def under_point?(mouse_x, mouse_y)
#     mouse_x > x - PADDING and mouse_x < x + width + PADDING and
#       mouse_y > y - PADDING and mouse_y < y + height + PADDING
#   end
  
#   # Tries to move the caret to the position specifies by mouse_x
#   def move_caret(mouse_x)
#     # Test character by character
#     1.upto(self.text.length) do |i|
#       if mouse_x < x + @font.text_width(text[0...i]) then
#         self.caret_pos = self.selection_start = i - 1;
#         return
#       end
#     end
#     # Default case: user must have clicked the right edge
#     self.caret_pos = self.selection_start = self.text.length
#   end
# end

# class TextInputWindow < Gosu::Window
#   def initialize
#     super(300, 200, false)
#     self.caption = "Text Input Example"
    
#     font = Gosu::Font.new(self, Gosu::default_font_name, 20)
    
#     # Set up an array of three text fields.
#     @text_fields = Array.new(3) { |index| TextField.new(self, font, 50, 30 + index * 50) }
    
#     @cursor = Gosu::Image.new(self, "media/Cursor.png", false)
#   end
  
#   def draw
#     @text_fields.each { |tf| tf.draw }
#     @cursor.draw(mouse_x, mouse_y, 0)
#   end
  
#   def button_down(id)
#     if id == Gosu::KbTab then
#       # Tab key will not be 'eaten' by text fields; use for switching through
#       # text fields.
#       index = @text_fields.index(self.text_input) || -1
#       self.text_input = @text_fields[(index + 1) % @text_fields.size]
#     elsif id == Gosu::KbEscape then
#       # Escape key will not be 'eaten' by text fields; use for deselecting.
#       if self.text_input then
#         self.text_input = nil
#       else
#         close
#       end
#     elsif id == Gosu::MsLeft then
#       # Mouse click: Select text field based on mouse position.
#       self.text_input = @text_fields.find { |tf| tf.under_point?(mouse_x, mouse_y) }
#       # Advanced: Move caret to clicked position
#       self.text_input.move_caret(mouse_x) unless self.text_input.nil?
#     end
#   end
# end

# TextInputWindow.new.show

# class Box < Gosu::Window
#   def initialize
#     super 640, 480
#     # Skärmens dimensioner
#     self.caption = "Box Game"
#     # Namn
#     @background_image = Gosu::Image.new("media/space.png", :tileable => true)
#     # bakgrund läggs i media-mappen
#     # @color = Gosu::Color::BLACK.dup

#   end
#   def font dir, size

#   end

#   def update
#     # ...
#   end
  
#   def draw
#     # ...
#     @background_image.draw(0, 0, 0)
#     # Bilden ritas i mitten
#     # @color.draw(0, 0, 0)
#   end
# end

# # Tutorial.new.show
# require 'gosu'
# require 'minigl'
# include MiniGL


# class Tutorial < Gosu::Window
#   def initialize
#     super 640, 480
#     # Skärmens dimensioner
#     self.caption = "Tutorial Game"
#     # Namn
#     # @background_image = Gosu::Image.new("media/space.png", :tileable => true)
    
#     # bakgrund läggs i media-mappen
#     # @color = Gosu::Color::BLACK.dup
#     @walls = [
#       Block.new(0, 0, 10, 600),
#       Block.new(0, 0, 800, 10),
#       Block.new(790, 0, 10, 600),
#       Block.new(0, 590, 800, 10),
#       Block.new(250, 0, 10, 400),
#       Block.new(550, 200, 10, 400)
#     ]


#   end
#   # def bounds
#   #   BoundingBox.new(@x, @y, 150, 150)
#   # end

      
#       # def draw
#       #   @text_fields.each { |tf| tf.draw }
#       #   @cursor.draw(mouse_x, mouse_y, 0)
#       # end
  
#   def update
#     # ...
#   end
  
#   def draw
#     # draw_quad(x-size, y-size, 0xffffffff, x+size, y-size, 0xffffffff, x-size, y+size, 0xffffffff, x+size, y+size, 0xffffffff, 0)
#     @walls.each do |w|
#       draw_quad(w.x, w.y, 0xff000000,
#                 w.x + w.w, w.y, 0xff000000,
#                 w.x, w.y + w.h, 0xff000000,
#                 w.x + w.w, w.y + w.h, 0xff000000, 0)
#     end

#     # ...
#     # @background_image.draw(0, 0, 0)
#     # Bilden ritas i mitten
#     # @color.draw(0, 0, 0)
#   end
# end
# Tutorial.new.show

# # require 'rubygems'
# require 'gosu'

# class DemoWindow < Gosu::Window
#   def initialize
#     super(640, 400, false)
#   end

#   def update
#   end

#   def draw
#      draw_quad(x-size, y-size, 0xffffffff, x+size, y-size, 0xffffffff, x-size, y+size, 0xffffffff, x+size, y+size, 0xffffffff, 0)
#      draw_triangle(x1, y1, c1, x2, y2, c2, x3, y3, c3, z=0, mode=:default)
#      draw_line(x1, y1, c1, x2, y2, c2, z=0, mode=:default)

# end


# class DemoWindow < Gosu::Window
#   def initialize
#     super(640, 400, false)
#   end

#   def update
#   end

#   def draw
#     draw_quad(x-size, y-size, 0xffffffff, x+size, y-size, 0xffffffff, x-size, y+size, 0xffffffff, x+size, y+size, 0xffffffff, 0)
#     draw_triangle(x1, y1, c1, x2, y2, c2, x3, y3, c3, z=0, mode=:default)
#     draw_line(x1, y1, c1, x2, y2, c2, z=0, mode=:default)
# end


# #       background_color = ACTIVE_COLOR
# class TextInputWindow < Gosu::Window
#   def initialize
#     super(300, 200, false)
#     self.caption = "Text Input Example"
    
#     font = Gosu::Font.new(self, Gosu::default_font_name, 20)
    
#     # Set up an array of three text fields.
#     @text_fields = Array.new(3) { |index| TextField.new(self, font, 50, 30 + index * 50) }
    
#     # @cursor = Gosu::Image.new(self, "media/Cursor.png", false)
#   end

#   def update
#   end

#   def draw
#   end
# end
# TextInputWindow.new.show

# :fullscreen => true för skärmdimensionerna för fullscreen.


# require 'simple2d'

# set title: "Hello Triangle"

# Triangle.new(
#   x1: 320, y1:  50,
#   x2: 540, y2: 430,
#   x3: 100, y3: 430,
#   color: ['red', 'green', 'blue']
# )

# show

# S2D_Window *window = S2D_CreateWindow(
#   "Hello World!",  
#   # // title of the window
#   800, 600,        
#   # // width and height
#   update, render,  
#   # // callback function pointers (these can be NULL)
#   0                
#   # // flags
# );

# S2D_DrawTriangle(x1, y1, r1, g1, b1, a1,
#                  x2, y2, r2, g2, b2, a2,
#                  x3, y3, r3, g3, b3, a3);



# gem 'ruby2d', '~> 0.11.2'

# C:\Ruby30-x64\bin\ruby2d-0.11.2.gem

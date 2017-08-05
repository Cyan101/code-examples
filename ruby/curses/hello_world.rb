require "curses"

def show_message(message)
  height = 5
  width  = message.length + 6
  top    = (Curses.lines - height) / 2
  left   = (Curses.cols - width) / 2
  win = Curses::Window.new(height, width, top, left) # Build the window from the variables above
  win.box("/", "~") # The sides and top/bottom of the box made
  win.setpos(2, 3) # Sets the position of the message/stuff inside the box
  win.addstr(message) # Add a string to the box
  win.refresh # Update the windows (Show what we did above)
  win.getch # Wait for user input (?)
  win.close # Close the window
end

Curses.init_screen
begin
  Curses.crmode
  Curses.setpos((Curses.lines - 1) / 2, (Curses.cols - 11) / 2)
  Curses.addstr("Hit any key")
  Curses.refresh
  Curses.getch
  show_message("Hello, World!")
ensure
  Curses.close_screen
end

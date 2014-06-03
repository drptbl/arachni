=begin
    Copyright 2010-2014 Tasos Laskos <tasos.laskos@gmail.com>
    All rights reserved.
=end

require 'io/console'

module Arachni
module Support
module Mixins

# Terminal manipulation methods
#
#
# Driver/demo code
#
#
#        require_relative 'terminal'
#        require_relative 'progress_bar'
#
#        include Terminal
#        include ProgressBar
#
#        # clear the screen
#        clear_screen
#
#        start_time = Time.now
#
#        MAX = 5000
#        (1..MAX).each {
#            |i|
#
#            # move the cursor to its home, top-left of the screen.
#            move_to_home
#
#            prog =  i / Float( MAX ) * 100
#
#            reputs "Counting to #{MAX}..."
#            reputs "Progress:   #{prog}%"
#            reputs "Current:    #{i}"
#
#            reputs
#            reprint eta( prog, start_time ) + "    "
#            reputs progress_bar( prog.ceil )
#
#
#            # make sure that everything is sent out on time
#            flush
#            sleep 0.003
#        }
module Terminal

    # Clears the line before printing using `puts`.
    #
    # @param    [String]    str
    #   String to output
    def reputs( str = '' )
        reprint str + "\n"
    end

    # Clears the line before printing.
    #
    # @param    [String]    str
    #   String to output.
    def reprint( str = '' )
        print restr( str )
    end

    def restr( str = '' )
        "\e[0K" + str
    end

    # Clear the bottom of the screen
    def clear_screen
        print "\e[2J"
    end

    def empty_screen
        move_to_home
        rows, cols = $stdin.winsize
        (rows - 1).times{ puts ' ' * cols }
        move_to_home
    end

    # Moves cursor top left to its home
    def move_to_home
        print "\e[H"
    end

    # Flushes the STDOUT buffer
    def flush
        $stdout.flush
    end

    extend self
end

end
end
end

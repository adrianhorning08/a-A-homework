class Stack
  attr_reader :stack

    def initialize
      @stack = []
    end

    def add(el)
      @stack << el
    end

    def remove
      @stack.pop
    end

    def show
      @stack.dup
    end
end

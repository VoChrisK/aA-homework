class Queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue.unshift(el)
        self
    end

    def dequeue
        @queue.pop
    end

    def peek
        @queue[-1]
    end

    def empty?
        @queue.length == 0
    end

    def show
        p @queue
        self
    end
end
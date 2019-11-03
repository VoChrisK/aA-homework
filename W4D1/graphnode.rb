require_relative "queue.rb"
require "set"

class GraphNode
    attr_reader :value, :neighbors, :visited
    attr_writer :neighbors, :visited

    def initialize(value)
        @value = value
        @neighbors = []
        @visited = false
    end

    def inspect
        @value.inspect
    end
end

def bfs(starting_node, target_value)
    visited = Set.new
    queue = Queue.new
    queue.enqueue(starting_node)

    while !queue.empty?
        node = queue.dequeue
        return node if node.value == target_value
        if !visited.include?(node)
            node.neighbors.each { |neighbor| queue.enqueue(neighbor) }
            visited << node 
        end
    end

    nil
end

def _bfs(starting_node, adj_list, target_value)
    queue = Queue.new
    queue.enqueue(starting_node)

    while !queue.empty?
        node = queue.dequeue
        print node.value
        print " "
        if node.value == target_value
            puts queue.show
            return node
        end
        if !node.visited
            adj_list[node].each { |neighbor| queue.enqueue(neighbor) }
            node.visited = true
        end
    end

    reset_visited(adj_list)
    puts queue.show
    nil
end

def reset_visited(adj_list)
    adj_list.each_key { |node| node.visited = false }
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
g = GraphNode.new('g')
h = GraphNode.new('h')
i = GraphNode.new('i')
j = GraphNode.new('j')

adj_list = {
    a => [b, c, f, j],
    b => [a, c, g, h, i],
    c => [a, b, d, e, h],
    d => [c, j],
    e => [c, g, i],
    f => [a, h, i, j],
    g => [b, e, j],
    h => [b, c, f, i],
    i => [b, e, f, h],
    j => [d, f, g]
}

a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]
p bfs(a, "b")
p bfs(a, "f")
puts _bfs(a, adj_list, "i")
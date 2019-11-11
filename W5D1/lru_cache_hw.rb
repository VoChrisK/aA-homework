class LRUCache
    def initialize(size)
        @cache = []
        @cache_size = size
    end

    def count
      # returns number of elements currently in cache
      cache_size
    end

    # O(n) runtine for add method
    def add(el) #cache.first is the most recent ele and cache.last is the least recent ele
      # adds element to cache according to LRU principle
      check_dups(el)
      @cache.unshift(el)
    end

    def show
      # shows the items in the cache, with the LRU item first
      p cache
      self
    end

    private
    # helper methods go here!
    attr_reader :cache, :cache_size

    # O(1)
    def pop_most_recent
        if cache.length >= cache_size
            cache.pop
        end
    end

    # O(n)
    def any_dups?(ele)
        cache.each do |cache_ele|
            return true if cache_ele == ele
        end
        false
    end

    # O(n)
    def update_ele(ele)
        idx = cache.index(ele)
        cache.delete_at(idx) unless idx.nil?
    end

    # O(n)
    def check_dups(ele)
        if !any_dups?(ele)
            pop_most_recent
        else
            update_ele(ele)
        end
    end
end

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)

# [5, [1,2,3], "I walk the line"]

johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])

# [[1,2,3,4], {a: 1, b: 2, c: 3}, -5, 5]

johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)

# [:ring_of_fire, "I walk the line", [1,2,3,4], {a: 1, b: 2, c: 3}]

johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})


johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]

johnny_cache.add(:ring_of_fire)
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(1234567890)
johnny_cache.show # -> prints [1234567890, "I walk the line", [1, 2, 3, 4], :ring_of_fire]
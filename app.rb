class LinkedList
    def initialize
        @node_count = 0
        @head = nil
        @tail = nil
    end

    def append(value)
        n = Node.new(value)
        if @head.nil?
            @head = n
        else
            if @head.next_node.nil?
                @head.next_node = n
            else
                nx = @head.next_node
                until nx.next_node.nil?
                    nx = nx.next_node
                end
                nx.next_node = n
                @tail = n
            end
        end
        @node_count+=1
    end

    def prepend(value)
        n = Node.new(value)
        n.next_node = @head
        @head = n
        @node_count+=1
    end

    def size
        @node_count
    end

    def head
        @head
    end

    def tail
        @tail
    end

    def at(index)
        if index == 1
            return @head
        end
        
        node = @head
        while index > 1
           node = node.next_node
           index-=1
        end 
        return node
    end

    def pop
        i = 1
        until self.at(i) == @tail
            i+=1
        end
        self.at(i-1).next_node = nil
        @tail = self.at(i-1)
    end

    def contains?(value)
        if @tail.value == value
            return true
        end

        i = 1
        until self.at(i) == @tail
            if self.at(i).value == value
                return true
            end
            i+=1
        end
        return false
    end
    
    def find(value) 
        unless contains?(value)
            return nil
        end
        
        i=1
        until self.at(i) == @tail
            if self.at(i).value == value
                return i
            end
            i+=1
        end
        return i
    end

    def to_s
        node = @head
        
        until node.next_node == nil
            print "( #{node.value} ) -> "
            node = node.next_node
        end
        print "( #{self.tail.value} ) -> nil"
        puts
    end

end

class Node
    attr_accessor :value
    attr_accessor :next_node

    def initialize (value=nil, next_node=nil)
        @value = value
        @next_node = next_node
    end

    def value 
        @value
    end

    def next_node
        @next_node
    end
end


# l = LinkedList.new
# l.append(4)
# l.append(5)
# l.append(6)
# l.prepend(9)
# l.append(10)
# l.prepend(7)

# p l.head
# p l.tail
# p l.size
# p l.find(10)
# l.to_s
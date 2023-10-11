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

l = LinkedList.new
l.append(4)
l.append(5)
l.append(6)
l.prepend(9)


# p l.head.value
# p l.head.next_node
p l.head.next_node.value
p l.tail
p l.size
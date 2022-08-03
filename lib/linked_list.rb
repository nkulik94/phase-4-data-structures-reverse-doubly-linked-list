require_relative './node'

class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def reverse_node node
    if node.prev_node
      if !node.next_node
        node.next_node = node.prev_node
        node.prev_node = nil
        self.head = node
      else
        old_next = node.next_node
        node.next_node = node.prev_node
        node.prev_node = old_next
      end
      reverse_node(node.next_node)
    else
      node.prev_node = node.next_node
      node.next_node = nil
      self.tail = node
    end
  end

  def reverse!
    if !self.head
      return
    end
    reverse_node(self.tail)
  end
end

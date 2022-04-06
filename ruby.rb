# Class holds the binary search tree
class Tree
  attr_accessor :array, :root

  def initialize(array)
    @array = array.uniq.sort
    @root = build_tree(@array)
  end

  # Uses recursion to construct the balanced binary search tree from validated array
  def build_tree(array, array_start = 0, array_end = 0)
    return nil if array_start > array_end

    midpoint = ((array.length) / 2)
    node = Node.new(array[midpoint])
    node.left_child = build_tree(array[0..midpoint - 1], 0, midpoint - 1 )
    node.right_child = build_tree(array[midpoint + 1..array.length - 1], midpoint + 1, array.length - 1)

    node
  end

  def insert(value, node = nil)
    unless @root
      @root = Node.new(value)
      return
    end

    node ||= @root

    if value < node.value
      if node.left_child
        return insert(value, node.left_child)
      else
        node.left_child = Node.new(value)
      end
    elsif value > node.value
      if node.right_child
        return insert(value, node.right_child)
      else
        node.right_child = Node.new(value)
      end
    end
    node
  end

  # def delete(value, node = root)

  # end

  def find(value, node = nil)
    node ||= @root
    if node.value == value
      return "node object ID is #{node.object_id}"
    end

    if value < node.value
      if node.left_child
        find(value, node.left_child)
      else
        false
      end
    elsif value > node.value
      if node.right_child
        find(value, node.right_child)
      else
        false
      end
    end
  end

  # produces output of values using breadth-first traversal of tree
  def level_order(node = @root, queue = [])
    print "#{node.value}, "
    unless node.left_child.nil?
    queue << node.left_child
    end
    unless node.right_child.nil? 
    queue << node.right_child
    end 
    return if queue.empty?

    level_order(queue.shift, queue)
  end

  # traverse the tree, depth first using pre-order approach
  def preorder(node = @root)
    return if node.nil?

    print "#{node.value}, "
    preorder(node.left_child)
    preorder(node.right_child)
  end

  # traverse the tree, depth first using in-order approach
  def inorder(node = @root)
    return if node.nil?

    inorder(node.left_child)
    print "#{node.value}, "
    inorder(node.right_child)
  end

  # traverse the tree, depth first using post-order approach
  def postorder(node = @root)
    return if node.nil?

    postorder(node.left_child)
    postorder(node.right_child)
    print "#{node.value}, "
  end

  # method to display the balanced binary search tree in console (thank you to ODIN user for this code)
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
  end
end

# class creates new nodes for the binary search tree
class Node
  attr_accessor :value, :left_child, :right_child

  def initialize(value)
    @value = value
    @left_child
    @right_child
  end
end

# driver code
new_array = (Array.new(15) { rand(1..100) })
test = Tree.new(new_array)
test.validate_array(test.array)
test.build_tree(test.array)
test.pretty_print
test.insert(15)
test.pretty_print
p test.find(1467)
p test.find(5)
test.level_order
test.preorder
test.inorder
test.postorder
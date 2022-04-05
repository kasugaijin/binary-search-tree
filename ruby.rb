class Tree

  attr_accessor :array, :root

  def initialize(array)
    @array = array
    @root = nil
  end

  # remove duplicates and sort the array
  def validate_array(array)
    validated_array = array.uniq.sort
    @array = validated_array
  end

  def build_tree(array, array_start = 0, array_end = 0)
    return nil if array_start > array_end

    midpoint = ((array.length) / 2)
    # array_start = 0
    # array_end = array.length - 1
    node = Node.new(array[midpoint])
    node.left_child = build_tree(array[0..midpoint - 1], 0, midpoint - 1 )
    node.right_child = build_tree(array[midpoint + 1..array.length - 1], midpoint + 1, array.length - 1)

    @root = node
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
  end

end

class Node
  attr_accessor :value, :left_child, :right_child

  def initialize(value)
    @value = value
    @left_child
    @right_child
  end

end

test = Tree.new([1,4,7,6,6, 4, 10, 9,2,3,10,5, 11])
test.validate_array(test.array)
test.build_tree(test.array)
test.pretty_print
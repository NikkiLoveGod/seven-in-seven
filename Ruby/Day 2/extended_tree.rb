# Extend tree class to specify a new tree with a clean UI. Extend the Tree to accept a nested structure of hashes and
# arrays in the initializer.

given_initialize_hash = {
    'grandpa' => {
        'dad' => {
            'Child 1' => {},
            'Child 2' => {},
        },
        'uncle' => {
            'Uncle Child 1' => {},
            'Uncle Child 2' => {},
        },
    },
    'grandpas Bro' => {
        'Granpas bro dad' => {
            'Grampa bro Child 1' => {},
            'Grampa bro Child 2' => {},
        },
        'Grampa bro uncle' => {
            'Grampa bro Uncle Child 1' => {},
            'Grampa bro Uncle Child 2' => {},
        },
    }
}


class Given_Original_Tree
  attr_accessor :children, :node_name

  def initialize(name, children=[])
    @node_name = name
    @children = children
  end

  def visit(&block)
    block.call self
  end

  def visit_all(&block)
    visit &block
    children.each { |c| c.visit_all &block }
  end
end

class Extended_Tree < Given_Original_Tree
  def create_leaves(hashMap)
    hashMap.collect { |name, children| Given_Original_Tree.new(name, create_leaves(children)) }
  end

  def initialize(hashMap)
    childs = create_leaves(hashMap)
    super("Root", childs)
  end
end


## USAGE


ruby_tree = Extended_Tree.new(given_initialize_hash)

puts "Visiting a node"
ruby_tree.visit { |node| puts node.node_name }
puts

puts "Visiting all nodes"
ruby_tree.visit_all { |node| puts node.node_name }
puts


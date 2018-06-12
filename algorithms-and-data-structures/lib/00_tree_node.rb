module Searchable
  def dfs(target = nil, &prc)
    prc ||= Proc.new { |node| node.value == target }
    return self if prc.call(self)

    children.each do |child|
      result = child.dfs(&prc)
      return result if result
    end
    nil
  end

  def bfs(target = nil, &prc)
    prc ||= Proc.new { |node| node.value == target }

    nodes = [self]
    until nodes.empty?
      node = nodes.shift

      return node if prc.call(node)
      nodes.concat(node.children)
    end
  end
  nil
end

class PolyTreeNode
  include Searchable

  attr_accessor :children
  attr_reader :value, :parent

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(parent)
    self.parent.children.delete(self) if self.parent
    @parent = parent
    self.parent.children << self unless self.parent.nil?
  end

  def add_child(node)
    node.parent = self
  end

  def remove_child(node)
    raise "node is not a child" if !self.children.include?(node)
    node.parent = nil
  end
end

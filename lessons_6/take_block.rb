module TakeBlock
  def wagon_block
    self.each {|obj| yield(obj)}
  end
end

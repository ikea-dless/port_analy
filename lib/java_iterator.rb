module JavaIterator
  def each
    i = self.iterator
    yield i.next while i.has_next
  end
end

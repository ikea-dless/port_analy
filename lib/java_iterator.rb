module JavaIterator
  def each
    i = self.iterator
    while i.has_next
      yield i.next
    end
  end
end

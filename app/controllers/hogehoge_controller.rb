class HogehogeController < ApplicationController
  def index
    ({ :hash => 'yeaaaaaaa', :hash2 => 'olddddddd' }).each do |h|
      p 'old'
    end
  end

  def create
  end
end

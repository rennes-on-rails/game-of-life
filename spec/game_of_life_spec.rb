require 'spec_helper'

class GameOfLife
  def grid
    [1, 1, 1]
  end
end

describe GameOfLife do
  describe "#new" do
    it "should be built out of a grid" do
      game = GameOfLife.new([[0, 0, 0], [0, 0, 0], [0, 0, 0]])
      game.grid.size.should == 3
    end
  end
end
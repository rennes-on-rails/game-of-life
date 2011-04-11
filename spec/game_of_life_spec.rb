require 'spec_helper'

class GameOfLife
  attr_accessor :grid

  def initialize(grid)
    @grid = grid
  end

  def alive(x, y)
    grid[x][y] == 1
  end

  def tick
    nb_neighbors = grid.flatten.select{|c| c == 1}.count
    if alive(1,1)
      if nb_neighbors < 3 or 4 < nb_neighbors
        grid[1][1] = 0
      end
    else
      if nb_neighbors == 3
        grid[1][1] = 1
      end
    end
  end
end

describe GameOfLife do
  describe "#new" do
    it "should be built out of a grid" do
      game = GameOfLife.new([[0, 0, 0], [0, 0, 0], [0, 0, 0]])
      game.grid.size.should == 3
    end
  end

  describe "#alive" do
    it "should say me if cell alive" do
      game = GameOfLife.new([[0, 0, 0], [0, 0, 0], [0, 0, 0]])
      game.alive(1, 1).should == false
      game = GameOfLife.new([[0, 0, 0], [0, 1, 0], [0, 0, 0]])
      game.alive(1, 1).should == true
      game.alive(0, 1).should == false
    end
  end

  describe "#tick" do
    context "with 0 alive neighbors" do
      it "central cell should die" do
        game = GameOfLife.new([[0, 0, 0], [0, 1, 0], [0, 0, 0]])
        game.tick
        game.alive(1,1).should == false
      end
    end

      context "with 2 alive neighbors" do
        it "central cell should still be alive" do
          game = GameOfLife.new([[1, 1, 0], [0, 1, 0], [0, 0, 0]])
          game.tick
          game.alive(1,1).should == true
        end
      end

      context "with 4 alive neighbors" do
        it "central cell should die" do
          game = GameOfLife.new([[1, 1, 0], [1, 1, 1], [0, 0, 0]])
          game.tick
          game.alive(1,1).should == false
        end
      end
        context "dead with 3 alive neighbors" do
          it "central cell should be dead to alive !" do
            game = GameOfLife.new([[1, 1, 0], [1, 0, 0], [0, 0, 0]])
            game.tick
            game.alive(1,1).should == true
          end
        end
        context "alive with 1 alive neighbors" do
          it "central cell should be alive to dead !" do
            game = GameOfLife.new([[1, 0, 0], [0, 1, 0], [0, 0, 0]])
            game.tick
            game.alive(1,1).should == false
          end
        end
  end
end
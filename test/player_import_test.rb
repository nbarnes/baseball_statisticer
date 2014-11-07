
require_relative './minitest_helper.rb'
require_relative '../source/player_factory.rb'
require_relative '../source/player.rb'
require 'pry'

class TestPlayerImport < MiniTest::Test

  def test_player_import
    players = PlayerFactory.import_from_csv_file('./test/data/players.csv', false)[:players]
    assert_equal players.inspect, IO.read('./test/data/player_import_expected_results.txt')
  end

  def test_player_import_errors
    errors = PlayerFactory.import_from_csv_file('./test/data/players.csv', false)[:errors]
    assert_equal errors.inspect, IO.read('./test/data/player_import_expected_errors.txt')
  end

end


require_relative './minitest_helper.rb'
require_relative '../source/season_stats_factory.rb'

class TestStatsImport < MiniTest::Test

  def test_stats_import
    stats = SeasonalStatsFactory.import_from_csv_file('./test/data/stats.csv', false)[:stat_lines]
    assert_equal stats.inspect, IO.read('./test/data/stats_import_expected_results.txt')
  end

  def test_stats_import_errors
    errors = SeasonalStatsFactory.import_from_csv_file('./test/data/stats.csv', false)[:errors]
    assert_equal errors.inspect, IO.read('./test/data/stats_import_expected_errors.txt')
  end

end

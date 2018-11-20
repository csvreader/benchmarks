# encoding: utf-8

###
## note: use ruby ./test.rb to run test


require 'minitest/autorun'


require 'csv'
require 'csvreader'


require_relative 'split'



class TabularTest  < MiniTest::Test

def msft_recs
[["Date", "Open", "High", "Low", "Close", "Adj Close", "Volume"],
 ["2018-01-02", "86.129997", "86.309998", "85.500000", "85.949997", "84.487411", "22483800"],
 ["2018-01-03", "86.059998", "86.510002", "85.970001", "86.349998", "84.880608", "26061400"],
 ["2018-01-04", "86.589996", "87.660004", "86.570000", "87.110001", "85.627678", "21912000"],
 ["2018-01-05", "87.660004", "88.410004", "87.430000", "88.190002", "86.689301", "23407100"],
 ["2018-01-08", "88.199997", "88.580002", "87.599998", "88.279999", "86.777763", "22113000"],
 ["2018-01-09", "88.650002", "88.730003", "87.860001", "88.220001", "86.718788", "19484300"],
 ["2018-01-10", "87.860001", "88.190002", "87.410004", "87.820000", "86.325592", "18652200"],
 ["2018-01-11", "88.129997", "88.129997", "87.239998", "88.080002", "86.581169", "17808900"],
 ["2018-01-12", "88.669998", "89.779999", "88.449997", "89.599998", "88.075310", "24271500"],
 ["2018-01-16", "90.099998", "90.790001", "88.010002", "88.349998", "86.846573", "36599700"]]
end


def test_read_csv
  recs = read_csv( './MSFT.csv' )

  assert_equal 225, recs.size
  assert_equal msft_recs, recs[0..10]
end

def test_read_tab
  recs = read_tab( './MSFT.tab' )

  assert_equal 225, recs.size
  assert_equal msft_recs, recs[0..10]
end

def test_read_table
  recs = read_table( './MSFT.txt' )

  assert_equal 225, recs.size
  assert_equal msft_recs, recs[0..10]
end


def test_csv_std
  recs = CSV.read( './MSFT.csv' )

  assert_equal 225, recs.size
  assert_equal msft_recs, recs[0..10]
end


def test_reader_csv
  recs = CsvReader.read( './MSFT.csv' )

  assert_equal 225, recs.size
  assert_equal msft_recs, recs[0..10]
end

def test_reader_tab
  recs = CsvReader.tab.read( './MSFT.tab' )

  assert_equal 225, recs.size
  assert_equal msft_recs, recs[0..10]
end


=begin
def test_reader_table
  recs = CsvReader.table.read( './MSFT.txt' )

  assert_equal 225, recs.size
  assert_equal msft_recs, recs[0..10]
end
=end



end # class TabularTest

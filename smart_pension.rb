# frozen_string_literal: true

require './lib/parser'
require './lib/print'

parser_object = Parser.new
parser_object.read_file(ARGV.first)
parser_object.order_by_most_url_views
parser_object.order_by_uniq_views
parser_object.print_list_of_most_recent_views
parser_object.print_list_of_unique_views

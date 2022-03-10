# frozen_string_literal: true

require_relative './print'
require_relative './error_handler'
# Class for handling reading log file,parsing and ordering data.
class Parser
  def initialize
    @print = Print.new
    @views = {}
  end

  def read_file(filename)
    check_file_exist?(filename)
    File.open(filename, 'r') do |file_data|
      file_data.each_line do |line|
        url, ip = line.chomp.split(' ')
        @views.key?(url) ? @views[url].push(ip) : @views[url] = [ip]
      end
    end
    file_empty?
    @views
  end

  def order_by_most_url_views
    @most_url_views = []
    @most_url_views = @views.sort.reverse.sort_by { |visit| visit[1].length }.reverse
  end

  def order_by_uniq_views
    @uniq_url_views = []
    @uniq_url_views = @views.sort.reverse
    @uniq_url_views.map { |url_visits| url_visits[1] = url_visits[1].uniq }
    @uniq_url_views.sort_by! { |uniq_url_visits| uniq_url_visits[1].length }.reverse!
  end

  def print_list_of_most_recent_views
    @print.list_of_most_viewed(@most_url_views)
  end

  def print_list_of_unique_views
    @print.list_of_unique_views(@uniq_url_views)
  end

  private

  def check_file_exist?(filename)
    raise ErrorHandler::FileNotFoundError unless File.file?(filename)
  end

  def file_empty?
    raise ErrorHandler::FileEmptyError if @views.empty?
  end
end

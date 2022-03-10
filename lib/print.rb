# frozen_string_literal: true

# Class for handling displaying output on console
class Print
  def list_of_most_viewed(visit_list)
    puts 'list of webpages view with most number of visits(in Desc order):'
    visit_list.each do |visit|
      puts "#{visit[0]} #{visit[1].count} #{visit[1].count > 1 ? 'visits' : 'visit'}"
    end
  end

  def list_of_unique_views(unique_view_list)
    puts 'list of webpages with unique views:'
    unique_view_list.each do |view|
      puts "#{view[0]} #{view[1].count} unique #{view[1].count > 1 ? 'views' : 'view'}"
    end
  end
end

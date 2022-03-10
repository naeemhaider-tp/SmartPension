# frozen_string_literal: true

require 'print'

describe Print do
  url1 = '/help_page'
  url2 = '/home'
  ip1 = '126.318.035.038'
  ip2 = '184.123.665.067'

  describe '#print_most_visit_template' do
    it 'should print when there is one webpage visit' do
      visit_list = [[url1, [ip1]]]
      expect { subject.list_of_most_viewed(visit_list) }
        .to output("list of webpages view with most number of visits(in Desc order):
          \n/help_page 1 visit\n").to_stdout
    end

    it 'should print when there are multiple webpage visits' do
      visit_list = [[url2, [ip2, ip2]], [url1, [ip1]]]
      expect { subject.list_of_most_viewed(visit_list) }
        .to output("list of webpages view with most number of visits(in Desc order):
          \n/home 2 visits\n/help_page 1 visit\n").to_stdout
    end
  end
  describe '#print_in_unique_views_format' do
    it 'should print when webpage was viewed by one unique ip' do
      unique_view_list = [[url1, [ip2]]]
      expect { subject.list_of_unique_views(unique_view_list) }
        .to output("list of webpages with unique views:\n/help_page 1 unique view\n").to_stdout
    end

    it 'should print when multiple webpages were viewed' do
      unique_view_list = [[url1, [ip1, ip2]], [url2, [ip1]]]
      expect { subject.list_of_unique_views(unique_view_list) }
        .to output("list of webpages with unique views:\n/help_page 2 unique views\n" \
          "/home 1 unique view\n").to_stdout
    end
  end
end

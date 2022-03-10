# frozen_string_literal: true

require 'parser'
require './lib/error_handler'

RSpec.describe Parser do
  subject { described_class.new }
  url1 = '/help_page'
  url2 = '/home'
  url3 = '/index'
  ip1 = '126.318.035.038'
  ip2 = '444.701.448.104'
  ip3 = '543.910.244.929'
  ip4 = '722.247.931.582'

  before do
    allow(File).to receive(:file?).and_return(true)
  end
  describe '#read_file' do
    context 'When file is present and is  not empty' do
      it 'should store file data in hash' do
        file1 = 'visit_file1.log'
        content1 = "#{url1} #{ip1}"
        allow(File).to receive(:open).with(file1, 'r').and_yield(StringIO.new(content1))
        expect(subject.read_file(file1)).to eq(url1 => [ip1])
      end

      it 'should store second file data in hash' do
        file2 = 'visit_file1.log'
        content2 = "#{url2} #{ip3}"
        allow(File).to receive(:open).with(file2, 'r').and_yield(StringIO.new(content2))
        expect(subject.read_file(file2)).to eq(url2 => [ip3])
      end

      it 'should map ips when visited the same url' do
        file3 = 'visit_file3.log'
        content3 = "#{url1} #{ip1}\n#{url1} #{ip2}\n#{url1} #{ip3}"
        allow(File).to receive(:open).with(file3, 'r').and_yield(StringIO.new(content3))
        expect(subject.read_file(file3)).to eq(url1 => [ip1, ip2, ip3])
      end
    end
    context 'When file is not present' do
      it 'should raise an error when file doesnt exist.' do
        file4 = 'random_visit.log'
        allow(File).to receive(:file?).and_return(false)
        expect { subject.read_file(file4) }.to raise_error(ErrorHandler::FileNotFoundError)
      end
    end

    context 'when file is empty' do
      it 'should raise an error when file is empty' do
        file5 = 'empty.log'
        content5 = ''
        allow(File).to receive(:open).with(file5, 'r').and_yield(StringIO.new(content5))
        expect { subject.read_file(file5) }.to raise_error(ErrorHandler::FileEmptyError)
      end
    end
  end

  describe '#order_by_most_views' do
    it 'should sort the web pages with most number of visits' do
      file6 = 'visit_file6.log'
      content6 = "#{url1} #{ip1}\n#{url1} #{ip2}\n#{url2} #{ip2}"
      allow(File).to receive(:open).with(file6, 'r').and_yield(StringIO.new(content6))
      subject.read_file(file6)
      expect(subject.order_by_most_url_views).to eq [[url1, [ip1, ip2]], [url2, [ip2]]]
    end
  end

  describe '#order_by_uniq_views' do
    it 'should sort the page by number of unique ips ' do
      file7 = 'visit_file7.log'
      content7 = "#{url1} #{ip1}\n#{url1} #{ip2}\n#{url2} #{ip2}"
      allow(File).to receive(:open).with(file7, 'r').and_yield(StringIO.new(content7))
      subject.read_file(file7)
      expect(subject.order_by_uniq_views).to eq [[url1, [ip1, ip2]], [url2, [ip2]]]
    end

    it 'should sort the page by number of uniq ips when there are repeated ip data' do
      file8 = 'visit_file8.log'
      content8 = "#{url1} #{ip1}\n#{url1} #{ip1}\n#{url1} #{ip1}\n#{url3} #{ip3}\n#{url3} #{ip4}"
      allow(File).to receive(:open).with(file8, 'r').and_yield(StringIO.new(content8))
      subject.read_file(file8)
      expect(subject.order_by_uniq_views).to eq [[url3, [ip3, ip4]], [url1, [ip1]]]
    end
  end
end

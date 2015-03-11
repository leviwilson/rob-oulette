require "rob/oulette/version"

module Rob
  module Oulette
    def self.image(which=nil)
      title = which || titles[rand(0..titles.count - 1)]
      image = images[title]

      raise "#{which} is invalid in #{titles}" unless image

      Image.new title, bytes_for(image)
    end

    def self.titles
      images.keys
    end

    class << self
      def images
        {
          gazing: '01.jpg',
          shiek: '02.jpg',
          hogan: '03.jpg',
          zombie: '04.jpg',
          fat_field: '05.jpg',
          tyson: '06.jpg',
          belly: '07.jpg',
          unimpressed: '08.jpg',
          mug: '09.jpg',
          fish_sticks: '10.jpg',
          hawk: '11.jpg',
          blank: '12.jpg',
          side_stare: '13.jpg',
          the_zone: '14.jpg',
          king_crack: '15.jpg',
          milk_mustache: '16.jpg',
          bulging: '17.jpg'
        }
      end

      def bytes_for(image)
        File.binread(File.join(File.dirname(__FILE__), 'images', image))
      end
    end

    private_class_method :images, :bytes_for

    class Image
      attr_reader :title, :data

      def initialize(title, data)
        @title, @data = title, data
      end
    end
  end
end


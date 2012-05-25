module Kiwi
  class CompilerService
    OPTIONS = {
      style: :compressed
    }

    def self.compile(contents)
      css = nil

      begin
        css = Sass.compile contents, OPTIONS
      rescue Exception => ex
        Rails.logger.debug "CompilerService exception: #{ex}"
      end

      css
    end
  end
end

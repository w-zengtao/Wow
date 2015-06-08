module ApplicationHelper
  
  if defined? Encoding::Converter
    $ec1 = Encoding::Converter.new("GBK", "UTF-8", :universal_newline => true)
  else

  end

  class String
    def to_utf8
      return $ec1.convert self
    end
  end
end

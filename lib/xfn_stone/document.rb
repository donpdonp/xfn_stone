#require 'rexml/document'
#we're parsing HTML now
require 'hpricot'

module Hpricot
  class Elements
    def urls
      self.map do |fragment|
        fragment.attributes["href"]
      end
    end
  end
end

module XfnStone
  # This is an empty subclass of hpricot. Substuting a 
  # different XML parser in the future will be easier this way.
  # Also a useful spot for future helpers.
  class Document 
    def self.create_from_uri(uri)
      document = Document.new
      document.load_from_uri(uri)
      return document
    end

    def load_from_uri(uri)
      file = Document.open(uri.to_s)
      @document = Hpricot(file)
    end

    def elements(xpath)
      (@document/xpath)
    end

    # allow the open-uri call to be stubed
    def self.open(url)
      Kernel.open(url)
    end
  end

  class Element < Hpricot::Elem
  end

end

module XfnStone
  class Person
    attr_reader :uri, :document

    def initialize(url, load_now = true)
      @uri = URI.parse(url)
      refresh if load_now
    end

    def refresh
      @document = Document.create_from_uri(@uri)
    end

    def contacts
      @document.elements("//a[@rel~=\"contact\"]")
    end

    def friends
      @document.elements("//a[@rel~=\"friend\"]")
    end

    def mine
      @document.elements("//a[@rel~=\"me\"]")
    end
  end
end


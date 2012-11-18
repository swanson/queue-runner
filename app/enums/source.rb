class Source < ClassyEnum::Base
end

class Source::Hulu < Source
  def display_name
    "Hulu"
  end
end

class Source::Netflix < Source
  def display_name
    "Netflix"
  end
end

class Source::Itunes < Source
  def display_name
    "iTunes"
  end
end

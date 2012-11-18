module QueueHelper
  def render_streaming_links(links)
    output = ""
    no_links = true
    links.each do |source, url|
      next if url.nil?
      no_links = false
      output << render_streaming_link(source, url)
    end

    if no_links
      "None found :("
    else 
      raw output
    end
  end

  def render_streaming_link(source, url)
    "<a href='#{url}' class='pretty-link'>#{pretty_print_source(source)}</a>"
  end

  private
  def pretty_print_source(source)
    case source
    when :hulu
      "Hulu"
    when :netflix
      "Netflix"
    when :itunes
      "iTunes"
    end
  end
end

module TracksHelper
  def ugly_lyrics(lyrics)
    html = ""
    lyrics.lines.each do |line|
      html += "&#9835; #{h(line)}"
    end
    "<pre>#{html}</pre>".html_safe
  end
end
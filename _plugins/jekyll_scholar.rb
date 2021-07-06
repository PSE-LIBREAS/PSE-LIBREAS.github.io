# https://github.com/inukshuk/jekyll-scholar/issues/30#issuecomment-544306933

# Contributed by @mfenner as markdown_links.rb
# See https://github.com/inukshuk/jekyll-scholar/issues/30
# modified to generate html instead of markdown by @rawlins

require 'uri'

module Jekyll
  class Scholar
    class HtmlLinks < BibTeX::Filter
      URL_PATTERN = URI.regexp(['http', 'https', 'ftp'])
      def apply(value)
        value.to_s.gsub(URL_PATTERN) {
          "<a href=\"#{$&}\">#{$&}</a>"
        }
      end
    end
  end
end

# Convert DOIs to html. This *will not match all DOIs*. The regex comes from
# https://www.crossref.org/blog/dois-and-matching-regular-expressions/
# this may conflict with some CSLs that insert `https://doi.org/` or the like.

# DOI_FILTER = Regexp.new("^10\\.\\d{3,9}/\\S+$", Regex::IGNORECASE)
#           "<a href=\"https://doi.org/#{$&}\">#{$&}</a>"

module Jekyll
  class Scholar
    class DOILinks < BibTeX::Filter
      DOI_FILTER = Regexp.new("^10\\.\\d{4,9}/[-._;()/:A-Z0-9]+$", Regexp::IGNORECASE)
      def apply(value)
        value.to_s.gsub(DOI_FILTER) {
          "<a href=\"https://doi.org/#{$&}\">#{$&}</a>"
        }
      end
    end
  end
end

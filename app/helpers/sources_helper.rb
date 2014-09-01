module SourcesHelper
  def valid_url?(url)
    uri = URI.parse(url)
    %w( http https ).include?(uri.scheme)
  rescue URI::BadURIError
    false
  rescue URI::InvalidURIError
    false
  end

  def normalize_url(url)
    uri = URI.parse(url)
    if(!uri.scheme)
      url = 'http://' + url
    end
    url
  end
end

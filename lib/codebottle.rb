require "net/https"
require "json"
require "ostruct"

require "codebottle/version"

module Codebottle
  api_version = "v1"
  api_url = "https://codebottle.io/api/#{api_version}"

  @api_search_url = "#{api_url}/search.php"
  @api_get_snippet_url = "#{api_url}/get.php"
  @api_browse_url = "#{api_url}/browse.php"
  @api_verifysecure_url = "#{api_url}/verifysecure.php"
  @api_getprofile_url = "#{api_url}/getprofile.php"
  @api_getcodelanguages_url = "#{api_url}/getcodelanguages.php"
  @api_getcodetypes_url = "#{api_url}/getcodetypes.php"

  class CodebottleError < StandardError
  end

  def self.query(url, args)
    params = URI.encode_www_form(args)
    uri = URI.parse("#{url}?#{params}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(uri.request_uri)

    response = http.request(request)
    result = OpenStruct.new(JSON.parse(response.body))
    if result.error.length > 0
      raise CodebottleError, result.error
    end
    return result
  end

  def self.search(**kwargs)
    return query(@api_search_url, kwargs)
  end

  def self.get(**kwargs)
    return query(@api_get_snippet_url, kwargs)
  end

  def self.browse(**kwargs)
    return query(@api_browse_url, kwargs)
  end

  def self.verifysecure(**kwargs)
    return query(@api_verifysecure_url, kwargs)
  end

  def self.getprofile(**kwargs)
    return query(@api_getprofile_url, kwargs)
  end

  def self.getcodelanguages(**kwargs)
    return query(@api_getcodelanguages_url, kwargs)
  end

  def self.getcodetypes(**kwargs)
    return query(@api_getcodetypes_url, kwargs)
  end
end

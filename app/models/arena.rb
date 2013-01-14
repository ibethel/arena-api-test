require 'digest/md5'

class Arena

  include HTTParty
  base_uri 'https://arenatest.ibethel.org/api.svc'

  debug_output

  def self.get_with_signature(path, options={}, &block)
    options[:query] = query_to_signature(path, options[:query])
    get(path, options, &block)
  end

  def self.post_with_signature(path, options={}, &block)
    options[:query] = query_to_signature(path, options[:query])
    headers 'Content-Type' => "application/xml"
    post(path, options, &block)
  end

  def self.api_session
    @@api_session ||= create_api_session
  end

  def self.create_api_session
    response = post('/login', body: {'username' => 'chrisg', 'password' => 'changes3', 'api_key' => '45b5a3ef-209b-4e12-9157-89e3d1cdd4d9'})
    if response.code == 200
      response.parsed_response["ApiSession"]["SessionID"]
    else
      raise "Could not create api session: #{response.inspect}"
    end
  end

  def self.query_to_signature(path, query)
    # note:  order of query parameters is significant when creating the signature
    query ||= {}
    raise "query parameter must be a hash" unless query.is_a? Hash # only supporting passing a Hash right now
    query.merge!({'api_session' => api_session})

    path_and_params = "#{path[1..-1]}?#{HashConversions.to_params(query)}".downcase
    puts "*"*80
    puts path_and_params

    secret = "84f4861f-cc3b-445a-b4a0-dc83b59ad186"
    with_secret = "#{secret}_#{path_and_params}"
    puts with_secret

    signature = Digest::MD5.hexdigest(with_secret)
    puts signature

    #params = "api_session=#{api_session}&api_sig=#{signature}"
    #puts params
    #params
    #query = {'api_session' => api_session, 'api_sig' => signature}

    query.merge!({'api_sig' => signature})
    query
  end

  def all
    "not implemented"
  end
end
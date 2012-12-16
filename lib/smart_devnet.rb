require 'httparty'
require 'json'

class SmartDevnet

  URL = "https://npwifi.smart.com.ph/1/smsmessaging/outbound/%s/requests"

  attr :url
  attr :headers
  attr :access_code
  attr :path_to_cert

  def initialize(sp_id, sp_password, nonce, created_at, access_code, sp_service_id, path_to_cert)
    @access_code = access_code
    @url  = URL % access_code
    @path_to_cert = path_to_cert

    @headers = { 'Content-Type' => 'application/json',
      'Accept' => 'application/json',
      'Authorization' => 'WSSE realm="SDP",profile="UsernameToken"',
      'X-WSSE' => %{ UsernameToken Username="#{sp_id}",PasswordDigest="#{sp_password}",Nonce="#{nonce}", Created="#{created_at}"},
      'X-RequestHeader' => %{request TransId="", ServiceId="#{sp_service_id}"}}
  end

  def self.connect(options={})
    sp_id = options[:sp_id]
    sp_password = options[:sp_password]
    nonce = options[:nonce]
    created_at = options[:created_at]
    access_code = options[:access_code]
    sp_service_id = options[:sp_service_id]
    path_to_cert = options[:path_to_cert]
    @current = new(sp_id, sp_password, nonce, created_at, access_code, sp_service_id, path_to_cert)
  end

  def self.current
    @current || raise(RuntimeError, 'No connections to SMART Devnet API.')
  end

  def send_sms(mobile_number, message)
    request = { "outboundSMSMessageRequest" => {
             "address" => ["tel:#{mobile_number}"],
             "senderAddress" => "#{access_code}",
             "outboundSMSTextMessage" => {"message" => "#{message}" }}}.to_json
    response = post(request)
    message_sent?(response) || raise(RuntimeError, response)
    response
  end

  def message_sent?(response)
    response.code == 201
  end

  private

  def post(request)
    HTTParty.post(url, headers: headers, body: request, ssl_ca_file: path_to_cert)
  end

end

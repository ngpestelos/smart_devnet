require_relative 'test_helper'

class SmartDevnetTest < MiniTest::Unit::TestCase

  def test_headers
    smart = SmartDevnet.connect(sp_id: '00991', sp_password: '/sfdfdVz0DGJkJJpJ1ebpy', nonce:'201ddfdf1', created_at: '2010-08-21T08:33:46Z', access_code: '36804', sp_service_id: '00121fdfd57')
    expected_headers = "-H 'Content-Type: application/json' -H 'Accept: application/xml' -H 'Authorization: WSSE realm=\"SDP\",profile=\"UsernameToken\"' -H 'X-WSSE: UsernameToken Username=\"00991\",PasswordDigest=\"/sfdfdVz0DGJkJJpJ1ebpy\",Nonce=\"201ddfdf1\", Created=\"2010-08-21T08:33:46Z\"' -H 'X-RequestHeader: request TransId=\"\", ServiceId=\"00121fdfd57\"'"
    assert_equal smart.headers, expected_headers
  end


end

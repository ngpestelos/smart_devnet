require_relative 'test_helper'
require_relative '../lib/smart_devnet'

describe SmartDevnet  do
  let(:access_code) { '36804' }
  let(:path_to_cert) { '/path/to/file.crt' }
  let(:current) { SmartDevnet.connect(sp_id: '00991', sp_password: '/sfdfdVz0DGJkJJpJ1ebpy', nonce:'201ddfdf1', created_at: '2010-08-21T08:33:46Z', access_code: access_code, sp_service_id: '00121fdfd57', path_to_cert: path_to_cert)  }
  let(:expected_headers) { "-H 'Content-Type: application/json' -H 'Accept: application/json' -H 'Authorization: WSSE realm=\"SDP\",profile=\"UsernameToken\"' -H 'X-WSSE: UsernameToken Username=\"00991\",PasswordDigest=\"/sfdfdVz0DGJkJJpJ1ebpy\",Nonce=\"201ddfdf1\", Created=\"2010-08-21T08:33:46Z\"' -H 'X-RequestHeader: request TransId=\"\", ServiceId=\"00121fdfd57\"'" }

  describe "#headers" do
    it "generates correct headers" do
      assert_equal expected_headers, current.headers
    end
  end

  describe "#access_code" do
    it "returns the access code" do
      assert_equal access_code, current.access_code
    end
  end

  describe "#path_to_cert" do
    it "returns the access code" do
      assert_equal path_to_cert, current.path_to_cert
    end
  end

  describe "#send_sms" do
    it "should raise an error when the response is not 201 Created" do
      assert_raises(RuntimeError) { current.send_sms("0923232323", "This should fail.") }
    end
  end
end

# Smart Developer Network API [![Build Status](https://secure.travis-ci.org/bridgeutopia/smart_devnet.png)](http://travis-ci.org/bridgeutopia/smart_devnet)

Ruby wrapper for REST API of SMART Developer Network.

## Installation

Add this line to your application's Gemfile:

    gem 'smart_devnet'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install smart_devnet

## Usage

    SmartDevnet.connect(sp_id: '  ', sp_password: '  ', nonce:'  ', created_at: '  ', access_code: '  ', sp_service_id: '  ', path_to_cert: ' ')
    SmartDevnet.current.send_sms('mobile_number', "Testing API.")

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## MIT Open Source License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Acknowledgements

This was created by <a href="http://blog.bridgeutopiaweb.com" target="_blank">Katherine G. Pe</a>.

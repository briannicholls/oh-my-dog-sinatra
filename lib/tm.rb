=begin
require 'net/http'
class Tm

  def self.send_text(phone)
    username = ENV['TEXTMAGIC_USERNAME']
    token = ENV['TEXTMAGIC_KEY']
    base_uri = 'https://rest.textmagic.com/api/v2'
    uri = URI "http://rest.textmagic.com/api/v2/verify"
    binding.pry

    client = Textmagic::REST::Client.new(username, token)
    binding.pry
    auth = {
      username: ENV['TEXTMAGIC_USERNAME'],
      password: ENV['TEXTMAGIC_KEY']
    }
    binding.pry
    params = {
      phone: "#{phone}",
      brand: 'Oh My Dog',
      codeLength: 6,
      basic_auth: auth
      }
      response = Net::HTTP.post_form(uri, 'query' => params, 'max' => '500')
      binding.pry
    #response = HTTParty.post('/verify', query: params)
    #message = client.messages.create(params)
    binding.pry
    response['verifyId']
  end

  def self.confirm(pin)
    response = HTTParty.put('https://rest.textmagic.com/api/v2/verify', body: pin)
    response.code == 204 ? true : false
  end

end
=end

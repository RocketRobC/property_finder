require 'net/http'
require 'base64'

class MapService
  DEFAULT_COUNTRY = 'australia'
  API = ENV['HERE_API']
  ID = ENV['HERE_ID']
  CODE = ENV['HERE_CODE']

  def initialize(data)
    @number = data.fetch(:number)
    @street = data.fetch(:street)
    @suburb = data.fetch(:suburb)
    @postcode = data.fetch(:postcode)
  end

  def request_image
    uri = URI(API)
    uri.query = URI.encode_www_form(params)
    response = Net::HTTP.get_response(uri)
    raise "Image service error: #{response.code}" unless response.is_a?(Net::HTTPSuccess)
    render_and_upload_image(response.body)
  end

  def render_and_upload_image(data)
    File.open(file_path, 'wb') do |f| 
      f.write(data)
    end
    S3Service.new.upload(file_path)
  end

  def file_path
    File.join(Hanami.root, 'tmp', "#{@number}_#{@street.downcase.split(' ').join('_')}.jpg")
  end

  def params
    {
      app_id: ID,
      app_code: CODE,
      co: DEFAULT_COUNTRY,
      ci: @suburb,
      zi: @postcode,
      s: @street,
      n: @number,
      z: 15,
      h: 640,
      w: 640,
      f: 1,
      ppi: 72
    }
  end
end

class S3Service
  REGION = ENV['AWS_REGION']
  BUCKET = 'propifind'

  def object_for_key(key)
    bucket.objects.select { |o| o.key.include?(key) }.first
  end

  def presigned_url_for(key)
    object_for_key(key).presigned_url(:get)
  end

  def upload(file)
    name = File.basename(file)
    obj = bucket.object(name)
    obj.upload_file(file)
  end

  def object_exists?(key)
    !object_for_key(key).nil?
  end

  private

  def resource
    @resource ||= Aws::S3::Resource.new(region: REGION)
  end

  def bucket
    resource.bucket(BUCKET)
  end
end

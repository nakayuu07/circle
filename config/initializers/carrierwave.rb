CarrierWave.configure do |config|
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["S3_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["S3_SECRET_KEY_ID"],
      region:                'ap-northeast-1',
      path_style:            true,
  }


  config.fog_public     = false
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}

  case Rails.env
    when 'production'
      config.fog_directory = 'circle.production'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/circle.production'
    when 'development'
      config.fog_directory = 'circle.development'
      config.asset_host = 'https://s3.console.aws.amazon.com/circle.development'
  end
end

Refile.secret_key = 'fc54d86247266a6cc4f48a286df54608ef7a26d035a7b464a85b21afef9053dfa8cb024173761e7aac49feaa45b6ea371bd8ce225e3901e4f2b867ae85aa49e0'
require "refile/s3"
aws = {
  access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
  region: 'ap-northeast-1',
  bucket: 'instant-kilogram-production',
}
Refile.cache = Refile::S3.new(prefix: 'cache', **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)

# CarrierWave.configure do |config|
#   require 'carrierwave/storage/abstract'
#   require 'carrierwave/storage/file'
#   require 'carrierwave/storage/fog'

#   config.storage :fog
#   config.fog_provider = 'fog/aws'
#   config.fog_credentials = {
#       provider:              'AWS',
#       aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],
#       aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
#       region:                'ap-northeast-1',
#       path_style:            true,
#   }

#   config.fog_public     = true
#   config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}

#   case Rails.env
#     when 'production'
#       config.fog_directory = 'instant-kilogram-production'
#       config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/instant-kilogram-production'
#     when 'development'
#       config.fog_directory = 'instant-kilogram-development'
#       config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/instant-kilogram-development'
#   end
# end
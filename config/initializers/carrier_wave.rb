CarrierWave.configure do |config|

  # Use local storage if in development or test
  if Rails.env.development? || Rails.env.test?
    CarrierWave.configure do |config|
    	config.storage = :aws
    	config.aws_bucket  = 'mac-vault/test' 
    end
  end

  # Use AWS storage if in production
  if Rails.env.production?
    CarrierWave.configure do |config|
    	config.storage = :aws
    	config.aws_bucket  = 'mac-vault/prod' 
    end
  end
  config.aws_credentials = {
    :access_key_id      => 'AKIAJFUCB7O432TBLUIA',            # required
    :secret_access_key  => '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',     # required
    :region                 => 'us-east-1'                        # optional, defaults to 'us-east-1'
  }
  config.aws_acl    = 'public-read'
  #config.fog_host       = 'https://assets.example.com'           # optional, defaults to nil
  #config.fog_public     = false  
  # config.aws_signer = -> (unsigned_url, options) { Aws::CF::Signer.sign_url unsigned_url, options }                                # optional, defaults to true
  config.fog_attributes = {}  # optional, defaults to {}
end

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAIF3NQVKURBR2R2FQ',
    :aws_secret_access_key  => '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',
    :region                 => 'us-east-1'
  }
  config.fog_directory  = 'photojournal'                    # required
  config.fog_public     = true                                 # optional, defaults to true
end
if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider => 'AWS',
      :aws_access_key_id => ENV["AKIAJATK23A3TODW7T6Q"],
      :aws_secret_access_key => ENV["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"]
    }
    
    config.fog_directory = ENV['myrecipejashan']
    
  end
  
end
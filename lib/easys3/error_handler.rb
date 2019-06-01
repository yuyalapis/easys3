require "dotenv"
Dotenv.overload()

module ErrorHandler
  def self.check_aws_region()
    if !ENV["AWS_S3_REGION"] || ENV["AWS_S3_REGION"] == ""
      raise "AWS_S3_REGION=... is missing in your .env file. Select your region from https://docs.aws.amazon.com/general/latest/gr/rande.html"
    end
  end

  def self.check_aws_access_key()
    if !ENV["AWS_ACCESS_KEY_ID"] || ENV["AWS_ACCESS_KEY_ID"] == ""
      raise "AWS_ACCESS_KEY_ID=... is missing in your .env file"
    end
  end

  def self.check_aws_secret_access_key()
    if !ENV["AWS_SECRET_ACCESS_KEY"] || ENV["AWS_SECRET_ACCESS_KEY"] == ""
      raise "AWS_SECRET_ACCESS_KEY=... is missing in your .env file"
    end
  end

  def self.check_aws_bucket_name()
    if !ENV["AWS_S3_REGION"] || ENV["AWS_S3_REGION"] == ""
      raise "AWS_S3_REGION=.. is missing in your .env file"
    end
  end
end
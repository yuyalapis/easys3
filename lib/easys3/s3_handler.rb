require "dotenv"
Dotenv.overload()
require "aws-sdk-s3"

module S3Handler
  def self.get_s3_resorce(ignore_keys=false)
    ErrorHandler.check_aws_region()

    if ignore_keys
      return Aws::S3::Resource.new(
          region: ENV["AWS_S3_REGION"],
        )
    end

    ErrorHandler.check_aws_access_key()
    ErrorHandler.check_aws_secret_access_key()

    return Aws::S3::Resource.new(
        region: ENV["AWS_S3_REGION"],
        access_key_id: ENV["AWS_ACCESS_KEY_ID"],
        secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
      )
  end


  def self.get_bucket(bucket_name, ignore_keys=false)
    ErrorHandler.check_aws_region()
    s3 = S3Handler.get_s3_resorce(ignore_keys)
    return s3.bucket(bucket_name)
  end

  def self.file_exists?(bucket, file_name)
    return bucket.object(file_name).exists?
  end
end

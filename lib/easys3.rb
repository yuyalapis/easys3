require "easys3/version"
require "easys3/error_handler"
require "easys3/response"
require "easys3/s3_handler"


module Easys3
  class Error < StandardError; end

  def self.get(bucket_name, file_name)
    begin
      Easys3.get_without_rescue(bucket_name, file_name, ignore_keys=true)
    rescue
      begin
        Easys3.get_without_rescue(bucket_name, file_name, ignore_keys=false)
      rescue Exception => e
        return Response.error(e)
      end
    end
  end


  def self.get_without_rescue(bucket_name, file_name, ignore_keys=false)
    bucket = S3Handler.get_bucket(bucket_name, ignore_keys=ignore_keys)

    if !S3Handler.file_exists?(bucket, file_name)
      return Response.missing("Could not find file: " + file_name + " in the bucket: " + bucket.name)
    end

    data = bucket.object(file_name).get.body.read()
    return Response.success(data)
  end


  def self.put(bucket_name, file_name, file, acl=nil)

    # bucket.object(file_name).put(body: file, acl: 'public-read')

    begin
      return Easys3.put_without_rescue(bucket_name, file_name, file, ignore_keys=true)
    rescue
      begin
        return Easys3.put_without_rescue(bucket_name, file_name, file, ignore_keys=false)
      rescue Exception => e
        return Response.error(e)
      end
    end
  end


  def self.put_without_rescue(bucket_name, file_name, file, acl=nil, ignore_keys=false)
    bucket = S3Handler.get_bucket(bucket_name, ignore_keys=ignore_keys)

    if acl
      response = bucket.object(file_name).put(body: file, acl: acl)
    else
      response = bucket.object(file_name).put(body: file)
    end

    return Response.success(response, status=201)
  end

end

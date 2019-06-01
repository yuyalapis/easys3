# Easys3

Putting files to S3 & getting files from S3 should be one liner. In reality, you might be confused with tricky behavior of official `aws-sdk` gem. With `easys3`, `Easys3.put(bucket_name, file_name, file, acl)` means putting files to s3 and `Easys3.get(bucket_name, file_name)` means getting a file from s3.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'easys3'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install easys3

## Usage

### [Prerequisite] create your `.env` file
```
AWS_ACCESS_KEY_ID=...
AWS_SECRET_ACCESS_KEY=...
AWS_S3_REGION=...
```

##### FYI: Known AWS regions include:

```
ap-east-1
ap-northeast-1
ap-northeast-2
ap-south-1
ap-southeast-1
ap-southeast-2
ca-central-1
eu-central-1
eu-north-1
eu-west-1
eu-west-2
eu-west-3
sa-east-1
us-east-1
us-east-2
us-west-1
us-west-2
cn-north-1
cn-northwest-1
us-gov-east-1
us-gov-west-1
```


### Putting a file to s3
```ruby
Easys3.put(bucket_name, file_name, file, acl) # acl is optional
```

#### example
```ruby
Easys3.put("test-bucket", "test/abc.log", "abbc") # acl is optional
```

#### example response (success)
```ruby
{:status=>201, :data=>#<struct Aws::S3::Types::PutObjectOutput ... }
```

#### example response (failure)
```ruby
{:status=>500, :message=>#<Aws::Errors::NoSuchEndpointError: ... }
```

### Getting a file from s3
```ruby
Easys3.get(bucket_name, file_name)
```

#### example
```ruby
Easys3.put("test-bucket", "test/abc.log") # acl is optional
```

#### example response (success)
```ruby
{:status=>200, :data=>"abc"}
```

#### example response (failure - 404)
```ruby
{:status=>404, :message=>"Could not find file: test/missing.log in the bucket: test-bucket"}
```

#### example response (failure - 500)
```ruby
{:status=>500, :message=>#<Aws::Errors::NoSuchEndpointError: ... }
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/chienomi/easys3. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Easys3 project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/easys3/blob/master/CODE_OF_CONDUCT.md).

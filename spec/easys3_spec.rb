

RSpec.describe Easys3 do
  it "has a version number" do
    expect(Easys3::VERSION).not_to be nil
  end

  it "can load dotenv" do
    expect(Dotenv).not_to be nil
  end

  it "can load aws-sdk" do
    expect(Aws::S3).not_to be nil
  end


  it "can put test data" do

    test_bucket_name = "test-bucket-tokyo-1"
    test_file_name = "t/abc.log"
    test_data = "abc"

    response = Easys3.put(test_bucket_name, test_file_name, test_data)
    p response
    expect(response[:status]).to be 201
  end

  it "can get test data" do

    test_bucket_name = "test-bucket-tokyo-1"
    test_file_name = "t/abc.log"

    response = Easys3.get(test_bucket_name, test_file_name)
    p response
    expect(response[:status]).to be 200
  end

  it "will fail when the found does not found" do
    test_bucket_name = "test-bucket-tokyo-1"
    test_file_name = "t/abc.missing"

    response = Easys3.get(test_bucket_name, test_file_name)
    p response
    expect(response[:status]).to be 404
  end

end

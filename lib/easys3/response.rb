module Response
  def self.success(data, status=200)
    return {
      "status": status,
      "data": data
    }
  end

  def self.missing(message)
    return {
      "status": 404,
      "message": message
    }
  end

  def self.error(message)
    return {
      "status": 500,
      "message": message
    }
  end

end
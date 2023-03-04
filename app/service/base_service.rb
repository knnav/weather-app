class BaseService
  def self.call(*args)
    self.new(*args).execute
  end
end
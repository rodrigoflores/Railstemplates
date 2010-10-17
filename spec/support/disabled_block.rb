module DisabledBlock
  
  def disabled(message, &block)
    pending message
  end
end

RSpec.configuration.include DisabledBlock
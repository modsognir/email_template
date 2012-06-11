class NullObject
  def method_missing(*args, &block)
    self
  end

  def to_s(args=nil)
    if args
      "{{VARIABLE: #{Date.new(2011,11,11).to_s(args)}}}"
    else
      "{{VARIABLE}}"
    end
  end
end
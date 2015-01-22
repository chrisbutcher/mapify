module Enumerable
  def mapify(*args)
    fail_fast?(args)

    map do |object|
      args.map do |arg|
        object.public_send(arg)
      end
    end
  end

  def hashify(*args)
    fail_fast?(args)

    map do |object|
      args.reduce({}) do |hash, arg|
        hash[arg] = object.public_send(arg)
        hash
      end
    end
  end

  private
  def all_symbol_args?(args)
    args.find{|x| x.class != Symbol}.nil?
  end

  def fail_fast?(args)
    raise ArgumentError, 'All arguments must be symbols' unless all_symbol_args?(args) && !args.empty?
  end
end

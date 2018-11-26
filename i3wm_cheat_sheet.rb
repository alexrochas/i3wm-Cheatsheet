
File.new('config')
  .select{ |line| line.include? 'bind' and not line.start_with? '#' }
  .map{ |line| 
    /bind(?:code|sym)\s(?<bind>\S*)\s(?<action>[^#]*)(?<commentary>#.*)?$/ =~ line
    action.delete! "\n" if action
    action.strip! if action
    {
      bind: bind,
      action: action,
      commentary: commentary
    }
  }
  .reject { |line| line[:bind].nil? }
  .reject { |line| line.empty? }
  .each { |line| 
    printf("%-30s %-30s %s\n", line[:bind],line[:action],line[:commentary])
  }

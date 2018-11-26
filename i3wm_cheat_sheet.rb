
File.new('config').read.scan(/(?<commentary>#.*\n)?^bind(?:code|sym)\s(?<bind>\S*)\s(?<action>.*)$/)
  .map { |m| 
    commentary, bind, action = m
    action.delete! "\n" if action
    action.strip! if action
    commentary.delete! "\n" if commentary
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

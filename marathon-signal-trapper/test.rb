
Signal.trap('TERM') do
  puts 'terminating...'
  STDOUT.flush
  sleep 30
  puts 'no really, terminating...'
  STDOUT.flush
  sleep 30
  puts 'actually, terminating'
  STDOUT.flush
  exit 0
end

loop do
  puts 'hello, world!'
  sleep 15
end

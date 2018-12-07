require 'rake'

task :switch_to_zsh do
  switch_shell
end

def switch_shell
  if ENV['SHELL'] =~ /zsh/
    puts 'already using zsh'
  else
    print 'swtich to zsh? [ynq] '
    ans = $stdin.gets.chomp
    switch_to_zsh(ans)
  end
end

def switch_to_zsh(ans = 'n')
  case ans
  when 'y'
    puts 'switching to zsh'
    system 'chsh -s `which zsh`'
  when 'q'
    exit
  else
    puts 'not switching to zsh'
  end
end
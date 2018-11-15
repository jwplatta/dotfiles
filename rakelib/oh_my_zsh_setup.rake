require 'rake'

task :oh_my_zsh_setup do
  setup_oh_my_zsh
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

def setup_oh_my_zsh
  if File.exist?(oh_my_zsh_home)
    puts '~/.oh-my-zhs already exists. Not installing.'
  else
    print 'install oh-my-zsh? [ynq] '
    ans = $stdin.gets.chomp
    install_oh_my_zsh ans
  end
end

def oh_my_zsh_home
  @oh_my_zsh_home ||= File.join(ENV['HOME'], '.oh-my-zsh')
end

def install_oh_my_zsh(arg = 'n')
  case arg
  when 'y'
    puts 'beginning install of oh-my-zsh'
    clone_oh_my_zsh
  when 'q'
    exit
  else
    puts 'skipping install of oh-my-zsh'
  end
end

def clone_oh_my_zsh
  system 'git clone ' \
           'https://github.com/robbyrussell/oh-my-zsh.git ' \
           '"$HOME/.oh-my-zsh"'
end

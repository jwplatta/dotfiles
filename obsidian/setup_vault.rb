require 'fileutils'

puts "What's the name of the vault?\n"
vault_name = gets.strip

HOME_PATH = Dir.home.freeze
DOTFILES_PATH = "#{HOME_PATH}/dotfiles".freeze
OBSIDIAN_PATH = "#{HOME_PATH}/obsidian_vaults".freeze

puts "Vault on iCloud? [y/n]\n"
response = gets.strip

VAULT_PATH = if response == 'y'
  "#{HOME_PATH}/Library/Mobile Documents/iCloud~md~obsidian/Documents/#{vault_name}"
else
  "#{OBSIDIAN_PATH}/#{vault_name}/.obsidian"
end

puts VAULT_PATH.inspect

raise StandardError.new("Cannot find dotfiles at #{DOTFILES_PATH}") unless File.exist? DOTFILES_PATH
raise StandardError.new("Cannot find obsidian vault at #{VAULT_PATH}") unless File.exist? VAULT_PATH

Dir["#{DOTFILES_PATH}/obsidian/*.json"].each do |filename|
  FileUtils.cp(filename, VAULT_PATH)
end

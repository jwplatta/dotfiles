#!/usr/bin/env ruby
# frozen_string_literal: true

require 'fileutils'
require 'pry'

puts "Copying dotfiles to #{Dir.home}"

DOTFILES_PATH = "#{Dir.home}/dotfiles"

DOTFILES = [
  "#{DOTFILES_PATH}/.tmux.conf",
  "#{DOTFILES_PATH}/.tool-versions",
  "#{DOTFILES_PATH}/.agignore",
  "#{DOTFILES_PATH}/.aliases",
  "#{DOTFILES_PATH}/.condarc",
  "#{DOTFILES_PATH}/.iex.exs",
  "#{DOTFILES_PATH}/.tmux.conf",
  "#{DOTFILES_PATH}/.tool-versions",
  "#{DOTFILES_PATH}/.vimrc",
  "#{DOTFILES_PATH}/.vscode",
  "#{DOTFILES_PATH}/.zshrc",
  "#{DOTFILES_PATH}/.zshrc.local"
].freeze

raise StandardError.new("#{DOTFILES_PATH} does not exist.") unless File.exist? DOTFILES_PATH

source_files = Dir["#{DOTFILES_PATH}/.*"]

source_files.select { |f| DOTFILES.include? f }.each do |df_file|
  system("cp -r #{df_file} #{Dir.home}")
end

puts 'Restart your terminal'

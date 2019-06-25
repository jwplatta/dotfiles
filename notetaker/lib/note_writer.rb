#!/usr/bin/env ruby

require 'yaml'
require 'erb'

puts "running note writer"

# @foods = YAML.load_file(File.join(__dir__, 'foods.yaml'))
template_source = File.read("#{ENV['HOME']}/dotfiles/notetaker/lib/templates/code_snippet.erb")

@date = '2019-01-01'
@title = 'First Note'
@notes = ['Add your notes here.']
@code_type = 'ruby'

contents = File.read(ARGV[0])
@code = contents

template = ERB.new(template_source)

File.open('code_note_one.md', 'w') do |f|
  f.write template.result(binding)
end

# Open file to add note
return

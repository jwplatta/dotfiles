require "rake"
require "yaml"

task :link_all_dotfiles do
  puts "implement link_all_dotfiles"
end

task :link_dotfile, [:filename] do |_task, args|
  puts "linking single dotfile: #{args[:filename]}"
end

def full_path(filename); end

def get_dotfile(filename); end

def copy_file(filename)
  file_to_copy = get_dotfile(file)
  system %Q{cp }
end

# def replace_file(file)
#   system %Q{rm -rf "$HOME/.#{file.sub(/\.erb$/, '')}"}
#   link_file(file)
# end

# def link_file(file)
#   if file =~ /.erb$/
#     puts "generating ~/.#{file.sub(/\.erb$/, '')}"
#     File.open(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"), 'w') do |new_file|
#       new_file.write ERB.new(File.read(file)).result(binding)
#     end
#   elsif file =~ /zshrc$/ # copy zshrc instead of link
#     puts "copying ~/.#{file}"
#     system %Q{cp "$PWD/#{file}" "$HOME/.#{file}"}
#   else
#     puts "linking ~/.#{file}"
#     system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
#   end
# end

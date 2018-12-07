require 'rake'
require 'yaml'

task :link_all_dotfiles do
  
end

task :link_dotfile, [:filename] do |t, args|
  puts "linking single dotfile: #{args[:filename]}"
end

def full_path(filename)

end

def get_dotfile(filename)
end

def copy_file(filename)
  file_to_copy = get_dotfile(file)
  system %Q{cp }
end
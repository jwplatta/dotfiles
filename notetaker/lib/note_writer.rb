module Notetaker
  class NoteWriter
    require 'yaml'
    require 'erb'

    DEFAULT_NOTES = ['Your notes go here.', '...'].freeze
    CODE_TO_EXT = { '.rb' => 'ruby',
                    '.ex' => 'elixir',
                    '.exs' => 'elixir',
                    '.sql' => 'sql',
                    '.sh' => 'bash' }.freeze

    def initialize(**args)
      @filename = args.fetch(:filename)
    end

    def write
      @date_text = date
      @title_text = title
      @notes = DEFAULT_NOTES
      @code_type = code_type
      @code = code_snippet

      File.open(path_to_note, 'w') do |f|
        f.write template.result(binding)
      end

      open_note
    end

    def open_note
      system('vim', path_to_note)
    end

    def notes
      @notes ||= ['Your notes go here.', '...']
    end

    def path_to_note
      "#{todays_note_folder}/#{title}.md"
    end

    def todays_note_folder
      setup.make_folder_for_today unless folder_exists?
      path_to_folder
    end

    def folder_exists?
      File.directory?(path_to_folder)
    end

    def path_to_folder
      @path_to_folder ||= "#{setup.notes_folder_path}/#{date}"
    end

    private

    attr_reader :filename

    def date
      @date ||= DateTime.now.strftime('%m-%d-%Y')
    end

    def title

      @title ||= user_input
    end

    def user_input
      puts "Enter note title:\n\n"
      new_title = STDIN.gets.chomp.downcase.tr(' ', '_')

      if File.exist?("#{path_to_folder}/#{new_title}.md")
        user_input
      else
        new_title
      end
    end

    def code_snippet
      File.read(filename)
    end

    def code_type
      CODE_TO_EXT[file_extension]
    end

    def file_extension
      File.extname(filename)
    end

    def template
      @template ||= ERB.new(template_source)
    end

    def template_source
      File.read('../templates/code_snippet.erb')
    end

    def setup
      @setup ||= Setup.new
    end
  end
end

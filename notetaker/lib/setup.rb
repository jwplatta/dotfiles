module Notetaker
  class Setup
    require 'yaml'
    require 'fileutils'

    class NotesFolderNotSet < StandardError; end
    class NotesFolderDoesNotExist < StandardError; end
    class ConfigDoesNotExist < StandardError; end
    class SetupNotRun < StandardError; end

    def self.check
      new.check
    end

    def check
      config_exists?
      notes_folder_set?
      setup if needs_setup?
      notes_folder_exists?
    end

    def needs_setup?
      config['needs_setup']
    end

    def setup
      FileUtils.mkdir_p(notes_folder_path)
      config['needs_setup'] = false
      File.open(config_path, 'w') { |f| YAML.dump(config, f) }
    end

    def make_folder_for_today
      FileUtils.mkdir_p("#{notes_folder_path}/#{DateTime.now.strftime('%m-%d-%Y')}")
    end

    def config_exists?
      raise ConfigDoesNotExist unless config
    end

    def config
      @config ||= YAML.load_file(config_path)
    end

    def notes_folder_set?
      raise NotesFolderNotSet unless notes_folder
    end

    def notes_folder
      @notes_folder ||= config['defaults']['notes_folder']
    end

    def notes_folder_exists?
      raise NotesFolderDoesNotExist unless File.directory?(notes_folder_path)
    end

    def notes_folder_path
      "#{ENV['HOME']}/#{notes_folder}"
    end

    def config_path
      "#{ENV['HOME']}/dotfiles/notetaker/config.yml"
    end
  end
end

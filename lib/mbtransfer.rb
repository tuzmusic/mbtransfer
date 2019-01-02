require "mbtransfer/version"

module Mbtransfer
  class Paths
    def self.base_path
      { 2016 => "/Users/TuzsNewMacBook" ,
         2017 => "/Users/TuzMacbookPro2017" }
    end
  
    def self.icloud_path
      "/Library/Mobile Documents/com~apple~CloudDocs/Development/switching-between-computers"
    end
  
    def self.vscode_path
      "/Library/Application\ Support/Code/User"
    end

    def self.vscode_files
      ["keybindings.json", "settings.json", "snippets"]
    end
  end
  
  class Transfer
    require 'fileutils'
    attr_accessor :year, :source_path, :dest_path
  
    def initialize(year)
      @year = year
    end

    def transfer_path
      Paths.base_path[@year] + Paths.icloud_path+"/transfer"
    end
  
    def set_up_folders
      FileUtils.mkdir_p transfer_path
    end
  
    def copy_vscode_files
      vsc_path = Paths.base_path[@year] + Paths.vscode_path
      Paths.vscode_files.each do |file|
        path = vsc_path + "/#{file}"
        FileUtils.cp(path, transfer_path)
      end
    end
  
    def import
      set_up_folders
      copy_vscode_files
      copy_bash_files
    end
  
    def export
      get_vscode_files
      get_bash_files
    end
  
  end

end

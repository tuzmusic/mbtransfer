require "mbtransfer/version"

module Mbtransfer
  class Paths
    def self.base_path
      {"2016": "/Users/TuzsNewMacBook",
        "2017": "/Users/TuzMacbookPro2017"}
    end

    def self.icloud_path
      "/Library/Mobile Documents/com~apple~CloudDocs/Development/switching-between-computers"
    end

    def self.vscode_path
      "/Application\ Support/Code/User"
    end
  end

  class Transfer
    require 'fileutils'

    def initialize(year)
      @year = year
    end

    def set_up_folders
      FileUtils.mkdir_p Path.base_path+Path.icloud_path+"source"  
      FileUtils.mkdir_p Path.base_path+Path.icloud_path+"dest"  
    end

    def copy_vscode_files
      path = Path.base_path[:year]+Path.vscode_path

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

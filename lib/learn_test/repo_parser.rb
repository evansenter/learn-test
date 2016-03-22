require 'git'

module LearnTest
  class RepoParser
    def self.root
      recurse_to_repo_root(Pathname.getwd) || (throw RuntimeError.new)
    end

    def self.path_to(file)
      File.join(root, file)
    end

    def self.get_repo
      begin
        repo = Git.open(root)
      rescue
        puts "You don't appear to be in a Learn lesson's directory. Please cd to an appropriate directory and try again."
        die
      end

      if url = repo.remote.url
        url.match(/(?:https:\/\/|git@).*\/(.+?)(?:\.git)?$/)[1]
      else
        puts "You don't appear to be in a Learn lesson's directory. Please cd to an appropriate directory and try again."
        die
      end
    end

    def self.die
      exit
    end

    private

    def self.recurse_to_repo_root(path)
      if path.root?
        false
      else
        path.children(false).find { |file| file.basename.to_s == ".git" } && path.expand_path.to_s || recurse_to_repo_root(path.parent)
      end
    end
  end
end


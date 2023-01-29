repo_rc = File.expand_path('./.irbrc')
load(repo_rc) if repo_rc != __FILE__ && File.exist?(repo_rc)

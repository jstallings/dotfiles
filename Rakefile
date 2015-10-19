require 'rake'

desc "install the dot files into user's home directory"
task :install do
  Dir['*'].each do |file|
    next if %w[Rakefile README.rdoc LICENSE].include? file

    if File.exist?(File.join(ENV['HOME'], ".#{file}"))
      replace_file(file)
    else
      link_file(file)
    end
  end

  # Need to do this to make vim use RVM's ruby version
#  puts "Moving zshenv to zshrc"
#  system %Q{sudo mv /etc/zshenv /etc/zshrc}
end

def replace_file(file)
  system %Q{rm "$HOME/.#{file}"}
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end

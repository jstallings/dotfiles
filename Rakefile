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
end

def replace_file(file)
  system %Q{rm "$HOME/.#{file}"}
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end

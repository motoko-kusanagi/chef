directory '/home/vagrant/.local/share/fonts/' do

  user 'vagrant'
  group 'vagrant'
end

directory '/home/vagrant/.vim' do

  user 'vagrant'
  group 'vagrant'
end

directory '/home/vagrant/.vim/autoload/' do

  user 'vagrant'
  group 'vagrant'
end

directory '/home/vagrant/.vim/bundle/' do

  user 'vagrant'
  group 'vagrant'
end

bash 'Roboto Mono font' do
  code <<-EOH
    curl -LSso /home/vagrant/.local/share/fonts/Roboto%20Mono%20for%20Powerline.ttf https://github.com/powerline/fonts/raw/master/RobotoMono/Roboto%20Mono%20for%20Powerline.ttf
  EOH
end

bash 'pathogen' do
  code <<-EOH
    curl -LSso /home/vagrant/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
  EOH
  
  action :run
end

git "/home/vagrant/.vim/bundle/vim-airline/" do
  repository "https://github.com/vim-airline/vim-airline"

  enable_checkout false

  user 'vagrant'
  group 'vagrant'

  action :checkout
end

git "/home/vagrant/.vim/bundle/vim-fugitive/" do
  repository "https://github.com/tpope/vim-fugitive"

  enable_checkout false

  user 'vagrant'
  group 'vagrant'

  action :checkout
end

cookbook_file '/home/vagrant/.vimrc' do
  source '.vimrc'
  
  user 'vagrant'
  group 'vagrant'
end

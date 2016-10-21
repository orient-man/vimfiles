Source: http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

# Installing your Vim environment on another machine

    cd ~
    git clone http://github.com/username/dotvim.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc
    cd ~/.vim
    git submodule init
    git submodule update

# Upgrading a plugin bundle

    cd ~/.vim/bundle/fugitive
    git pull origin master

# Upgrading all bundled plugins

git submodule foreach git pull origin master

package :vim do
  description "vim"

  apt 'vim'

  verify do
    has_apt 'vim'
  end
end

package :vim_system_vimrc do
  description "installs systemwide /etc/vimrc"

  requires :vim

  systemvimrc = '/etc/vim/vimrc.local'
  vimrcsrc = File.join(File.dirname(__FILE__), 'resources', 'vimrc')
  vimrcsrc = config(:VIM_SYSTEM_VIMRC_CUSTOM, :default => vimrcsrc, :required => true)

  transfer vimrcsrc, '/tmp/vimrc.local', :sudo => true do
    post :install, "mkdir -p #{File.dirname(systemvimrc)}"
    post :install, "mv /tmp/vimrc.local #{systemvimrc}"
  end

  verify do
    has_file systemvimrc
  end
end

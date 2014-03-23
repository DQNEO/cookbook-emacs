# -*- coding: utf-8 -*-
# see http://dqn.sakusakutto.jp/2012/06/centos62emacs241install.html
tarball_filename = "emacs-#{node['emacs']['version']}.tar.gz"
tarball_filepath = Chef::Config['file_cache_path'] + '/' + tarball_filename
remote_filepath = node['emacs']['url'] + tarball_filename

package "ncurses-devel" do
  action :install
end

remote_file tarball_filepath do
  source remote_filepath
  not_if "test -e #{tarball_filepath}"
  mode      0644
end

# reduce line-noise-eyness
execute "Extracting and Building Emacs #{node['emacs']['version']} from Source" do
  cwd Chef::Config['file_cache_path']
  command <<-COMMAND
    tar xfz #{tarball_filename}
    cd emacs-#{node['emacs']['version']}
    ./configure --without-x  --prefix=#{node['emacs']['prefix']}
    make
    make install
  COMMAND
  creates "#{node['emacs']['prefix']}/bin/emacs"
  not_if "emacs --version | grep #{node['emacs']['version']}"
end

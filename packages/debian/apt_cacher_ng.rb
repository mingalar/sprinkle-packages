package :apt_cacher_ng do
  description "apt-cacher-ng"

  apt_cacher_ng_conf = '/etc/apt-cacher-ng/acng.conf'
  apt_cacher_ng_port = Integer(config(:APT_CACHER_NG_PORT, :required => true, :default => 3142))

  apt 'apt-cacher-ng' do
    post :install, "sed -i -e s/^Port:.*$/Port:#{apt_cacher_ng_port}/g #{apt_cacher_ng_conf}"
    post :install, "service apt-cacher-ng restart"
  end

  verify do
    has_apt 'apt-cacher-ng'
    file_contains apt_cacher_ng_conf, "^Port:#{apt_cacher_ng_port}$"
    has_process 'apt-cacher-ng'
  end
end

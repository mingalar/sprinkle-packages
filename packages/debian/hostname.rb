def hostname_split
  hostname_full = config(:HOSTNAME, :regexp => /\A[[:alnum:]-]+(\.[[:alnum:]-]+)*\Z/, :required => true)
  hostname_short = hostname_full.split('.').first
  [hostname_full, hostname_short]
end

package :hostname do
  description "Sets system hostname"

  requires :hostname_in_etc_hosts

  hostnamerc = '/etc/hostname'

  hostname_full, hostname_short = hostname_split

  replace_text '^.*$', hostname_short, hostnamerc, :sudo => true do
    post :install, "/etc/init.d/hostname* start" # hostname on ubuntu & hostname.sh on debian
  end

  verify do
    file_contains hostnamerc, "^#{hostname_short}$"
  end
end

package :hostname_in_etc_hosts do
  description "Adds entry in /etc/hosts for system hostname"

  hostsrc = '/etc/hosts'

  hostname_full, hostname_short = hostname_split

  push_text "127.0.1.1 #{hostname_full} #{hostname_short}", hostsrc, :sudo => true

  verify do
    file_contains hostsrc, "^127.0.1.1 #{hostname_full} #{hostname_short}$"
  end
end

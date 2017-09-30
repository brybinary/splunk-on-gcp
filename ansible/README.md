# splunk enterprise vagrant/ansible based lab

```author: bryan oakley-wiggins [brybinary]``` `some initial vagrant kick-starter inspiration from` http://blog.element84.com/dry-up-your-vagrant-files.html

`GitHub link (public repo where I shall also be adding public friendly changes):` https://github.com/MONIGIT/splunk_lab

###<!-- [credentials +]: -->
1. splunk user: admin
2. splunk user password: 5Imples
3. ansible-vault password: 5Imples (used to en|de/crypt vars)
4. hostname: splunklabnode*
5. ip: 10.91.0.#

This is the first basic version of a lab for a full stack clustered splunk enterprise 6.5.1 env. Currently it pulls the rpm and builds individual nodes each time (good for testing individual components) and later versions will include single builds (cached rom, packer etc).

### environment REQ's
vagrant (version 1.8.6) <- the vagrantfile has been updated to workaround an issue with private networking on other versions
virtualbox (others to follow - vcenter, kvm etc)
local ansible + ansible-vault (env used to build this lab is mac based)
internet connectivity to pull down splunk 6.5.1 .rpm

### lab schema
1x index cluster (inc master + 3 peers) and multi-site
1x search head cluster [3 members] (inc deployer + captain bootstrap)
2x heavy forwarders with forwarders and receivers configured using `indexer discovery`
node count = 9 (this number is within the vagrant file variable and can be changed)

### starting up
with all pre-req's in place, shell into the directory and `vagrant up` <- supply ansible-vault password for decrypting the relevant vars (you could decrypt and remove the vault requirement in the vagrantfile)

### destroying
vagrant destroy -f (or just destroy individual guests/groups)

### selinux
splunk should install fine on an enforced selinux build but you may need to add some ports for certain access. udupdated selinux roles to follow.for now, you can manually run the following to manage selinux should you require (you could always set selinux to permissive/disabled but i would strongly advise you do not):
	sudo yum install policycoreutils-python -y
	e.g. semenage port -a -t http_port_t -p tcp 9997

### notes
* it is sequential and ordered according to how splunk needs to be configured (roles include hard coded ip/hostname so be cautious if you change anywhere and update accordingly). 

* compute is minimal and you can add to change but I have found using a single cpu and 512 memory fine for testing.

* ansible-vault is used for en|de/crypting the credentials.

* all vagrant configuration can be changed to suit but all splunk commands need to be static (thats the way splunk is configured) <- of course, names + ip schema can be changed to suit.

* the license used will be the trial 60 day (I had to remove my dev license as this is a personal license and I would be breaking it's conditions if I distributed it). the code to add your own license exists and can be uncommented.

* further enhancements will be published, including containers, dynamic inventory, ldap endpoints, haproxy LB pools, multi-site, better grouping, improved validation/error condition checks/traps, LetsEncrypt certificates etc etc.

##### all comments, feedback and of course improvements very welcomed.

Thx, enjoy and keep sharing open source!
brybinary

```
.
├── README.md
├── Vagrantfile
├── roles
│   ├── 0-day
│   ├── install_splunk
│   │   ├── tasks
│   │   │   └── main.yml
│   │   └── vars
│   │       └── main.yml
│   ├── lab_add_hosts
│   │   └── tasks
│   │       └── main.yml
│   ├── lab_cluster_idx_peers
│   │   ├── tasks
│   │   │   └── main.yml
│   │   └── vars
│   │       └── main.yml
│   ├── lab_cluster_master
│   │   ├── tasks
│   │   │   └── main.yml
│   │   └── vars
│   │       └── main.yml
│   ├── lab_heavy_forwarder
│   │   ├── tasks
│   │   │   └── main.yml
│   │   └── vars
│   │       └── main.yml
│   ├── lab_index_cluster_bundle
│   │   ├── tasks
│   │   │   └── main.yml
│   │   └── vars
│   │       └── main.yml
│   ├── lab_license_master
│   │   ├── tasks
│   │   │   └── main.yml
│   │   ├── templates
│   │   └── vars
│   │       └── main.yml
│   ├── lab_license_slave
│   │   ├── tasks
│   │   │   └── main.yml
│   │   └── vars
│   │       └── main.yml
│   ├── lab_shcluster_captain_bootstrap
│   │   ├── tasks
│   │   │   └── main.yml
│   │   └── vars
│   │       └── main.yml
│   ├── lab_shcluster_deployer
│   │   ├── tasks
│   │   │   └── main.yml
│   │   └── vars
│   │       └── main.yml
│   ├── lab_shcluster_ldap
│   │   ├── tasks
│   │   └── vars
│   ├── lab_shcluster_member_1
│   │   ├── tasks
│   │   │   └── main.yml
│   │   └── vars
│   │       └── main.yml
│   ├── lab_shcluster_member_2
│   │   ├── tasks
│   │   │   └── main.yml
│   │   └── vars
│   │       └── main.yml
│   ├── lab_shcluster_member_3
│   │   ├── tasks
│   │   │   └── main.yml
│   │   └── vars
│   │       └── main.yml
│   ├── patch
│   └── replace
├
└── splunk-live-lab-dev-commit_v.01.yml
```

#cloud-config
users:
  - name: test-user
    gecos: Bar B. Foo
    sudo: ALL=(ALL) NOPASSWD:ALL
    groups: users, admin
    ssh_import_id: None
    lock_passwd: true
    ssh_authorized_keys:
      - <ssh pub key 1>
      - <ssh pub key 2>
fs_setup:
  - label: ephemeral0
    filesystem: 'ext3'
    device: 'ephemeral0'
    partition: 'auto'
  - label: mylabl2
    filesystem: 'ext4'
    device: '/dev/xvda1'
    cmd: mkfs -t %(filesystem)s -L %(label)s %(device)s

runcmd:
 - [ ls, -l, / ]
 - [ sh, -xc, "echo $(date) ': hello world!'" ]
 - [ sh, -c, echo "=========hello world'=========" ]
 - ls -l /root
 
 - mkdir /run/mydir
 - [ wget, "http://homeassignment-mastercard.org", -O, /run/mydir/index.html ]
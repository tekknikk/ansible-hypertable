ansible-hypertable
==================

A delicious hypertable build with aws emr and mapr.  Configurable.

INSTRUCTIONS:
1) Set up your build environment:
Install Ansible
shell source ansible env
shell export ANSIBLE_HOST_KEY_CHECKING=False


2) Edit build vars in /group_vars/build


3) Hypertable Playbooks

Playbook: Build hypertable
Command: ansible-playbook -v -i build build.yml
Notes: Build can take 20+ mins depending upon cluster size.

Playbook: Test hypertable:
Command: ansible-playbook -v -i panda.hosts test.yml
Notes: Creates namespace, loads schema, loads table and then backs it up.

Playbook: Load all data into hypertable
Command: ansible-playbook -v -i panda.hosts load.yml
Notes:  Uses an ebs attached mount where import scripts and data live.  Import takes hours.
        Mount point: /data
        Path to scripts: /data/panda
        Import script template: $table_name.load.hql
        Path to data: /data/panda
        Data template: ???
      

Playbook: Backup all data from hypertable
Command: ansible-playbook -v -i panda.hosts backup.yml
Notes:  This takes hours.



FAQ
1) Playbook debuging
For maximum ansible debug verbosity use "-vvvv".  The more v's, the more debug output.

2) Newrelic.
If you don't have a newrelic key or don't want to use newrelic, then comment out the new relic roles in /build.yml on lines 18, 30 and 43.

3) Build variable: keyname
This key needs to already exist.  Enter just the name and do not include the .pem file extension.

TODO
1) Describe build variables
2) Templatize file Capfile.user_config.json.j2





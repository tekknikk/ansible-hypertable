ansible-hypertable
==================

A delicious hypertable build with aws emr and mapr.  Configurable.

#INSTRUCTIONS:
### 1. Set up your build environment:
- Install AWS CLI
- Configure AWS CLI with a profile
- Install Ansible: http://docs.ansible.com/intro_installation.html
- Set ansible env: shell source ansible env
- Turn host key checking off: shell export ANSIBLE_HOST_KEY_CHECKING=False
- Ansible needs Jinja2: apt-get install python-jinja2
- If old ssh like 5.5: shell export ANSIBLE_SSH_ARGS=""

### 2. Edit build vars in /group_vars/build
- profile: usp
- name: panda
- type: m1.large
- masters: 1
- cores: 1
- tasks: 3
- log_uri: s3://pandahard/
- mapr_edition: m3
- mapr_version: 3.1.1
- ami_version: 2.4.2
- hypertable_version: 0.9.8.1
- data: vol-e1141fe5
- newrelic: 9910108157933df624056a0f5c26f19df6090a28

### 3. Hypertable Playbooks

#### Playbook: Build hypertable
- Command: ansible-playbook -v -i build build.yml
- Notes: Build can take 20+ mins depending upon cluster size.

#### Playbook: Test hypertable
- Command: ansible-playbook -v -i panda.hosts test.yml
- Notes: Creates namespace, loads schema, loads table and then backs it up.

#### Playbook: Load all data
- Command: ansible-playbook -v -i panda.hosts load.yml
- Notes:  Uses an ebs attached mount where import scripts and data live.
    Mount point: /data
    Path to data: /data/panda/source/$table_name
    Path to scripts: /data/panda/source/$table_name/load.hql
    
#### Playbook: Backup all data
- Command: ansible-playbook -v -i panda.hosts backup.yml
- Notes:  Uses an ebs attached mount where import scripts and data live.
    Path: /data/panda/backups

#### Playbook: Clean all data
- Command: ansible-playbook -v -i panda.hosts clean.yml

### 4) Monitoring
- Hypertable Monitoring @ panda_masters[0].public_ip:15860
- NewRelic available if you entered a licence or used the one in this repo which is totally ok.


#FAQ
1. Playbook debuging
For maximum ansible debug verbosity use "-vvvv".  The more v's, the more debug output.

2. Newrelic.
If you don't have a newrelic key or don't want to use newrelic, then comment out the new relic roles in /build.yml on lines 18, 30 and 43.






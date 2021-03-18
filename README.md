# Playbook play_hashicorp_vault

```bash

rm -rf venv/
rm -rf /root/.cache/pip/

mkdir -p venv
python3 -m venv --system-site-packages venv
source venv/bin/activate

pip3 install --upgrade pip
pip3 install -r requirements.txt --upgrade

# ansible-galaxy install -v -f -r roles/requirements.yml

export ANSIBLE_LOG_PATH="ansible_$(date +"%y%m%d%H%M%S").log"
echo "Logdatei: ${ANSIBLE_LOG_PATH}"

ansible --version | head -n 1
ansible --version | grep "python version"

sqlite3 sqlite.db
sqlite3 sqlite.db < initdb.sql

ansible-playbook -i inventories/test/hosts.ini -v playbook-test.yml
```

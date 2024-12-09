HOST_IP="10.20.40.140"
HOST_USR="joel"

EXTRA_VARS="\"usr\":${HOST_USR}"
EXTRA_VARS="{${EXTRA_VARS}}"

ansible-playbook -i ${HOST_IP}, -K -u ${HOST_USR} --extra-vars ${EXTRA_VARS} provision_dev_box.yml


HOST_IP="PROVIDE an IP"
HOST_USR="PROVIDE a USR"

EXTRA_VARS="\"usr\":${HOST_USR}"
EXTRA_VARS="{${EXTRA_VARS}}"

ansible-playbook -i ${HOST_IP}, -K -u ${HOST_USR} --extra-vars ${EXTRA_VARS} provision_dev_box.yml


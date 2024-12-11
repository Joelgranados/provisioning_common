#!/usr/bin/env bash

BASENAME="$(basename "${BASH_SOURCES[0]}")"

USAGE="Usage: ${BASENAME} ARGS [OPTIONS]

Execute the development provisioning ansible playbook

ARGS: -u <user> -i <ip>
  -u, --user    The user name in the machine to provision
  -i, --ip      The IP of the machine to provision

OPTIONS:
  -h, --help    This help message
"

get_provision_opts()
{
  local short="u:i:h"
  local long="user:,ip:,help"

  if ! tmp=$(getopt -o "$short" --long "$long" -n "$BASENAME" -- "$@"); then
    exit 1
  fi

  eval set -- "$tmp"
  unset tmp

  while true; do
    case "$1" in
    '-u' | '--user' )
      HOST_USR="$2"; shift 2
      ;;

    '-i' | '--ip' )
      HOST_IP="$2"; shift 2
      ;;

    '-h' | '--help' )
      echo -e "${USAGE}"
      exit 0
      ;;

    '--' )
      shift; break
      ;;

    * )
      echo -e "${USAGE}"
      exit 1
      ;;
    esac
  done

  if [[ ! -v HOST_USR ]]; then
    echo "You must pass a user name"
    echo -e "${USAGE}"
    exit 1
  fi

  if [[ ! -v HOST_IP ]]; then
    echo "You must enter a host ip"
    echo -e "${USAGE}"
    exit 1
  fi
}

get_provision_opts "$@"

EXTRA_VARS="\"usr\":${HOST_USR}"
EXTRA_VARS="{${EXTRA_VARS}}"

echo "ansible-playbook -i ${HOST_IP}, -K -u ${HOST_USR} --extra-vars ${EXTRA_VARS} provision_dev_box.yml"
ansible-playbook -i ${HOST_IP}, -K -u ${HOST_USR} --extra-vars ${EXTRA_VARS} provision_dev_box.yml


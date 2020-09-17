#!/bin/bash
# Requirements:
#   - installed and configured brew (if openconnect is not installed)
# Environment variables, should be set as secret in the bitrise dashboard!
#   - OPENCONNECT_VPN_TERMINATOR env var with IP address or host name
#   - OPENCONNECT_USER env var with VPN username
#   - OPENCONNECT_PASSWORD env var with VPN password
#   - OPENCONNECT_SERVERCERT env var with VPN fingerprint hash (like: pin-sha256:xyz1234....)

check_existence() {
    if [ "x$1" = "x" ]; then
        echo "ERROR: required \$$2 environment variable is missing or empty, exiting"
        exit 1
    fi
}

echo "Cisco Firepower VPN step starting... "

check_existence "$OPENCONNECT_VPN_TERMINATOR" "OPENCONNECT_VPN_TERMINATOR"
check_existence "$OPENCONNECT_USER" "OPENCONNECT_USER"
check_existence "$OPENCONNECT_PASSWORD" "OPENCONNECT_PASSWORD"
check_existence "$OPENCONNECT_SERVERCERT" "OPENCONNECT_SERVERCERT"

# Check if openconnect is installed
openconnect --version &>/dev/null
if [ $? -ne 0 ]; then
    echo "Openconnect is not installed, calling brew to install it..."
    brew install openconnect
fi

echo $OPENCONNECT_PASSWORD | sudo openconnect $OPENCONNECT_VPN_TERMINATOR --user=$OPENCONNECT_USER --passwd-on-stdin --servercert $OPENCONNECT_SERVERCERT &
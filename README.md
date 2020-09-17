# Bitrise Step to connect to Cisco Firepower VPN Terminator with Openconnect

You can use this step to connect to a Cisco Firepower VPN Terminator with Openconnect.

Requirements:
   - installed and configured brew (if openconnect is not installed)

Environment variables, should be set as **secret** in the bitrise dashboard!
   - `OPENCONNECT_VPN_TERMINATOR` env var with IP address or host name
   - `OPENCONNECT_USER` env var with VPN username
   - `OPENCONNECT_PASSWORD` env var with VPN password
   - `OPENCONNECT_SERVERCERT` env var with VPN fingerprint hash (like: pin-sha256:xyz1234....)

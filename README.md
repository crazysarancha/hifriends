# hifriends

Instructions for Google cloud.

0. Register on google cloud(you wil have free 300$ there), protonvpn. 

1. Create publiccaly accesible file with your targer (you can use same google account) with content "HOST:PORT"

1. Run `sudo bash install.sh` and follow instructions. When it comes to credentials enter not PROTON credentials, but openVpn one. See https://protonvpn.com/support/vpn-login/ , section "OpenVPN / IKEv2 credentials"

2. Create new machine image based on your instance.

3. Spin up as much instances as it is allowed for your protonvpn connections (for Plus subscription it is 10, for example)

4. On each instance run `sudo bash ddos.sh {FILE_URL form step#1} &`. Then disown

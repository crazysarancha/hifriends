# hifriends

Instructions for Google cloud.

0. Register on Google cloud (you wil have free 300$ there) and protonvpn.
1. Create publicly accessible file with your targets (you can use same google account) with content "HOST:PORT"
2. Launch 1 virtual machine and to following steps there:
   1. Install docker https://docs.docker.com/get-docker/
   2. Clone this repo
3. Create image from set up machine
4. Get ProtonVpn credentials, see https://protonvpn.com/support/vpn-login/, section "OpenVPN / IKEv2 credentials"
5. Spin up as many instances as it is allowed for your protonvpn connections (for example, for Plus subscription it is 10) from created image
6. On each instance run following command:

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

If you have powerful machine, you can run several ddos-ripper containers by adding
option `--scale ddos-ripper=N`, where N - desired number of ddos containers 

 
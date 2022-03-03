# hifriends

Instructions for Google cloud.

0. Register on Google cloud (you wil have free 300$ there) and protonvpn.
1. Get ProtonVpn credentials, see https://protonvpn.com/support/vpn-login/, section "OpenVPN / IKEv2 credentials"
2. Create publicly accessible file with your target (you can use same google account) with content "HOST:PORT"
3. Launch 1 virtual machine(for example ec2-standard-4 with 4 vCPU) and run following commands:
```
sudo apt-get install git

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

git clone https://github.com/crazysarancha/hifriends.git

cd hifriends

sudo TARGET_FILE="{public_file_with_targets}" \
PROTONVPN_USERNAME={your_openvpn_username} \
PROTONVPN_PASSWORD={your_openvpn_password} \
PROTONVPN_SERVER=RU \
PROTONVPN_TIER={you_plan_tier} \
docker compose up -d --build --scale ddos-ripper={N}
```
{public_file_with_targets} - from section2
{you_plan_tier} - Proton VPN Tier (0=Free, 1=Basic, 2=Pro, 3=Visionary)
{your_openvpn_username} - from section1
{your_openvpn_password} - from section1
{N} - number of dripper containers. For `ec2-standard-4` 5 works fine
See https://tprasadtp.github.io/protonvpn-docker/#/README?id=environment-variables

3. Create image from set up machine
4. Spin up as many instances from created image as it is allowed for your protonvpn connections and you are OK to pay for them.
For example, for Plus subscription it is 10 by default, but you can increase it in proton account)
Note: sometimes it might be the case that all protonvpn servers are busy.
```
[!] No Server in country RU found
[!] Please choose a valid country
```
But not all sites are closed by geolocation

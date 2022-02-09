# Lattice-Connect DAppNode Package

[![DAppNodeStore Available](https://img.shields.io/badge/DAppNodeStore-Available-brightgreen.svg)](http://my.dappnode/#/installer/lattice-connect.public.dappnode.eth)

[![Grid Plus github](https://img.shields.io/badge/GithubRepo-blue.svg)](https://github.com/gridplus/lattice-connect) (Official)

Lattice-Connect is a self hosted relay service for your GridPlus Lattice1 - it allows you to avoid using GridPlus' centralized relay service and host your own. See their official GitHubRepo above for more information.

This package exposes `3000` for the lattice-connect relay and `1883` for the MQTT broker.

**WARNING: The default GridPlus Wallet (https://lattice.gridplus.io/) is only accessible over HTTPS. You'll need to install the [Lattice-Manager](https://github.com/MysticRyuujin/dappnode-lattice-manager) package to manage your Lattice1 or expose port 3000 over HTTPS in the package's network settings whenever you want to upload an ABI pack OR when configuring MetaMask for the first time (this is not recommended). You should remove this mapping when not in use. MetaMask only needs it during initial setup.**

You can get around this requirement by using [Frame](https://frame.sh/)

Follow these instructions on your Lattice1 to connect (SSH to your Lattice1):

** NOTE: DNS on the Lattice1 sucks, I recommend just using IP **

```
# Stop Services
service gpd stop
service mosquitto stop

# Point Lattice1 at lattice-connect
uci set gridplus.remote_mqtt_address=<DAppNode IP or Container Name>:1883
uci set gridplus.rabbitmq_password=<MQTT_BROKER_PASSWORD>
uci commit

# Remove the SSL/TLS Requirement (communication is still end-to-end encrypted)
sed -i 's/^bridge_capath/#bridge_capath/' /etc/init.d/mosquitto

# Start Services
service mosquitto start
service gpd start
```

If your Lattice1 is connected to the DAppNode WiFi you can use the container name (e.g `lattice-connect.dappnode`) otherwise you can use the IP of the DappNode itself. The package automatically exposes the ports required.

You set the `MQTT_BROKER_PASSWORD` when setting up this package in the Wizard, if you forgot it you can look under the Package config tab.

If everything was setup correctly you should be able to test the service using the following command (replace Device ID with your Lattice1's Device ID):

```bash
wget -O- --post-data='[1,2,3]' --header='Content-Type:application/json' 'http://<DAppNode IP or Container Name>:3000/<Device ID>'
```

Expected output is something like this:

```
HTTP request sent, awaiting response... 200 OK
Length: 151 [application/json]
Saving to: 'STDOUT'
2022-02-08 21:07:04 (1.03 MB/s) - written to stdout [81/81]
```

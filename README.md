# quickconnect-display
Display a QuickConnect QR code image to the command line for connecting a BTC Node

## Usage
This script will construct a quickconnect url and create a qr code to display. The script assumes the user has already installed bitcoin core and configured it to run over tor. The QR code produced can be used with any walelt that supports the quickconenct protocol, including Fully Noded.
 To run, do: `sudo bash qc.sh USERNAME HIDDEN_SERVICE_DIR` where USERNAME is the user who controls the file `bitcoin.conf` and HIDDEN_SERVICE_DIR is the name of your hidden service (if you used the standup scripts to configure your node, then it will be in standup). The script will look in /var/lib/tor/ for your hidden service.
 

sudo apt update && sudo apt upgrade -y
sudo apt install curl tar wget clang pkg-config libssl-dev jq build-essential bsdmainutils git make ncdu gcc git jq chrony liblz4-tool -y

sudo apt install curl tar wget clang pkg-config libssl-dev jq build-essential bsdmainutils git make ncdu gcc git jq chrony liblz4-tool -y

ver="1.17.2"
cd $HOME
wget "https://golang.org/dl/go$ver.linux-amd64.tar.gz"
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf "go$ver.linux-amd64.tar.gz"
rm "go$ver.linux-amd64.tar.gz"
echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> $HOME/.bash_profile
source $HOME/.bash_profile
go version
git clone https://github.com/archway-network/archway
cd archway
git checkout main
make install
cd $HOME
ARCHWAY_CHAIN="torii-1"
ARCHWAY_MONIKER="kokodjamboa" # come up with your validator name
ARCHWAY_WALLET="kokodjambo_wallet"
echo 'export ARCHWAY_CHAIN='${ARCHWAY_CHAIN} >> $HOME/.bash_profile
echo 'export ARCHWAY_MONIKER='${ARCHWAY_MONIKER} >> $HOME/.bash_profile
echo 'export ARCHWAY_WALLET='${ARCHWAY_WALLET} >> $HOME/.bash_profile
source $HOME/.bash_profile
archwayd init ${ARCHWAY_MONIKER} --chain-id $ARCHWAY_CHAIN
archwayd keys add $ARCHWAY_WALLET


wget -O $HOME/.archway/config/genesis.json "https://raw.githubusercontent.com/archway-network/testnets/main/torii-1/penultimate_genesis.json"
archwayd add-genesis-account $(archwayd keys show $ARCHWAY_WALLET -a) 1001000utorii

archwayd gentx $ARCHWAY_WALLET 1000000utorii \
  --commission-rate=0.1 \
  --commission-max-rate=0.1 \
  --commission-max-change-rate=0.1 \
  --pubkey $(archwayd tendermint show-validator) \
  --chain-id=torii-1 \
  --moniker="${ARCHWAY_MONIKER}"
  
  Leha240818
# OUTPUT EXAMPLE
# Genesis transaction written to "~/.archway/config/gentx/gentx-7fba3a5XXXXXXXXXXXXXXXXXXXxxxxXXXXXXX1.json"

DOWNLOAD AND BACKUP $HOME/.archway/config/priv_validator_key.json NOW!

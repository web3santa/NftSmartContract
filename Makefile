include .env

build:
	forge build
clean:
	forge clean
deploy:
	forge script script/DeployNft.s.sol:DeployNft \
	--rpc-url ${ARBITRUM_URI} \
	--private-key ${PRIVATE_KEY} \
	--broadcast

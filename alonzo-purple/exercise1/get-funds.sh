#! /usr/bin/bash

export ADDRESS=$(cat payment.addr)
export API_KEY="jv3NBtZeaL0lZUxgqq8slTttX3BzViI7"

curl -v -XPOST "https://faucet.alonzo-purple.dev.cardano.org/send-money/$ADDRESS?apiKey=$API_KEY"

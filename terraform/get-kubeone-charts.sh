#!/bin/bash
VERSION=$(curl -w '%{url_effective}' -I -L -s -S https://github.com/kubermatic/kubermatic/releases/latest -o /dev/null | sed -e 's|.*/v||')
wget https://github.com/kubermatic/kubermatic/releases/download/v${VERSION}/kubermatic-ce-v${VERSION}-linux-amd64.tar.gz
tar xzf kubermatic-ce-v${VERSION}-linux-amd64.tar.gz charts
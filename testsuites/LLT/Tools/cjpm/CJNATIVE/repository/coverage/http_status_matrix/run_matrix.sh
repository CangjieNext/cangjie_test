#!/bin/sh
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.

python3 server.py 39137 >/dev/null 2>&1 &
server_pid=$!
trap 'kill "$server_pid" 2>/dev/null || true' EXIT
sleep 1

current=placeholder
for code in 400 403 500 418; do
    sed -i "s/^${current} =/idx${code} =/" cjpm.toml
    current=idx${code}
    rm -f cjpm.lock
    cjpm check || true
done

for code in 400 403 429 500 418; do
    sed -i "s/^${current} =/dl${code} =/" cjpm.toml
    current=dl${code}
    rm -f cjpm.lock
    cjpm check || true
done

sed -i "/^${current} =/d" cjpm.toml
current_name=root
current_source=root
for code in 403 404 409 429 500 418; do
    sed -i "s/^name = \"${current_name}\"/name = \"pub${code}\"/" cjpm.toml
    sed -i "s/^package ${current_source}$/package pub${code}/" src/root.cj
    current_name=pub${code}
    current_source=pub${code}
    cjpm publish || true
done

sed -i "s/^name = \"${current_name}\"/name = \"pubabort\"/" cjpm.toml
sed -i "s/^package ${current_source}$/package pubabort/" src/root.cj
cjpm publish || true

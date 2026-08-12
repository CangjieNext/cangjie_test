#!/bin/sh
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.

python3 server.py 39139 >/dev/null 2>&1 &
server_pid=$!
trap 'kill "$server_pid" 2>/dev/null || true' EXIT
sleep 1

cjpm install goodpkg-1.0.0 --root install_root -V || true
./install_root/bin/goodpkg || true
cjpm install wrongpkg-1.0.0 --root wrong_root -V || true
cjpm install invalidpkg-1.0.0 --root invalid_root -V || true
cjpm install hashbad-1.0.0 --root hash_root -V || true
cjpm install badindex-1.0.0 --root bad_index_root -V || true
cjpm install noversion-1.0.0 --root no_version_root -V || true
cjpm install abortpkg-1.0.0 --root abort_root -V || true

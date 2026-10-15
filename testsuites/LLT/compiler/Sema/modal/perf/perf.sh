# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.
cd "$(dirname "$0")"

cjc -L${CANGJIE_STDX_PATH} --import-path=${CANGJIE_STDX_PATH} json-old.cj -lstdx.encoding.json -O2 --int-overflow=wrapping --no-sub-pkg -Woff all -o old
# printf "non local\n"
LD_LIBRARY_PATH="${CANGJIE_STDX_PATH}:${LD_LIBRARY_PATH}" ./old > old.t
cjc -L${CANGJIE_STDX_PATH} --import-path=${CANGJIE_STDX_PATH} json.cj -lstdx.encoding.json -O2 --int-overflow=wrapping --no-sub-pkg -Woff all -o main
# printf "\n\nlocal\n"
LD_LIBRARY_PATH="${CANGJIE_STDX_PATH}:${LD_LIBRARY_PATH}" ./main > local.t
# heap.dat: idx old local_col1 local_col2; 80 samples → 20 rounds × 4
paste -d' ' old.t local.t | nl -ba -w1 -s' ' > heap.dat
gnuplot plot_heap.gp

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

const ss1 = 1 + 2 - 3 * 4 + 1 ** 3 % 1 + 1 / 2
const ss2 = 1.0 ** 3 + 1.2 - 3.14
const ss3 = "aj" + "kc" + "仓颉"
const ll1 = 1 == 2
const ll2 = 1 != (1 + 2)
const ll3 = 1 < -1
const ll4 = 0 <= -1
const ll5 = 1 > -1
const ll6 = (1 ** 2) >= (1 - 1)
const ll7 = () != ()
const ll8 = r'a' >= r'b'
const kk1 = (1 ^ (8 & 15)) | 24
const hh1 = !(true && true) || true

main() {
    const _ss1 = 1 + 2 - 3 * 4 + 1 ** 3 % 1 + 1 / 2
    const _ss2 = 1.0 ** 3 + 1.2 - 3.14
    const _ss3 = "aj" + "kc" + "仓颉"

    const _ll1 = 1 == 2
    const _ll2 = 1 != (1 + 2)
    const _ll3 = 1 < -1
    const _ll4 = 0 <= -1
    const _ll5 = 1 > -1
    const _ll6 = (1 ** 2) >= (1 - 1)
    const _ll7 = () != ()
    const _ll8 = r'a' >= r'b'

    const _kk1 = (1 ^ (8 & 15)) | 24

    const _hh1 = !(true && true) || true
    0
}

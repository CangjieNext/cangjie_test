/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (JS) EXEC: cp -r %stdpath .
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import std.collection.*

main() {
    var setCol: HashSet<UInt8> = HashSet<UInt8>([12, 32, 45, 69])
    let arrViaHashSetF: Array<HashSet<UInt8>> = Array<HashSet<UInt8>>(2, repeat: setCol)
    let arrViaHashSetS: Array<HashSet<UInt8>> = Array<HashSet<UInt8>>()
    let arrViaHashSetT: Array<HashSet<UInt8>> = Array<HashSet<UInt8>>()
    if (!(arrViaHashSetF != arrViaHashSetS)) {
        return 1
    }
    if (arrViaHashSetS != arrViaHashSetT) {
        return 2
    }
    return 0
}

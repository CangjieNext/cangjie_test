/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args| compare %f
// ASSERT: scan success1

import std.collection.*

main(): Int64 {
    var str2: Array<Bool> = [true, false]
    var r2: HashSet<Bool> = HashSet<Bool>(str2)
    var r3: HashSet<Rune> = HashSet<Rune>()
    var r4: HashSet<Bool> = HashSet<Bool>()
    var r5: HashSet<Rune> = HashSet<Rune>(3)
    var r6: HashSet<Bool> = HashSet<Bool>(1)
    var r8: HashSet<Bool> = HashSet<Bool>(1, {_: Int64 => true})

    var m1: Rune = 'm'
    var m2: Bool = true
    r3.add(m1)
    r4.add(m2)
    r5.add(m1)
    r6.add(m2)
    if (r2.size != 2 || r2.contains(true) != true || r2.contains(false) != true) {
        return 2
    }
    if (r3.size != 1 || r3.contains(m1) != true) {
        return 3
    }
    if (r4.size != 1 || r4.contains(m2) != true) {
        return 4
    }
    if (r5.size != 1 || r5.contains(m1) != true) {
        return 5
    }
    if (r6.size != 1 || r6.contains(m2) != true) {
        return 6
    }
    if (r8.size != 1 || r8.contains(true) != true) {
        return 8
    }
    print("success1\n")
    return 0
}

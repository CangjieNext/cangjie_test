/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args
import std.collection.*

main() {
    var a: ArrayList<Bool> = ArrayList<Bool>()
    var b: ArrayList<Bool> = ArrayList<Bool>([false, true])
    a.add(all: HashSet<Bool>([true]), at: 0)
    b.add(all: HashSet<Bool>([true, false]), at: 0)
    if (a.toString() != "[true]") {
        return 1
    }
    if (b.toString() != "[true, false, false, true]") {
        return 2
    }
    return 0
}

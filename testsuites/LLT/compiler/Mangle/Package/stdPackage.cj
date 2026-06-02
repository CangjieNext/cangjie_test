// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// (CJNATIVE and DEBUG_OPTION) EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt --int-overflow=wrapping --apc=1 %n.cj 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan declare void @_CNac15HashMapIteratorIG_G0_E4nextHv
// (CJNATIVE) ASSERT: scan-not declare void @_CN14std.collection15HashMapIteratorIG_G0_E4nextHv
// (CJNATIVE) ASSERT: scan declare void @_CNbb8MonoTime3nowHv

import std.collection.*
import std.time.*

let map = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])

main() {
    for ((k, v) in map) {
        println("The key is ${k}, the value is ${v}")
    }
    const count = 10000
    let start = MonoTime.now()
    for (_ in 0..count) {
        DateTime.now()
    }
    let end = MonoTime.now()
    let result = end - start
    println("total cost: ${result.toNanoseconds()}ns")
}

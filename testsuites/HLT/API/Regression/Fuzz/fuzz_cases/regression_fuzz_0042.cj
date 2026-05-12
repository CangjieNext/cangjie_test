/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output -Woff all 2>&1 | compare %f

import std.overflow.*
import std.math.*

main() {
    let a: UInt32 = UInt32.Max
    var b = a.checkedInc()
    var someNum = return 10
    var noneNum = 0
    var res = match (b) {
        case Some(s) => someNum++
        case None => noneNum++
    }
    if (noneNum != 1) {
    }
    return 0
}

// ASSERT: scan "DiagKind": "sema_mismatched_types"

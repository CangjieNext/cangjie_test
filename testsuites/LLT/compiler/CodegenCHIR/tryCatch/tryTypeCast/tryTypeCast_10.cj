// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-not 200
// ASSERT: scan 300

interface I1 {
    func foo(): Int64
}

class cassB <: I1 {
    public func foo() {
        12
    }
}

main() {
    var zz = cassB()
    try {
        var x = match ((12, zz)) {
            case newVar: (Int64, I1) => Some(newVar)
            case _ => return 1
        }
        x.getOrThrow()
    } catch (e: Exception) {
        println(200)
    } finally {
        println(300)
    }
    return 0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (CJNATIVE) EXEC: %compiler %cmp_opt %f -Woff unused -o %output
// (CJNATIVE and DEBUG_OPTION) EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %n.cj -Woff unused 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define i64 @_CN7default1AixHlRNat6StringE

class A {
    operator func [](arg1: Int64, arg2: String): Int64 {
        return 0
    }
}

main() {
    let a = A()
    let b: Int64 = a[1, "2"]
    // b == 0
    0
}

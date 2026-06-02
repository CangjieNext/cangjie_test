// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . --apc=1 -Woff unused --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define i64 @_CPI15param_init_func3addHllE1aHv
// (CJNATIVE) ASSERT: scan define i64 @_CPI15param_init_func3addHllE1bHl

package param_init_func

func add(a!: Int64 = 1, b!: Int64 = 2): Int64 {
    return a + b
}

class A {
    operator func [](arg1: Int64, arg2: String, value!: Int64): Unit {
        return
    }
}

main() {
    let r = add(a: 3, b: 4)
    let a = A()
    a[1, "2"] = 0
    0
}

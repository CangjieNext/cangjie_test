// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . --apc=1 -Woff unused --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define internal i64 @_CN22local_multinested_func3fooHvE7nestAddHllE9nestMultiHll

package local_multinested_func

func foo() {
    func nestAdd(a: Int64, b: Int64) {
        func nestMulti(a: Int64, b: Int64) {
            a + b
        }
        a + b + nestMulti(a, b)
    }

    println(nestAdd(1, 2)) // 6

    return nestAdd
}

main() {
    let f = foo()
    let x = f(1, 2)
    println("result: ${x}")
    0
}

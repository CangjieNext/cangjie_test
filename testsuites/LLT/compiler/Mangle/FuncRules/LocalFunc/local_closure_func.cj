// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . --apc=1 -Woff unused --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define internal void @_CN18local_closure_func17returnIncrementerHvE11incrementerHv
// (CJNATIVE) ASSERT: scan define internal i64 @_CN18local_closure_func4foo1HvE7nestAddHll

package local_closure_func

class C {
    public var num: Int64 = 0
}

func returnIncrementer(): () -> Unit {
    let c: C = C()

    func incrementer() {
        c.num++
    }

    incrementer
}

func foo1() {
    // 此处的 foo1 函数的 mangle 名为：_CN<path>7nestAddK_Hll
    func nestAdd(a: Int64, b: Int64) {
        a + b + 3
    }
    println(nestAdd(1, 2))
    return nestAdd
}

main() {
    let f = returnIncrementer()
    f() // c.num increases by 1
    let f1 = foo1()
    f1(1, 2)
}

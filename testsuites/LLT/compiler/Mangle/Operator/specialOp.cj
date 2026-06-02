// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// (CJNATIVE and DEBUG_OPTION) EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt --int-overflow=wrapping --apc=1 %n.cj 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define i64 @_CN7default1AclHCNY_1AE
// (CJNATIVE) ASSERT: scan define i64 @_CN7default1AanHCNY_1AE

class A {
    A(let i: Int64) {}
    operator func ()(a: A) {
        this.i * a.i
    }
    operator func &(a: A) {
        this.i & a.i
    }
}

main() {
    var a1 = A(3)
    var a2 = A(4)
    println("a1(a2): ${a1(a2)}")
    println("a1&a2: ${a1 & a2}")
    0
}

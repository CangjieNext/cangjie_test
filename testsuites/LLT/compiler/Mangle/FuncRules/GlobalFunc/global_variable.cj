// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: globalVarDep
// (CJNATIVE and Linux) EXEC: %clang %clang_shared_opt globalVarDep/%n.c -o lib%n.so
// (CJNATIVE and Linux) EXEC: %compiler %f %cffi-link --save-temps . --apc=1 -Woff unused --output-type=staticlib
// (CJNATIVE and Linux) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE and Linux) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE and Linux) ASSERT: scan define internal void @_CGV15global_variable2vaHv
// (CJNATIVE and Linux) ASSERT: scan define internal void @_CGV15global_variable4obj1Hv

package global_variable

class C1 {
    public func f(): This {
        return this
    }
}

var obj1: C1 = C1()
var va: VArray<Int32, $3> = [1, 2, 3]

foreign func cfoo1(a: CPointer<Int32>): Int32

main() {
    var res = unsafe { cfoo1(inout va) }
    obj1.f()
    println(res)
    0
}

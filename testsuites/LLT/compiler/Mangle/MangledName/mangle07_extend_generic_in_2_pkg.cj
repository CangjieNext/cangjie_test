// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: C
// (DEBUG_OPTION)EXEC-PIPE:%compiler %cmp_opt %compile_lib_opt C/C_dep.cj -o A_dep.%middle
// (DEBUG_OPTION)EXEC-PIPE:%compiler %cmp_opt %compile_lib_opt C/C.cj -o A.%middle
// (DEBUG_OPTION)EXEC: %compiler %cmp_opt %enableCompileDebug A_dep.%middle A.%middle %f -o %n.%suffix
// (DEBUG_OPTION)EXEC: %run %run_opt %n.%suffix
// (DEBUG_OPTION)EXEC-PIPE:%frontendCompiler %compile_lib_opt %cmp_opt A_dep.%middle A.%middle %f --dump-ir 2>&1 | compare %f
// (not CJNATIVE and DEBUG_OPTION)ASSERT: scan _ZN7default6Extend5A_dep1AIl3fooEv

// (CJNATIVE and DEBUG_OPTION)ASSERT: scan _CN7defaultXCN5A_dep1AIG_E3fooHv

internal import A.*
internal import A_dep.*

interface I2 {
    func foo(): Int64
}

extend<T> A<T> <: I2 {
    public func foo() {
        2
    }
}

extend B <: I2 {
    public func foo() {
        2
    }
}

public func bar() {
    if (B().foo() == 2) {
        println("non-generic extending works well")
    }
    let res = funcB()
    if (res == 1) {
        println("non-generic extending works well")
    }

    // Test generic extend in different pkg, but instantiated in the same pkg.
    if (A<Int64>().foo() != 2) {
        return 1
    }
    return funcA<Int64>() - 1
}

main() {
    return bar()
}

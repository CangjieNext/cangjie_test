// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: mangle13
// EXEC: %compiler %cmp_opt %compile_lib_opt mangle13/a.cj -o a.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt mangle13/b.cj -o b.%middle
// EXEC: %compiler %cmp_opt a.%middle b.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args
// (DEBUG_OPTION)EXEC-PIPE: %frontendCompiler %cmp_opt a.%middle b.%middle %f -o %output --dump-ir 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan @_CN1a3BarIG_E10GLOBAL_FOOE
// (CJNATIVE) ASSERT: scan @_CN1a10GLOBAL_FOOE
// (not CJNATIVE) ASSERT: scan @_ZN1a3BarIl10GLOBAL_FOOE
// (not CJNATIVE) ASSERT: scan @_ZN1a3BarIi10GLOBAL_FOOE
// (not CJNATIVE) ASSERT: scan @_ZN1a10GLOBAL_FOOE

// Test varDecl mangling

import a
import a.*
import b.*

main() {
    // Test static member var in generic class
    var result = bar()
    if (result == Bar<Int32>.GLOBAL_FOO) {
        println("True")
    }
    if (result == Bar<Int64>.GLOBAL_FOO) {
        println("True")
    }
    // Test non member var in generic class
    // generate as filed ptr in local class instance
    result = goo()
    Bar<Int32>().GLOBAL_GOO = result
    if (result == Bar<Int32>().GLOBAL_GOO) {
        println("True")
    }
    if (result == Bar<Int64>().GLOBAL_GOO) {
        println("True")
    }
    // Test top-level global var
    result = foo()
    if (result == a.GLOBAL_FOO) {
        println("True")
    }
}

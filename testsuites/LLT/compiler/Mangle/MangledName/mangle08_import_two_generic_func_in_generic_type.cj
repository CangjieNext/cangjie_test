// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: D
// (DEBUG_OPTION)EXEC-PIPE:%compiler %cmp_opt %compile_lib_opt D/D1.cj -o D1.%middle
// (DEBUG_OPTION)EXEC-PIPE:%compiler %cmp_opt %compile_lib_opt D/D2.cj -o D2.%middle
// (DEBUG_OPTION)EXEC: %compiler %cmp_opt %enableCompileDebug D1.%middle D2.%middle %f -o %n.%suffix
// (DEBUG_OPTION)EXEC: %run %run_opt %n.%suffix
// (DEBUG_OPTION)EXEC-PIPE:%frontendCompiler %compile_lib_opt %cmp_opt D1.%middle D2.%middle %f --dump-ir 2>&1 | compare %f
// (not CJNATIVE)ASSERT: scan _ZN2D14DataIi5appleIlEv
// (not CJNATIVE)ASSERT: scan _ZN2D24DataIi5appleIlEv
// (not CJNATIVE)ASSERT: scan _ZN2D13fooIlEv
// (not CJNATIVE)ASSERT: scan _ZN2D23fooIlEv
// (CJNATIVE)ASSERT: scan _CN2D14DataIG_E5appleIG0_Hv
// (CJNATIVE)ASSERT: scan _CN2D14DataIG_E5appleIG0_Hv
// (CJNATIVE)ASSERT: scan _CN2D13fooIG_Hv
// (CJNATIVE)ASSERT: scan _CN2D13fooIG_Hv
import D1
import D2

public func foo() {
    let data1 = D1.Data<Int32>()
    let data2 = D2.Data<Int32>()

    data1.apple<Int64>()
    data2.apple<Int64>()

    D1.foo<Int64>()
    D2.foo<Int64>()
}

main() {
    foo()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../../../pick_defination.py pkg.cj
//
// Regression: interface default mut method calling another mut method that
// writes a struct field. Compile the impl package as staticlib at -O2 so
// FunctionInline inlines foo2 into the _CMN wrapper, then Devirtualization
// rewrites the remaining Invoke. RewriteToApply must UnBoxToRef the boxed
// receiver; peeling Box and ClassStaticCast(struct value -> Struct&) yields
// a null this and SIGSEGV on the field store. Call foo2 on a concrete struct
// (the _CMN path), not only through an interface type.
//
// EXEC: %compiler %cmp_opt %enableO2 %enableDevirtualization %dumpCHIRDebug %compile_lib_opt -Woff all pkg.cj -o test0.%middle
// EXEC: %python pick_defination.py test0_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CMN3pkg1I4foo2Hv$N3pkg1SE$CN3pkg1IE" | compare %f
// EXEC: %compiler %cmp_opt -Woff all test0.%middle %n.cj
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan UnBoxToRef
// ASSERT: scan Apply(Struct-_CN3pkg1SE&->@_CN3pkg1S4foo1Hv
// ASSERT: scan-not ClassStaticCast

import pkg.*

main() {
    var s: S = S()
    let r = s.foo2()
    if (r == 1 && s.x == 1) {
        return 0
    }
    return 1
}

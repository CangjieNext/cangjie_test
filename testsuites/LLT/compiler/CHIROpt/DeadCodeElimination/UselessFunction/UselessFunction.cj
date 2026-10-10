// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../pick_defination.py pkg.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg.cj -o pkg.%middle
// EXEC: %frontendCompiler %enableO2 %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py "default_CHIR/[0-9]*_UselessFuncElimination.chirtxt" WHOLE | compare %f
// Private unused methods removed by late UselessFuncElimination.
// ASSERT: scan srcCodeIdentifier: main
// ASSERT: scan-not srcCodeIdentifier: foo
// ASSERT: scan-not srcCodeIdentifier: goo
// ASSERT: scan-not srcCodeIdentifier: bar

import pkg.A

class C0 {
    private func foo() {}
}

class C1<T> {
    private func foo() {}
}

class C2 {
    private func foo<T>() {}

    private func goo() {
        foo<Int64>()
    }
}

class C3 {
    private func foo() {}
    private func bar() {
        foo()
    }
}

class C4 <: A {}

main() {
    var a = C1<Int64>()
    var b = C2()
    0
}

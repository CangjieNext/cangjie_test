// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg.cj -o pkg.%middle
// EXEC: %frontendCompiler %dumpCHIRDebug -Woff all %f -o %n.%suffix -O2
// (not Windows and DEBUG_OPTION) EXEC: %cat %n\_CHIR/[0-9]*\_RemoveUnusedImports.chir 2>&1 | compare %f
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg.cj -o pkg.%middle  %dumpCHIRDebug
// EXEC: %frontendCompiler %dumpCHIRDebug -Woff all %f -o %n.%suffix -O2 -g 
// (not Windows) EXEC: %cat %n\_CHIR/[0-9]*\_RemoveUnusedImports.chirtxt 2>&1 | compare %f

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

// (not Windows) ASSERT: scan-not @_CN7default2C03fooHv
// (not Windows) ASSERT: scan-not @_CN7default2C1IG_E3fooHv
// (not Windows) ASSERT: scan-not @_CN7default2C23fooIG_Hv
// (not Windows) ASSERT: scan-not @_CN7default2C23gooHv
// (not Windows) ASSERT: scan-not @_CN7default2C33fooHv
// (not Windows) ASSERT: scan-not @_CN7default2C33barHv
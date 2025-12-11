// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg.cj -o pkg.%middle
// EXEC-PIPE-0: %frontendCompiler %dumpCHIRDebug -Woff all %f -o %n.%suffix
// (not Windows and DEBUG_OPTION) EXEC: %cat %n\_CHIR/[0-9]*\_RemoveUnusedImports.chir 2>&1 | compare %f

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

// (not Windows) ASSERT: scan-not @_CN7default2C03fooEv
// (not Windows) ASSERT: scan-not @_CN7default2C1Il3fooEv
// (not Windows) ASSERT: scan-not @_CN7default2C23fooIlEv
// (not Windows) ASSERT: scan-not @_CN7default2C23gooEv
// (not Windows) ASSERT: scan-not @_CN7default2C23fooIGTEEv
// (not Windows) ASSERT: scan-not @_CN7default2C33fooEv
// (not Windows) ASSERT: scan-not @_CN7default2C1IGTE3fooEv
// (not Windows) ASSERT: scan-not @_CN3pkg1A3fooEv

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: mangle10
// (DEBUG_OPTION)EXEC: %compiler %cmp_opt %compile_lib_opt mangle10/aModule/a.cj -o mangle10/aModule/p1.%middle
// (DEBUG_OPTION)EXEC: %compiler %cmp_opt %compile_lib_opt mangle10/b.cj -o p2.%middle
// (DEBUG_OPTION)EXEC: %compiler %cmp_opt mangle10/aModule/p1.%middle p2.%middle %f -o %n.%suffix %import_path_opt ./mangle10
// (DEBUG_OPTION)EXEC: %run %run_opt %n.%suffix
// (DEBUG_OPTION)EXEC-PIPE:%frontendCompiler %cmp_opt mangle10/aModule/p1.%middle p2.%middle %f %import_path_opt ./mangle10 --dump-ir 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan @_CN24aModule.alpha.beta.gamma3fooHv
// (CJNATIVE) ASSERT: scan @_CN24aModule.alpha.beta.gamma3fooHv
// (CJNATIVE) ASSERT: scan @_CN16alpha.beta.gamma3gooHv
// (CJNATIVE) ASSERT: scan @"_CN11bar.baz.qux6<main>Hv"
// (not CJNATIVE) ASSERT: scan @_ZN24aModule.alpha.beta.gamma3fooEv
// (not CJNATIVE) ASSERT: scan @_ZN24aModule.alpha.beta.gamma3fooEv
// (not CJNATIVE) ASSERT: scan @_ZN16alpha.beta.gamma3gooEv
// (not CJNATIVE) ASSERT: scan @"_ZN11bar.baz.qux6<main>Ev"

package bar.baz.qux

import aModule.alpha.beta.gamma.*
import alpha.beta.gamma.*

main() {
    println("bar.baz.qux")
    foo()
    goo()
}

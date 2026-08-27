/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0

// DEPENDENCE: ../../../pick_defination.py open_middle_lib.cj
//
// Regression: public-open middle type B under closed root A must not be treated
// as a closed leaf when deciding unique callees. Under staticlib, B is not
// closed-world (IsSubtypeSetComplete false); FindRealCallee must keep Invoke
// on Box.call. Otherwise Apply(B.foo) mis-dispatches when the receiver is D
// (expect 2, buggy 1). Compiling as exe is not a repro: same-package PUBLIC
// is closed, so the path is accepted and D contributes a second target.
//
// EXEC: %compiler %cmp_opt %enableDevirtualization --no-sub-pkg --fno-chir-function-inlining %dumpCHIRDebug %compile_lib_opt -Woff all open_middle_lib.cj -o test0.%middle
// EXEC: %python pick_defination.py test0_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN4demo3Box4callHv" | compare %f
// EXEC: %compiler %cmp_opt -Woff all test0.%middle %n.cj
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Invoke(Class-_CN4demo1AE&->@_CN4demo1A3fooHv
// ASSERT: scan-not Apply(Class-_CN4demo1BE&->@_CN4demo1B3fooHv

package default

import demo.*

main() {
    run() - 2
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0

// DEPENDENCE: ../../../pick_defination.py p1
//
// Runtime regression: IsSubtypeSetComplete must use outputMode == EXECUTABLE,
// NOT opts.CompileExecutable().
//
// SetupCompileTargetOptions() maps (outputMode=OBJ, compileTarget=DEFAULT) to
// compileTarget=EXECUTABLE, so CompileExecutable() is true for a per-package
// --output-type=obj build. If PUBLIC Base were treated as closed, call() would
// become Apply(OnlyLocal.foo). This driver subclasses Base in another package
// and expects call(External()) == 42; the buggy Apply returns 2 (main exits 255).
//
// --test is required so the library package can be built as obj without a real
// main. The .o therefore also defines main; link with
// --link-option=--allow-multiple-definition and list the driver first so the
// driver's main wins (ld keeps the first definition).
//
// EXEC: %compiler %cmp_opt %enableDevirtualization %experimental_opt --output-type=obj --test --fno-chir-function-inlining %dumpCHIRDebug -Woff all p1/lib.cj -o test0.o
// EXEC: %python pick_defination.py test0_CHIR/[0-9]*_Devirtualization.chirtxt "Func @_CN5test04callHCNY_4BaseE" | compare %f
// EXEC: %compiler %cmp_opt -Woff all %n.cj test0.o --link-option=--allow-multiple-definition
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Invoke(Class-_CN5test04BaseE&->@_CN5test04Base3fooHv
// ASSERT: scan-not Apply(Class-_CN5test09OnlyLocalE&->@_CN5test09OnlyLocal3fooHv

package default

import test0.*

class External <: Base {
    public func foo(): Int64 {
        42
    }
}

main() {
    // Correct: 0. CompileExecutable()-based closed world → call returns 2 → exit 255.
    call(External()) - 42
}

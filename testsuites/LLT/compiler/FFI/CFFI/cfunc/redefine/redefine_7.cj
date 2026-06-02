// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// (DEBUG_OPTION)EXEC: %frontendCompiler %dump-ir-to-screen %cmp_opt %compile_lib_opt %f 2>&1 | compare %f
// ASSERT: scan-not define void @"a:xxx0"()
// ASSERT: scan-not define void @"a.foo"()
package a

foreign func xxx0(): Unit

@C
func foo(): Unit {
    println("I'm foo")
}

public func bar() {
    unsafe {
        xxx0()
        foo()
    }
}

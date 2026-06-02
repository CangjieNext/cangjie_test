// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (CJNATIVE) EXEC: %compiler %cmp_opt %f -Woff unused -o %output
// (CJNATIVE and DEBUG_OPTION) EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %n.cj -Woff unused 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define void @_CN21general_override_func3fooHv
// (CJNATIVE) ASSERT: scan define void @_CN21general_override_func3fooHl
// (CJNATIVE) ASSERT: scan define void @_CN21general_override_func3fooHd
// (CJNATIVE) ASSERT: scan define void @_CN21general_override_func3fooHld

package general_override_func

func foo(): Unit {}

func foo(a: Int64): Unit {}

func foo(a: Float64): Unit {}

func foo(a: Int64, b: Float64): Unit {}

main() {
    foo()
    foo(3)
    foo(3.0)
    foo(3, 3.0)
    0
}

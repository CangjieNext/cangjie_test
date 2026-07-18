/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC-PIPE-1: export LD_LIBRARY_PATH=$CANGJIE_HOME/tools/lib:$LD_LIBRARY_PATH && %compiler %import-cangjie-stdx %cmp_opt %f -o %output %collect_aspects_plugin %weave_aspects_plugin 2>&1 | compare %f
// ASSERT: scan The aspect function globalFunction0 has different FuncType with the woven.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package AOP_demo1

import stdx.aspect_cj.*

@ReplaceFuncBody[packageName: "AOP_demo1", className: "", methodName: "wovenFunction1", isStatic: false,
    recursive: false]
public func globalFunction0(x: Int64, p0: (Int32) -> Int64): Int64 {
    println("annotatedFunction")
    p0(1)
    114514
}

public func wovenFunction1(p0: Int64): Int64 {
    println("wovenFunction1")
    666
}

public func wovenFunction2(p0: Int64): Int64 {
    println("wovenFunction2")
    666
}

main(): Unit {
    println("start")
    wovenFunction1(123)
    wovenFunction2(123)
    println("end")
}

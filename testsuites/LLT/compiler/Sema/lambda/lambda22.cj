// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f

// ASSERT: scan lamdba22.A

package lamdba22

import std.reflect.*

func foo<T>(f: (Int64) -> T) where T <: Object {
    println(TypeInfo.of<T>())
}

public class A {}

main(): Int64 {
    foo {a => A()}
    return 0
}

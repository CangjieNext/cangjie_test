// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f

internal import std.reflect.*

public class C<S> {
    public static func a(p0: S): Int64 {
        12
    }
}

main(): Unit {
    var arr = TypeInfo.of<C<Int64>>()
    let staticFunctions = arr.staticFunctions
    println(staticFunctions.size)
    for (f in arr.staticFunctions) {
        println(f)
    }
}

/* SCAN
1
static func a(Int64): Int64
*/

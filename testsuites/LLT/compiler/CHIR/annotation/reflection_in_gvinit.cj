// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f

import std.reflect.*

@Annotation[target: [Parameter]]
public class A {
    public const init() {}
}

public class C {
    public func f(@A _: Int64): Unit {}
}

func check(): Int64 {
    let param = ClassTypeInfo.of<C>().getInstanceFunction("f", TypeInfo.of<Int64>()).parameters[0]
    let annotations = param.annotations
    let first = annotations.toArray()[0]
    println("first.type=${ClassTypeInfo.of(first)}")
    0
}

let _ = check()

main() {}

/* SCAN
first.type=default.A
*/

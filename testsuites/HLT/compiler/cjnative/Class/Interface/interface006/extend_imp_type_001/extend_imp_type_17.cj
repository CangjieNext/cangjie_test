/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

type un = Unit

interface I {
    operator func [](index: Int64): un {
        return ()
    }
}

extend un <: I {}

class classA<T> {
    public var a: T
    public init(i: T) {
        a = i
    }
}

main(): Int64 {
    var a: classA<un> = classA<un>(())
    if (a.a[9] == ()) {
        return 0
    } else {
        return 1
    }
}

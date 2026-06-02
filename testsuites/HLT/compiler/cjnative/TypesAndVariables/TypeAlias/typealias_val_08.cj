/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Base<T> {
    public var b: T
    public init(x: T, y: Int32) {
        b = x
    }
}

type int = Int32

type str = String

type B<T> = Base<T>

func foo(x: B<int>, y: str): String {
    return x.b.toString() + y
}

main(): Int64 {
    var i: int = 3
    var base: B<int> = Base<Int32>(i, 3)
    let s: str = "hi"
    var res: str = foo(base, s)
    if (res == "3hi") {
        return 0
    }
    return 1
}

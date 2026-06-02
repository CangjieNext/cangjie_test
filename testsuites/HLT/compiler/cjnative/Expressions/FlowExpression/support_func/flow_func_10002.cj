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

func a<T>(input: T): T {
    input
}

func b<T>(input: T): T {
    input
}

class C<T> {
    public var a: T
    public init(input: T) {
        a = input
    }
    public operator func ()(input: (T) -> T): T {
        input(a)
    }
}

main(): Int64 {
    var c = C(1)

    1 |> a
    a<Int64> ~> b<Int64>
    1 |> (a<Int64> ~> b<Int64>)

    c(a<Int64>)
    c(a<Int64> ~> b<Int64>)
    return ((a<Int64> ~> b<Int64>) |> c) - 1
}

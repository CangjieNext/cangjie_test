/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE:  test_10044.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt test_10044.cj -o test.%middle
// EXEC: %compiler %cmp_opt ./test.%middle %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import test.*

public class A<T> {
    public static var a: (Int64) -> Int64 = {input: Int64 => input}

    public static var b: (Int64) -> Int64 = {input: Int64 => input}
}

main(): Int64 {
    1 |> A<Int64>.a
    A<Int64>.a ~> A<Int64>.b
    //1 |> (A<Int64>.a~>A<Int64>.b)
    return 0
}

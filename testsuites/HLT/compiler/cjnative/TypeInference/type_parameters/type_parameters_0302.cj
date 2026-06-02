/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

func test1<T1, T2>(f: (T1) -> T2): (T1) -> T2 {
    {a: T1 => f(a)}
}

func test2<T1, T2>(f: (T1) -> T2): (T1) -> T2 {
    {a: T1 => f(a)}
}

func test3<T1, T2>(f: (T1) -> T2): (T1) -> T2 {
    {a: T1 => f(a)}
}

func test4<T1, T2>(f: (T1) -> T2): (T1) -> T2 {
    {a: T1 => f(a)}
}

main() {
    1 |> test1 {x => x} |> test2 {x => x} |> test3 {x => x} |> test4 {x => x}
    return 0
}

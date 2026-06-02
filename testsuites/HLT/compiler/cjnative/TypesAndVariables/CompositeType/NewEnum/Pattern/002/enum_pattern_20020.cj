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

enum D<T> {
    d(T) | d
}

enum E<T> {
    | e(E<T>)
    | e
}

func test<T>(i_: T) {
    var a: E<T> = e(e(e(e<T>)))
    var i = e<T>
    var res = match (a) {
        case e(e) =>
            print("0");
            i
        case e(e(v)) =>
            print("1");
            v
        case e =>
            print("2");
            i
    }
    match (res) {
        case e => 1
        case e(_) => 0
    }
}

main(): Int64 {
    test(1)
}

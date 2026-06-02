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

type fun<T> = (T) -> T

func foo(x: Int32): Int32 {
    return x
}

func bar(x: fun<Int32>): Int32 {
    return x(3)
}

main(): Int64 {
    var func1: fun<Int32> = foo
    var func2: (fun<Int32>) -> Int32 = bar
    var res: Int32 = func2(func1)
    if (res == 3) {
        return 0
    }
    return 1
}

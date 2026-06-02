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

type Int32ToStr = (Int32) -> String

func foo(x: Int32): String {
    return x.toString()
}

func bar(x: Int32ToStr): String {
    return x(3)
}

main(): Int64 {
    var func1: Int32ToStr = foo
    var func2: (Int32ToStr) -> String = bar
    var res: String = func2(func1)
    if (res == "3") {
        return 0
    }
    return 1
}

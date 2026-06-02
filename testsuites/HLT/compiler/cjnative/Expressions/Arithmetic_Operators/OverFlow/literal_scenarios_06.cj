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

func foo<T>(a: T): T {
    return a
}

main(): Int64 {
    var res1 = foo<Int64>(3 + 4 / 5 * 2 - 1)
    var res2 = foo<Float64>(3.1 + 4.0 / -5.3 * 2.4 - 1.9)
    //    print(res1.toString())
    if (res1 != 2) {
        return 1
    }
    if (res2 != -0.611320754716981) {
        return 1
    }
    return 0
}

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

func foo<T>(x: T): T {
    return x
}

main(): Int64 {
    var arr1 = [1, 2, 3]
    var res = foo<Array<Int64>>(arr1).size
    if (res == 3) {
        return 0
    }
    return 1
}

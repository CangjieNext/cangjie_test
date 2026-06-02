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

func test(): Int64 {
    let a: Array<Int64> = [1]
    if (a[0] != 0 && a.size != 1) {
        return 1
    }
    a[0]
    if (a[0] != 0 && a.size != 1) {
        return 1
    }
    a.get(0)
    if (a[0] != 0 && a.size != 1) {
        return 1
    }
    a.size
    if (a[0] != 0 && a.size != 1) {
        return 1
    }
    a.toArray()
    if (a[0] != 0 && a.size != 1) {
        return 1
    }
    a.isEmpty()
    if (a[0] != 0 && a.size != 1) {
        return 1
    }
    a.iterator()
    if (a[0] != 0 && a.size != 1) {
        return 1
    }
    return 0
}

main(): Int64 {
    return test()
}

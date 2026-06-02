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

var temp: Int64 = 1

func f1() {
    return temp + 0
}

main(): Int64 {
    let a = Array<Int32>(1, repeat: 1)
    try {
        let b = a[f1()]
    } catch (_) {
        return 0
    }

    return 1
}

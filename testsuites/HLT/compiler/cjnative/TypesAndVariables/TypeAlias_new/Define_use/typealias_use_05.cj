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

type Tu = (Float64, Rune)

class A {
    public var a: Tu = (1.2222, r'c')
}

main(): Int64 {
    if (A().a[0] == 1.2222 && A().a[1] == r'c') {
        return 0
    } else {
        return 1
    }
}

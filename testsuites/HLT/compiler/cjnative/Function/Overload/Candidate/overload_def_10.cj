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

main(): Int64 {
    return 0
}

func foo(x: (Int32) -> Int32) {
    return x
}

func foo0(x: (Int32) -> Int32) {
    return x(1)
}

func foo3() {
    func foo0(x: Int32): Int32 {
        return x
    }
}

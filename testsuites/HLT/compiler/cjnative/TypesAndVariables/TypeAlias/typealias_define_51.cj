/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args

interface InterfaceA<T> {
    static func foo(x: T) {
        return x
    }
}

type IA<T> = InterfaceA<T>

main(): Int64 {
    if (IA<Int32>.foo(2) == 2) {
        return 0
    }
    return 1
}

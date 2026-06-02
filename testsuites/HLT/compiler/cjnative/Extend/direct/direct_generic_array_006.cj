/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

extend<T> Array<T> {
    func foo<T>() {
        return this[0]
    }

    func foob<T>(b: T) {
        return b
    }
}

main() {
    return [-1].foo<Int64>() + ["1"].foob(1)
}

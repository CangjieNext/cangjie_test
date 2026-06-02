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

struct R<T> {
    public R(var a: T) {
    }

    public mut func c(b: T) {
        a = b
        return a
    }
}

main() {
    var b = R<Int64>(6)
    b.c(7)
    return b.a - 7
}

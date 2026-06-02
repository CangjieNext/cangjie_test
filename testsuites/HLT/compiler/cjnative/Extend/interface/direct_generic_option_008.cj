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

extend<T> Option<T> <: I<T> {
    public prop pa: T {
        get() {
            match (this) {
                case Some(a) => a
                case None => throw Exception()
            }
        }
    }
}

interface I<T> {
    prop pa: T
}

main() {
    var c = Option<Int64>.Some(3)
    return c.pa - 3
}

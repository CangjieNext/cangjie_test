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

enum A<T> {
    a(T, T, T)

    public prop c: Option<T> {
        get() {
            match (this) {
                case a(x, y, z) => Some<T>(x)
                case _ => None<T>
            }
        }
    }
}

main(): Int64 {
    var i = A.a(1, 2, 3)
    return match (i.c) {
        case Some(res) => res - 1
        case None => -1
    }
}

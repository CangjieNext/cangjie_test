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

main(): Int64 {
    if (B<Data>().a != "abc") {
        return 2
    }
    return 0
}

class B<T> where T <: Base {
    public var b: String = ""
    public var a = T.m
}

interface Base {
    mut static prop m: String {
        get() {
            return "abc"
        }
        set(v) {
        }
    }
}

class Data <: Base {}

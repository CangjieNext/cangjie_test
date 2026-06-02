// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f

class Demo1<T> {
    static var a: Int64
    static init() {
        println("1")
        a = 2
    }
}

class Demo2 {
    static var a: Int64
    static init() {
        println("2")
        a = 2
    }
}

main() {
    0
}

/* SCAN
1
2
*/

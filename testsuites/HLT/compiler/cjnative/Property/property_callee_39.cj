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
    var x = Boo(1)
    if (x.a != 2) {
        return 1
    }
    var y = Boo('a')
    if (y.a != 1) {
        return 1
    }
    var z = Boo("a")
    if (z.a != 1) {
        return 1
    }
    return 0
}

struct Boo {
    public var a: Int32 = 1 // a = 1
    public mut prop m: Int32 {
        get() {
            return a
        }
        set(input) {
            a = input + 1
        }
    }
    public prop n: Int32 {
        get() {
            return a
        }
    }
    public init(x: Int32) {
        m = 1
    }
    public init(x: Rune) {
        n
    }
    public init(x: String) {
        m
    }
}

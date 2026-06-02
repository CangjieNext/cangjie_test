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
    var x = Boo()
    if (x.a != 1) {
        return 1
    }
    if (x.b != 1) {
        return 2
    }

    x.m = 2 // a = 3
    if (x.d != 3) {
        return 4
    }
    if (x.e != 3) {
        return 5
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
    public prop b: Int32 {
        get() {
            return a
        }
    } // a = 1,b = 1
    public prop d: Int32 {
        get() {
            return n
        }
    } // a =3 ,d = 3
    public prop e: Int32 {
        get() {
            return m
        }
    } // a = 3,e = 3
    public init(a!: Int32 = 1) {
        this.a = a
    }
}

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
    if (x.b() != 1) {
        return 2
    }
    if (x.c() != ()) {
        return 3
    }
    if (x.d() != 2) {
        return 4
    }
    if (x.e() != 2) {
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
    public func b(): Int32 {
        return n
    } // a = 1,b = 1
    public mut func c(): Unit {
        m = 1
    } // a = 2,c = ()
    public func d(): Int32 {
        n
    } // a =2 ,d = 2
    public func e(): Int32 {
        m
    } // a = 2,e = 2
    public init() {}
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var d = Doo()
    if (d.m != 2) {
        return 9
    }
    if (d.n != 1) {
        return 10
    }
    return 0
}

open class Boo {
    public var a: Int32 = 1
    public let b: Int32 = 1
    public static var c: Int32 = 1
    public static let d: Int32 = 1
    public mut open prop m: Int32 {
        get() {
            return (this.a + b + c + d)
        }
        set(input) {
            a = input + 1
            c = input + 1
        }
    }

    public open prop n: Int32 {
        get() {
            return ((a + this.b + c + d) * 2)
        }
    }
    public open func foo(): Int32 {
        return 1
    }
}

class Doo <: Boo {
    public mut override prop m: Int32 {
        get() {
            return this.foo()
        }
        set(input) {
            a = input + 2
            c = input + 2
        }
    }
    public override prop n: Int32 {
        get() {
            return super.foo()
        }
    }
    public override func foo(): Int32 {
        return 2
    }
}

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
    var b = Boo(1)

    if (b.m.y != 4) {
        return 1
    }
    if (b.n.y != 8) {
        return 2
    }
    b.m = Boo(1)
    if (b.m.y != 6) {
        return 3
    }
    if (b.n.y != 12) {
        return 4
    }

    return 0
}

open class Boo {
    public var a: Int32 = 1
    public let b: Int32 = 1
    public static var c: Int32 = 1
    public static let d: Int32 = 1
    public var y: Int32 = 0
    public init(x: Int32) {
        y = x
    }
    public mut open prop m: Boo {
        get() {
            return Boo(this.a + b + c + d)
        }
        set(input) { // Boo->Unit
            a = input.a + 1
            c = input.a + 1
        }
    }

    public open prop n: Boo {
        get() {
            return Boo((a + this.b + c + d) * 2)
        }
    }
}

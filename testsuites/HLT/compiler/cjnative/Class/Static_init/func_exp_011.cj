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

open class Base {
    public open func f() {
        "Base"
    }
}

class Derived1 <: Base {
    public func f() {
        "Derived1"
    }
}

class cls {
    static let base2: Base = Derived1()
    static var a: Bool
    static var b: String

    static init() {
        a = 1 is Int64
        var c = match (base2 as Base) {
            case Some(x) => x
            case _ => Base()
        }
        b = c.f()
    }
}

main(): Int64 {
    if (cls.a && cls.b == "Derived1") {
        return 0
    }
    return 1
}

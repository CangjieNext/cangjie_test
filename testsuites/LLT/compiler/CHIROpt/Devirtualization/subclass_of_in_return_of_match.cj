// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %enableDevirtualization -Woff all %f -o %n.%suffix 
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-begin B123
// ASSERT: scan-next A123
// ASSERT: scan-next A123
// ASSERT: scan-next B123
// ASSERT: scan-end

open class A <: ToString {
    public open func toString() {
        "A123"
    }
    public static func ffff(e: Int64) {
        let ff = match (e) {
            case 0x1 => A()
            case 0x3 => B()
            case b => C()
        }
        println("${ff}")
    }
}

class B <: A {
    init() {
    }

    public func toString() {
        "B123"
    }
}

class C <: A {
    public func toString() {
        "c123"
    }
}

func f() {
    3
}

main() {
    var e = f()
    A.ffff(3)
    A.ffff(1)
    A.ffff(1)
    A.ffff(3)
}

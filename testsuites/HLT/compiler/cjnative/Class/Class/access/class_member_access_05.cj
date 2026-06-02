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
    protected var a: Int32 = 2
    public static var b: Int32 = 3
    public init(x: Int32) {
        a = x
    }
    public static func foo(): Int32 {
        return 4
    }
}

class GenRec <: Base {
    public var bb: Int32 = 1
    public init(str: String) {
        super(3)
        this.bb = Base.foo() + super.a + Base.b
    }
}

main(): Int64 {
    var rec = GenRec("hi")
    var res = rec.bb
    print(res.toString())
    if (res == 10) {
        return 0
    }
    return 1
}

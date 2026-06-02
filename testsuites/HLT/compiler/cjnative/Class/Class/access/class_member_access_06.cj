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
    public init(x: Int32) {
        a = x
    }
    public func foo(): Int32 {
        return a
    }
}

class GenRec <: Base {
    public var b: Int32 = 1
    public init(str: String) {
        super(3)
        this.b = super.foo() + super.a
    }
}

main(): Int64 {
    var rec = GenRec("hi")
    var res = rec.b
    print(res.toString()) //打印 rec.b==264。class改成class通过,打印rec.b==2
    if (res == 6) {
        return 0
    }
    return 1
}

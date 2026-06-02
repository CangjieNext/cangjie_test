// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class BaseA {
    public open func get(): Int32 {
        return 1
    }
}

open class BaseB <: BaseA {}

class Data <: BaseB {
    public override func get(): Int32 {
        return a1
    }
    public func set(a: Int32): Unit {
        a1 = a
    }
    public var a0: BaseA = BaseA()
    public var a1: Int32 = 0
    public static var s0: Int64 = 10
}

func run(): Int64 {
    var value: Data = Data()
    var base: BaseA = BaseB()
    value.set(2)
    if (value.get() == 2 && base.get() == 1) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}

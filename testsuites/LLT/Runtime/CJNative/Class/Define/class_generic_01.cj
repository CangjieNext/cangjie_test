// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class Base<T> {
    public var i: Int32 = 2
    public open func foo(): Int32 {
        return 3
    }
    public func getI(): Int32 {
        return i
    }
}

class Test <: Base<Int32> {
    public init() {
        i = getI() + 1
    }
}

class Data<T> <: Base<T> {
    public init() {
        i = getI() + 2
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    var res1: Int32 = test.i
    var res2: Int32 = data.i
    if (res1 == 3 && res2 == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}

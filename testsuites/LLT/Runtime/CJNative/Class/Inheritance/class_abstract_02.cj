// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

abstract class BaseA {
    public func getA(): Int32
}

abstract class BaseB <: BaseA {
    public func getB(): Int32
}

class Data <: BaseB {
    public func getA(): Int32 {
        return 1
    }

    public func getB(): Int32 {
        return 2
    }
}

func run(): Int64 {
    var value: Data = Data()
    if (value.getA() == 1 && value.getB() == 2) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}

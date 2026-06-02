// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface invokeinterface00802m1i {
    func f(i: Int32, f1: Float32, l: Int64, d: Float64, w: Int16, b: Bool): Int32
}

class invokeinterface00802m1c <: invokeinterface00802m1i {
    public func f(i: Int32, f1: Float32, l: Int64, d: Float64, w: Int16, b: Bool): Int32 {
        return 0
    }
}

class invokeinterface00802m1 {
    public static func proc(): Int32 {
        var inf: invokeinterface00802m1i = invokeinterface00802m1c()
        return inf.f(1, 1.0, 1, 1.0, 1, true)
    }
    public static func run(): Int32 {
        return proc()
    }
}

main(): Int64 {
    if (invokeinterface00802m1.run() == 0) {
        return 0
    }
    return 1
}

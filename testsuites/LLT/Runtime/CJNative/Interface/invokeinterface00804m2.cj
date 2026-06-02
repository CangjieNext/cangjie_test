// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface invokeinterface00804m2i {
    func f1(i: Int32): Int32
    func f1(i: Int32, j: Int32): Int32
    func f1(f: Int64, i: Int32): Int32
    func f1(i: Int32, f: Int64): Int32
}

class invokeinterface00804m2c <: invokeinterface00804m2i {
    public func f1(i: Int32): Int32 {
        return 2// fail
    }
    public func f1(i: Int32, j: Int32): Int32 {
        return 2 // fail
    }
    public func f1(f: Int64, i: Int32): Int32 {
        return 2 // fail
    }
    public func f1(i: Int32, f: Int64): Int32 {
        return 0 // pass
    }
}

class invokeinterface00804m2 {
    public static func run(): Int32 {
        var inf: invokeinterface00804m2i = invokeinterface00804m2c()
        return inf.f1(1, Int64(1))
    }
}

main(): Int64 {
    if (invokeinterface00804m2.run() == 0) {
        return 0
    }
    return 1
}

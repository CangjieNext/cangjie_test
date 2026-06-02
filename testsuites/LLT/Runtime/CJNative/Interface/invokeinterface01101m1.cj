// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface invokeinterface01101m1i {
    func f1(i: Int32, f: Float32): Unit
}

class invokeinterface01101m1c <: invokeinterface01101m1i {
    public func f1(i: Int32, f: Float32): Unit {
    }
}

class invokeinterface01101m1 {
    public static var ret_flag: Int32 = 0
    public static func proc(): Unit {
        var inf: invokeinterface01101m1i = invokeinterface01101m1c()
        inf.f1(1, 1.0)
        ret_flag = 1
    }
    public static func run(): Int32 {
        proc()
        return ret_flag
    }
}

main(): Int64 {
    if (invokeinterface01101m1.run() == 1) {
        return 0
    }
    return 1
}

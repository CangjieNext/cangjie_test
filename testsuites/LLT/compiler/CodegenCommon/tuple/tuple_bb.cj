// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// EXEC-0: %run %run_opt %output %run_args

public open class Class_1 {}

public func func_1() { // block id: 262
    let var_1: UInt64 = UInt64(32);
    func func_3(): Option<UInt64> { // block id: 280
        match (if ((true, (109..-110))[0]) {
            Class_1()
        }) {
            case _ => var_1
        }
    }
    (Option<UInt64>.None ?? (func_3() ?? UInt64(69)));
}

main(): Int64 {
    func func_2() { // block id: 64
        func_1()
    }
    func_2()
    return 0
}

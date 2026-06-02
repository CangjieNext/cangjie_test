/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 

abstract class Base {
    public func getA(): Int32
    public static func getB(): Int32 {
        return 2
    }
}

class Data <: Base {
    public func getA(): Int32 {
        return Base.getB() + 1
    }
}

func run(): Int64 {
    var value: Data = Data()
    if (value.getA() != 3) {
        return 1
    }
    if (Base.getB() != 2) {
        return 2
    }
    return 0
}

main(): Int64 {
    return run()
}

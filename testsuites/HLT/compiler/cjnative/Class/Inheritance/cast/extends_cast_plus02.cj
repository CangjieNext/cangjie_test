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

abstract class Base2 {
    public func getB(): Int32
}

interface Inday2 {
    func getB(): Int32
}

class Data2 <: Base2 & Inday2 {
    public func getB(): Int32 {
        var one: Int32 = 3
        return one
    }
}

func run(): Int64 {
    var t3: Int32 = Data2().getB()
    if (t3 == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}

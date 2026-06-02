/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface Inday1 {
    func getA(): Int64
}

interface Inday2 {
    func getA(): Int32
}

class Data3 <: Inday1 & Inday2 {
    public func getA(): Int32 {
        var one: Int32 = 3
        return one
    }
    public func getA(): Int64 {
        var one: Int64 = 4
        return one
    }
}

func run(): Int64 {
    var t: Int32 = Data3().getA()
    if (t == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_overload_conflicts

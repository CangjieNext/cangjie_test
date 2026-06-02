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
interface I0 {
    func F0(): Int64 {
        return 1
    }
}

interface I1 <: I0 {
    func F0(): Int64 {
        return 0
    }
}

class C <: I1 {}

main(): Int64 {
    var a = C().F0()
    return C().F0()
}

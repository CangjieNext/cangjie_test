/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: macro_def.cj
// EXEC: %compiler %cmp_macro macro_def.cj
// EXEC: %run_macro %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output %run_macro_opt %run_args
import define.*

interface I {
    func f(@M(1)): Int64
}

class C <: I {
    public func f(a: Int64, b: Int64): Int64 {
        return a + b
    }
}

main() {
    var x = C()
    return x.f(1, 0) - 1
}

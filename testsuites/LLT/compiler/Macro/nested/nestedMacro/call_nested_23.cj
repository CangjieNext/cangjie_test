// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroFoo.cj
// EXEC: %compiler %cmp_macro macroFoo.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 

import pkg1.*

@M[1]
abstract class Base {
    @M[1]
    public func getA(): Int32
    @M[1]
    public func getB(): Int32
    @M[1]
    public func getC(): Int32
}

class Data <: Base {
    public func getA(): Int32 {
        return 1
    }

    public func getB(): Int32 {
        return 2
    }

    public func getC(): Int32 {
        return 3
    }
}

main(): Int64 {
    let data = Data()
    if (data.getA() != 1 || data.getB() != 2 || data.getC() != 3) {
        return 1
    }
    0
}

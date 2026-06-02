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

open class Base {
    protected open func foo(parm1: Int64): Int64 {
        let ret = parm1 + 1
        return ret
    }
}

class Data <: Base {
    protected func foo(parm1: Int64): Int64 {
        let ret = parm1 + 2
        return ret
    }
}

main() {
    return Base().foo(1) + Data().foo(1) - 5
}

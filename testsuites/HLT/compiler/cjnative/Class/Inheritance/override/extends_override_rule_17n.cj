/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f -o %output 2>&1 | compare %f

open class Base {
    protected open func foo(parm1: Int32): Int32 {
        return 3
    }
}

class Data <: Base {
    protected override func foo(parm1: Int16): Int32 {
        return 4
    }
}
// ASSERT: scan sema_missing_overridden_func

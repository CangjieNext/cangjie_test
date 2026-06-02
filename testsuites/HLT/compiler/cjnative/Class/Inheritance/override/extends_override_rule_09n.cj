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
    protected open func foo(parm1: Moon): Int32 {
        let ret = parm1.getFoo() + 1
        return ret
    }
}

class Data <: Base {
    protected override func foo(parm1: Sun): Int32 {
        let ret = parm1.getFoo() + 2
        return ret
    }
}

open class Sun {
    protected open func getFoo() {
        return 2
    }
}

class Moon <: Sun {}
// ASSERT: scan sema_mismatched_types
// ASSERT: scan sema_missing_overridden_func

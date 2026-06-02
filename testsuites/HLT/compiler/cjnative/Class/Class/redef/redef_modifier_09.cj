/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    return 0
}

open class Boo {
    public open func foo() {
        return 1
    }
}

class Coo <: Boo {
    public redef func foo() {
        return 2
    }
}
// ASSERT: scan sema_func_no_override_or_redefine_modifier
// ASSERT: scan sema_redef_modify_static_func

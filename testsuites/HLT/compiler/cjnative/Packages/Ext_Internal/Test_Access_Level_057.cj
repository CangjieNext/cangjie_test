/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

open class Base {
    protected var value = "baseClass"
}

public open class subclass <: Base {
    private var value = "subClass"
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_member_variable_can_not_shadow

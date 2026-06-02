/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

interface I0 {
    func F0(): Int32 {
        return 1
    }
}

interface I1 <: I0 {
    override func F1(): Int32 {
        return 1
    }
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_missing_overridden_func

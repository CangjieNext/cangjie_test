/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

abstract class Base {
    private func inc(value: Int32): Int32 {
        return value + 1
    }
}

class Data <: Base {
    public func get(): Int32 {
        return inc(1)
    }
}
// ASSERT: scan sema_no_match_function_declaration_for_call

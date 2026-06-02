/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt  %compile_lib_opt %f 2>&1 | compare %f
class Data {
    public func f(): Int32 {
        return 1
    }
}

class Base <: Data {
    public static func get(): Int32 {
        func a(): Int32 {
            return f()
        }
        return a()
    }
}
// ASSERT: scan sema_non_inheritable_super_class
// ASSERT: scan sema_static_function_cannot_access_non_static_member

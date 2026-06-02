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
    B<Int32>.foo(1)
    return 0
}

class B<T> {
    public static func foo(x: Int32) {
        return 1
    }
    public static func foo(x: T) {
        return 2
    }
}
// ASSERT: scan sema_generic_instantiation_causes_ambiguous_functions
// ASSERT: scan sema_ambiguous_match

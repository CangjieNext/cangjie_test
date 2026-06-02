/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
//EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class C {
    public func test(): This {
        this
    }
    public var b: C
    public var c = [test(), b]
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_illegal_usage_of_member
// ASSERT: scan sema_class_uninitialized_field

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

public class Base {
    public var one: Int32 = 1
}

class Data <: Base {
    public var res: Int32 = one
}

main() {
    return 0
}
// ASSERT: scan sema_non_inheritable_super_class
// ASSERT: scan sema_illegal_usage_of_super_member

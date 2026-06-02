/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class Father {
    public open func test(a: Int32): Int64 {
        return 2
    }
    public open func test(a: Int16): Int64 {
        return 1
    }
}

class Child <: Father {
    public func result(): Int64 {
        return test(1)
    }
}

main() {
    if (Child().result() == 2) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_ignore_open
// ASSERT: scan sema_non_inheritable_super_class
// ASSERT: scan sema_ambiguous_match

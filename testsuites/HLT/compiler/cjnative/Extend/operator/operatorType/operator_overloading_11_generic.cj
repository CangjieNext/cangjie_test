/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    1
}

extend<T> Array<T> {
    public operator func ==(that: Array<T>): Bool {
        return true
    }
}
// ASSERT: scan sema_inherit_member_kind_inconsistent

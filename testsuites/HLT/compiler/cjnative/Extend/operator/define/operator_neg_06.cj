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

interface I {
    operator func ==(right: Rune): Bool
}

extend Int8 <: I {
    public operator func ==(right: Bool): Bool {
        true
    }
}
// ASSERT: scan sema_need_member_implementation

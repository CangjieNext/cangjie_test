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
    return 0
}

type S = String

extend S {
    public prop isEmpty: Int32 {
        get() {
            return 1
        }
    }
}
// ASSERT: scan sema_extend_member_cannot_shadow

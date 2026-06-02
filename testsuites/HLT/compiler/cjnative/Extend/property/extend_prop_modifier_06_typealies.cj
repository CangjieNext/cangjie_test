/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



main() : Int64 {
    return 0
}

type S= String
extend S {
    public open mut prop m: Int32 {
        get() {
            return 2
        }
        set(v){}
    }
    public override prop isEmpty: Int32 {
        get() {
            return 1
        }
    }
}
// ASSERT: scan parse_illegal_modifier_in_scope

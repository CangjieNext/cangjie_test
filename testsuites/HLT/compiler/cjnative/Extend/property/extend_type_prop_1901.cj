/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output



main() : Int64 {
    return 0
}

extend This {
    public static mut prop ms: Int64 {
        get() {
            return 4
        }
        set(v){}
    }
    public static prop ns: Int64 {
        get() {
            return 3
        }
    }
}
// ASSERT: scan parse_this_type_not_allow

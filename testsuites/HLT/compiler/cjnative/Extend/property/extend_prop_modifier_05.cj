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

extend String {
    public static redef mut prop join: Int32 {
        get() {
            return 2
        }
        set(v){}
    }
}
// ASSERT: scan parse_illegal_modifier_in_scope

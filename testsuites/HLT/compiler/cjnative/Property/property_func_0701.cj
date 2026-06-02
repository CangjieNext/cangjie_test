/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class Coo {
    public mut prop a: Int64 {
        get() {
            return b * 2
        }
        set(v) {
            b = v + 1
        }
    }
    public var b: Int64
    public init() {
        b = a
    }
}

main(): Int64 {
    // Coo().b -> b=a -> get() -> return b*2
    Coo().b
    return 0
}
// ASSERT: scan sema_illegal_usage_of_member

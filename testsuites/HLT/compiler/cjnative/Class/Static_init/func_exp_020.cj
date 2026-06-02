/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_type_uninitialized_static_field

struct rec {
    static var a: Int64
    static init() {
        for (num in 1..3) {
            if (num == 2) {
                continue
            }
            a = num
        }
    }
}

main(): Int64 {
    if (rec.a == 1) {
        return 0
    }
    return 1
}

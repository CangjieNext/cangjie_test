/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    var a: () -> Int64 = {=> 1}
    return 0
}

type B<T> = () -> T

extend<T> B<T> {
    public mut prop m: Int64 {
        get() {
            return 2
        }
        set(v) {}
    }
    public prop n: Int64 {
        get() {
            return 1
        }
    }
}
// ASSERT: scan sema_illegal_extended_type
// ASSERT: scan sema_immutable_type_illegal_property

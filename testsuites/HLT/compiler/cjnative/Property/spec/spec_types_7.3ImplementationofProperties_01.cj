/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class Foo {
    public mut prop a: Int64 {
        get() { // () -> Int64
            return "123"
        }
        set(v) { // (Int64) -> Unit
            return 123
        }
    }
    public mut prop b: Int64 {
        get() {
            123 // ok, return 123
        }
        set(v) {
            return () // ok, return unit
        }
    }
}

main() {
    return 0
}
// ASSERT: scan sema_mismatched_types
// ASSERT: scan sema_cannot_convert_literal

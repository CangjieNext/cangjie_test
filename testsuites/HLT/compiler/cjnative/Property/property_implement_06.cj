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
    return 0
}

struct Boo {
    public var a: Int32 = 1
    public mut prop m1: Int32 {
        get() {
            return 1
        }
        set(input) {
            a = input + 1
            return 1
        }
    }
    public mut prop m2: Int32 {
        get() {
            return 1
        }
        set(input) {
            a = input + 1
            if (true) {
                return 1
            }
        }
    }
    public mut prop m3: Int32 {
        get() {
            return 1
        }
        set(input) {
            a = input + 1
            match (a) {
                case _ => 1
            }
        }
    }
}
// ASSERT: scan sema_cannot_convert_literal

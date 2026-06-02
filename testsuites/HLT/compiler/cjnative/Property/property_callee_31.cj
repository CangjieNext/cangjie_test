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
    public mut prop m: Int32 {
        get() {
            return a
        }
        set(input) {
            a = input + 1
        }
    }
    public prop n: Int32 {
        get() {
            return a
        }
    }
    public var a: Int32 = 1 // a = 1
    public var b: Int32 = n
    public var c: Unit = (m = 1) // a = 2,c = () 
    public var d: Int32 = n // a =2 ,d = 2 
    public var e: Int32 = m // a = 2,e = 2 
}
// ASSERT: scan sema_illegal_usage_of_member

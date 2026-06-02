/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output

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
            if (true) {
                var a = 1
            }
        }
    }
    public mut prop m2: Int32 {
        get() {
            return 1
        }
        set(input) {
            a = input + 1
            if (true) {
                return ()
            }
        }
    }
    public mut prop m3: Int32 {
        get() {
            return 1
        }
        set(input) {
            a = input + 1
            func foo() {
                return 1
            }
        }
    }
    public mut prop m4: Int32 {
        get() {
            return 1
        }
        set(input) {
            a = input + 1
            match (a) {
                case _ => ()
            }
        }
    }
}

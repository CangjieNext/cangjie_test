/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    if (Boo.a != 2) {
        return 1
    }
    if (Boo.b != 1) {
        return 2
    }
    if (Boo.c != ()) {
        return 3
    }
    if (Boo.d != 2) {
        return 4
    }
    if (Boo.e != 2) {
        return 5
    }
    return 0
}

struct Boo {
    public mut static prop m: Int32 {
        get() {
            return a
        }
        set(input) {
            a = input + 1
        }
    }
    public static prop n: Int32 {
        get() {
            return a
        }
    }
    public static var a: Int32 = 1 // a = 1
    public static var b: Int32 = n // a = 1,b = 1
    public static var c: Unit = (m = 1) // a = 2,c = ()
    public static var d: Int32 = n // a =2 ,d = 2
    public static var e: Int32 = m // a = 2,e = 2
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    if (C3.foo() != "abcabc" || C2.goo() != "xyzxyz") {
        return 1
    }
    return 0
}

open class C1 {
    public static func foo() {
        return "abc"
    }
    public static func goo() {
        return "xyz"
    }
}

open class C2 <: C1 {
    public static redef func goo() {
        return "xyzxyz"
    }
}

class C3 <: C1 {
    public static redef func foo() {
        return "abcabc"
    }
}

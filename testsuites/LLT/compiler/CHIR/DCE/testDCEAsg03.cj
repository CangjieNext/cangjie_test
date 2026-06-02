// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex testDCEAsg03.cj:18

class A <: Exception {}

class B <: Exception {}

struct C {
    public static var a: Int64 = if (true) {
        throw A();
        1
    } else {
        1
    }
    public static var b: Int64 = a
}

main() {
    try {
        C();
        ()
    } catch (a: Exception) {
        a.printStackTrace()
        print("success")
    }
    return 0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Exception {}

class B <: Exception {}

struct C {
    public var i:Int64 = 0
}

extend C {
    public mut func f():Unit {
        throw A();
        i += 1
    }
}

main() {
    try {
        var c = C()
        c.f();
        ()
    } catch (a: A) {
        print("success")
    }
    return 0
}

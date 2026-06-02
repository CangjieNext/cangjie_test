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

class C {}

extend C {
    public mut prop c: Int64 {
        get() {
            throw A();
            1
        }
        set(v) {
            throw A();
            ()
        }
    }
}

main() {
    try {
        C().c;
        ()
    } catch (a: A) {
        print("success")
    } finally {
        return 0
    }
    return 5
}

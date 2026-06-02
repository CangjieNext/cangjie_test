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

class A {
    public prop i: Int64 {
        get() {
            return 0
        }
    }
}

struct B {
    public prop i: Int64 {
        get() {
            return 0
        }
    }
}

enum C {
    Date

    public prop i: Int64 {
        get() {
            return 0
        }
    }
}

extend A {
    public prop s: String {
        get() {
            return ""
        }
    }
}

main() {
    return 0
}

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

struct Roo {
    private prop a: Int64 {
        get() {
            return 0
        }
    }
    public prop c: Int64 {
        get() {
            return 0
        }
    }
    public mut prop d: Int64 {
        get() {
            return a
        }
        set(v) {}
    }
}

main(): Int64 {
    if (Roo().c != 0) {
        return 1
    }
    if (Roo().d != 0) {
        return 1
    }
    return 0
}

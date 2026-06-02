/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class A <: Exception {}

class B {
    public var b_:Int64 = 0
    public mut prop b: Int64 {
        get() {
            try {
                return b_
            } catch (_) {
                return 2
            } finally {
                return 0
            }
        }
        set(v) {
            try {
                this.b_ = v
            } catch (_) {} finally {}
        }
    }
}

main() {
    B().b = 0
    B().b
}

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

open class A {
    private static var valueY = 0

    @Deprecated
    public mut static prop y: Int64 {
        get() {
            valueY
        }
        set(v) {
            valueY = v
        }
    }
}

class C <: A {
    private static var valueY2 = 0

    @Deprecated
    public mut static redef prop y: Int64 {
        get() {
            valueY2
        }
        set(v) {
            valueY2 = v
        }
    }
}

main() {}

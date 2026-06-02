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

open class Foo {
    private prop a: Int64 {
        get() {
            return 0
        }
    }
    protected prop b: Int64 {
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
            return 0
        }
        set(v) {}
    }
}

class Coo <: Foo {
    public var a: Int64 = 1
    public var m: Int64 = 1
    public init() {
        super()
        a = b
        d = 2
        m = d
    }
}

main(): Int64 {
    if (Coo().a != 0) {
        return 1
    }
    if (Coo().m != 0) {
        return 1
    }
    return 0
}

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

open class Base {
    protected var a: Int32 = 2
    protected init(x: Int32) {
        a = x
    }
}

class Data <: Base {
    public var b: Int32
    public init() {
        super(3)
        b = super.a
    }
}

main(): Int64 {
    var data1 = Data()
    if (data1.b == 3) {
        return 0
    }
    return 1
}

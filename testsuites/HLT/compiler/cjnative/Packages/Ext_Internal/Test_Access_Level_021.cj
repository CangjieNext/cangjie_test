/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

public open class A {
    public var pub: Int32 = 1
    protected var pro: Int32 = 10
    private var pri: Int32 = 100
}

public class ex_B <: A {
    public var a1: Int32
    public var a2: Int32
    public init() {
        a1 = pub
        a2 = pro
    }
}

class in_C <: A {
    public var b1: Int32
    public var b2: Int32
    public init() {
        b1 = pub
        b2 = pro
    }
}

main(): Int64 {
    var B_Class: ex_B = ex_B()

    if (B_Class.a1 != 1 || B_Class.a2 != 10) {
        return 1
    }

    var C_Class: in_C = in_C()

    if (C_Class.b1 != 1 || C_Class.b2 != 10) {
        return 1
    }

    return 0
}

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

open class A {
    public var pub: Int32 = 1
    protected var pro: Int32 = 10
    private var pri: Int32 = 100
}

class B <: A {
    public var a1: Int32
    public var a2: Int32

    protected var b1: Int32
    protected var b2: Int32

    public func getpro1(): Int32 {
        return b1
    }
    public func getpro2(): Int32 {
        return b2
    }

    private var c1: Int32
    private var c2: Int32

    public func getpri1(): Int32 {
        return c1
    }
    public func getpri2(): Int32 {
        return c2
    }

    public init() {
        a1 = pub
        a2 = pro

        b1 = pub
        b2 = pro

        c1 = pub
        c2 = pro
    }
}

main(): Int64 {
    var newClass: B = B()

    if (newClass.a1 != 1 || newClass.a2 != 10) {
        return 1
    }

    if (newClass.getpro1() != 1 || newClass.getpro2() != 10) {
        return 1
    }

    if (newClass.getpri1() != 1 || newClass.getpri2() != 10) {
        return 1
    }

    return 0
}

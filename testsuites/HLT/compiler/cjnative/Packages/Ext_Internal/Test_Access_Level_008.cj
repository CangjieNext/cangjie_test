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

    public var a1 = pub
    public var a2 = pro
    public var a3 = pri

    protected var b1 = pub
    protected var b2 = pro
    protected var b3 = pri

    public func getpro1(): Int32 {
        return b1
    }
    public func getpro2(): Int32 {
        return b2
    }
    public func getpro3(): Int32 {
        return b3
    }

    private var c1 = pub
    private var c2 = pro
    private var c3 = pri

    public func getpri1(): Int32 {
        return c1
    }
    public func getpri2(): Int32 {
        return c2
    }
    public func getpri3(): Int32 {
        return c3
    }
}

main(): Int64 {
    var newClass: A = A()

    if (newClass.a1 != 1 || newClass.a2 != 10 || newClass.a3 != 100) {
        return 1
    }

    if (newClass.getpro1() != 1 || newClass.getpro2() != 10 || newClass.getpro3() != 100) {
        return 1
    }

    if (newClass.getpri1() != 1 || newClass.getpri2() != 10 || newClass.getpri3() != 100) {
        return 1
    }

    return 0
}

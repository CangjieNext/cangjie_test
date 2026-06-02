/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface I {}

interface I2 {
    func infi(): Int32
}

open class ClassC {
    public var b: Int32 = 0
}

class ClassA <: ClassC & I & I2 {
    public func infi(): Int32 {
        return 0
    }
}

class ClassB <: ClassC & I & I2 {
    public var c: Int32 = 10
    public func infi(): Int32 {
        return 1
    }
}

class ClassD <: ClassC & I & I2 {
    public var d: Int64 = 20
    public var f: UInt64 = 30
    public func infi(): Int32 {
        return 2
    }
}

main(): Int64 {
    var a = ClassA()
    var b = ClassB()
    let arr0: Array<ClassC> = [a, b, ClassD()]
    let arr1: Array<I2> = [a, b, ClassD()]
    if (arr0[1].b == 0 && arr1[2].infi() == 2) {
        return 0
    }
    return 1
}

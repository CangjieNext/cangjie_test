/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan sema_upper_bound_must_be_class_or_interface

class Aoo<T, V> where T <: V & I1, V <: I2 {
    public var a: T
    public init(x: T) {
        a = x
    }
}

interface I1 {
    func a() {
        return 1
    }
}

interface I2 {
    func b() {
        return 1
    }
}

interface I3 <: I1 & I2 {
    func b() {
        return 1
    }
}

class C1 <: I1 & I3 {
    public var c: Int64 = 1
    public func a() {
        return 1
    }
}

main() {
    var a = Aoo<C1, I3>(C1())
    if (a.a.c != 1) {
        return 1
    }
    return 0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan Compatible!
package test_stable_abi

public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public interface I1 {
    mut prop p1: Int64 {
        get() {1}
        set(v) {v}
    }
    static mut prop p2: Int64 {
        get() {1}
        set(v) {v}
    }
}
public interface I2 {
    mut prop p1: Int64
    static mut prop p2: Int64
}
public class C1 <: I1 {}
public func f() {
    assert(C1.p2, 1)
}

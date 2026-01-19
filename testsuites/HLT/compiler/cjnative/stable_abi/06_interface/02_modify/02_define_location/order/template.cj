/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

public func assert<T>(exp: T, act: T): Unit where T <: Equatable<T> & ToString {
    if (exp != act) { throw Exception("${exp} != ${act}") }
}
public interface I1 {
    static mut prop p1: Int64 {
        get() {1}
        set(v) {v}
    }
    mut prop p2: Int64 {
        get() {1}
        set(v) {v}
    }
}
public interface I2 {
    static mut prop p1: Int64 {
        get() {1}
        set(v) {v}
    }
    mut prop p2: Int64 {
        get() {1}
        set(v) {v}
    }
}
public interface I3 {
    static mut prop p1: Int64 {
        get() {1}
        set(v) {v}
    }
    mut prop p2: Int64 {
        get() {1}
        set(v) {v}
    }
}
public interface I4 {
    static mut prop p1: Int64 {
        get() {1}
        set(v) {v}
    }
    mut prop p2: Int64 {
        get() {1}
        set(v) {v}
    }
}
public class C1 <: I1 {}
public class C2 <: I2 {}
public class C3 <: I3 {}
public class C4 <: I4 {}

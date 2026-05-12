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
    static mut prop p1: Int64 {
        get() {1}
        set(v) {v}
    }
    mut prop p2: Int64 {
        get() {1}
        set(v) {v}
    }
    @Deprecated["deprecated", strict: false]
    static mut prop p3: Int64 {
        get() {1}
        set(v) {v}
    }
    @Deprecated["deprecated", strict: false]
    mut prop p4: Int64 {
        get() {1}
        set(v) {v}
    }
    @Deprecated["deprecated", strict: true]
    static mut prop p5: Int64 {
        get() {1}
        set(v) {v}
    }
    @Deprecated["deprecated", strict: true]
    mut prop p6: Int64 {
        get() {1}
        set(v) {v}
    }
}
public interface I2 {
    static mut prop p1: Int64
    mut prop p2: Int64
    @Deprecated["deprecated", strict: false]
    static mut prop p3: Int64
    @Deprecated["deprecated", strict: false]
    mut prop p4: Int64
    @Deprecated["deprecated", strict: true]
    static mut prop p5: Int64
    @Deprecated["deprecated", strict: true]
    mut prop p6: Int64
}
public class C1 <: I1 {}
public class C2 <: I2 {
    public static mut prop p1: Int64 {
        get() {1}
        set(v) {v}
    }
    public mut prop p2: Int64 {
        get() {1}
        set(v) {v}
    }
    @Deprecated["deprecated", strict: false]
    public static mut prop p3: Int64 {
        get() {1}
        set(v) {v}
    }
    @Deprecated["deprecated", strict: false]
    public mut prop p4: Int64 {
        get() {1}
        set(v) {v}
    }
    @Deprecated["deprecated", strict: true]
    public static mut prop p5: Int64 {
        get() {1}
        set(v) {v}
    }
    @Deprecated["deprecated", strict: true]
    public mut prop p6: Int64 {
        get() {1}
        set(v) {v}
    }
}
public func f() {}

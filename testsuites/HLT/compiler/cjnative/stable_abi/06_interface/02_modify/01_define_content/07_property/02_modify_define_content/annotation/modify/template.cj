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
@Annotation
public class Version1 {
    let code: String
    const init(code: String) { this.code = code }
}
@Annotation
public class Version2 {
    let code: String
    const init(code: String) { this.code = code }
}
public interface I {
    @Version1["1"]
    static mut prop p1: Int64 {
        get() {1}
        set(v) {v}
    }
    @Version1["1"]
    mut prop p2: Int64 {
        get() {1}
        set(v) {v}
    }
    @Version1["1"]
    static mut prop p3: Int64
    @Version1["1"]
    mut prop p4: Int64
}
public class C <: I {
    public static mut prop p3: Int64 {
        get() {1}
        set(v) {v}
    }
    public mut prop p4: Int64 {
        get() {1}
        set(v) {v}
    }
}

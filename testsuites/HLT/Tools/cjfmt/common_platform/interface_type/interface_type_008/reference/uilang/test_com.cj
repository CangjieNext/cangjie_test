/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

common public interface I1 {
    common public func f(a: Int64) {
        a
    }
    common public static func g(a: Int64) {
        a
    }
    common public func f1(a: Int64): Unit
    common public static func g1(a: Int64): Unit
}

common public interface I2 <: I1 {
    common public override func f(a: Int64) {
        a + 1
    }
    common public static redef func g(a: Int64) {
        a + 1
    }
    common public override func f1(a: Int64): Unit {}
    common public static redef func g1(a: Int64): Unit {}
}

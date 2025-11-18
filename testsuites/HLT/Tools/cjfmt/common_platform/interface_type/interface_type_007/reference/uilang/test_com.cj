/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

common public interface Addable {
    common public func add(other: Int64): Int64
}

common public interface Subtractable {
    common public func sub(other: Int64): Int64
}

common public interface Calculable <: Addable & Subtractable {
    common public func mul(other: Int64): Int64
    common public func div(other: Int64): Int64
}

common public class MyInt <: Calculable {
    var value = 0
    common public func add(other: Int64): Int64 {
        value + other
    }
    common public func sub(other: Int64): Int64 {
        value - other
    }
    common public func mul(other: Int64): Int64 {
        value * other
    }
    common public func div(other: Int64): Int64 {
        value / other
    }
}

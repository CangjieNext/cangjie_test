/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

specific public interface Addable {
    specific public func add(other: Int64): Int64 {
        value + other
    }
}

specific public interface Subtractable {
    specific public func sub(other: Int64): Int64 {
        value - other
    }
}

specific public interface Calculable <: Addable & Subtractable {
    specific public func mul(other: Int64): Int64 {
        value * other
    }
    specific public func div(other: Int64): Int64 {
        value / other
    }
}

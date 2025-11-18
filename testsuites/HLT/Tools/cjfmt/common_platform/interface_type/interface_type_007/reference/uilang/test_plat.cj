/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

platform public interface Addable {
    platform public func add(other: Int64): Int64 {
        value + other
    }
}

platform public interface Subtractable {
    platform public func sub(other: Int64): Int64 {
        value - other
    }
}

platform public interface Calculable <: Addable & Subtractable {
    platform public func mul(other: Int64): Int64 {
        value * other
    }
    platform public func div(other: Int64): Int64 {
        value / other
    }
}

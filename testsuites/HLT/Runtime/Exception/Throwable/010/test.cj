/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package test

public func bar(a1: Int64, a2: Int32, a3: Int16, a4: Int8, a5: UInt64, a6: UInt32, a7: UInt16, a8: UInt8, a9: Float16,
    a10: Float32, a11: Float64, a12: String, a13: Rune, a14: Bool): Unit {
    if (a1 < 100) {
        bar(a1 + 1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14)
    } else {
        throw Exception()
    }
    return
}

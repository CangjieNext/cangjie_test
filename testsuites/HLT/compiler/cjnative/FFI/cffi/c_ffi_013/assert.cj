/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.math.*

func assertEquals(actual: Int32, expected: Int32) {
    if (actual != expected) {
        throw Exception("${actual} ${expected} not equal")
    }
}

func assertEquals(actual: Int64, expected: Int64) {
    if (actual != expected) {
        throw Exception("${actual} ${expected} not equal")
    }
}

func assertEquals(actual: Float64, expected: Float64) {
    if (abs(actual - expected) > 1e-16) {
        throw Exception("${actual} ${expected} not equal")
    }
}

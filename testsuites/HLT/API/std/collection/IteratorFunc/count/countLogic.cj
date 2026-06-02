/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
public func testIterableCount<T>(itT1: Iterable<T>, resultExpect: Int64): Int64 {
    var result = count<T>(itT1)
    if (result != resultExpect) {
        return 1
    }
    return 0
}

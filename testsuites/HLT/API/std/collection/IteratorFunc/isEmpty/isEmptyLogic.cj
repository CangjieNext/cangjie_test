/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
public func testIterableIsEmpty<T>(itT1: Iterable<T>, resultExpect: Bool): Int64 {
    var result = isEmpty<T>(itT1)
    if (result != resultExpect) {
        return 1
    }
    return 0
}

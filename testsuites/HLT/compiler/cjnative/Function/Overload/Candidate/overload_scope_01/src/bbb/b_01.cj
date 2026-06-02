/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package bbb

public func foo(x: Int32) {
    return 10
}

public func foo(x: Int64) {
    return 20
}

public func foo(x: Int64, y: String) {
    return 30
}

func foo(x: Int64, y: Rune) {
    return 40
}

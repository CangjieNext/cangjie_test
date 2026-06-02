/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkga

public func Data<T, V>(x: T, y: V): T {
    let width: T = x
    let length: V = y
    return width
}

public func Data(x: Int64, y: String): Int64 {
    let width: Int64 = x
    let length: String = y
    return width * 2
}

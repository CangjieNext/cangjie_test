/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package demo.boo

internal import demo.aoo.*

public let two: Int32 = 2

public func bb(): Unit {
    aa()
    println("func bb")
}

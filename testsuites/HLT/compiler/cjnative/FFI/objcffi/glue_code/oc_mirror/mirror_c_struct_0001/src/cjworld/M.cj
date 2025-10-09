/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cjworld
 
import interoplib.objc.*

@C
public struct Point {
    var x: Int32 = 0
    var y: Int32 = 0
}

@ObjCMirror
public open class M {
    public init()
    public open func goo(): Point
}

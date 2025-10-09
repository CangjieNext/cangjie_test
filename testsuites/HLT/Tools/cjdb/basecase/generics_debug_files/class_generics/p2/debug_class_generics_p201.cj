/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package p2
import p1.*

public open class C201<T> { //单参泛型
    // 成员变量
    public var width: T
    public var length: T

    // 构造函数
    public init (side: T) {
        this(side, side)
    }
    public init (width: T, length: T) {
        this.width = width
        this.length = length
    }
}

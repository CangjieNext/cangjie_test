/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package p1

public open class C101<T1,T2>{
    public var width: T1
    public var length: T2

    public init (width: T1, length: T2) {
        this.width = width
        this.length = length
    }
}

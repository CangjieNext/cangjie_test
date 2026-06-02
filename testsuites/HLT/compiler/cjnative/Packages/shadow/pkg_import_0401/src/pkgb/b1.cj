/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkgb

class Boo1 <: Minus<Boo1> {
    public func minus(other: Boo1): Boo1 {
        return this
    }
}

interface Minus<T> {
    func minus(other: T): T
}

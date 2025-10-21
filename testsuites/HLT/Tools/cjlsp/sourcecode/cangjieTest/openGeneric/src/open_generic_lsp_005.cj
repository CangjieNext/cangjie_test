/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package openGeneric

open class Base05 {
    public open func f2<T1, T2>(a: T1, b: T2): Unit {}
}

class Sub05 <: Base05 {
    public override func f2<U1, U2>(a: U1, b: U2): Unit {}
}

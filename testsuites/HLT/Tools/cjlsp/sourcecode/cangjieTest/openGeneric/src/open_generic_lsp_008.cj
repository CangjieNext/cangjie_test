/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package openGeneric

interface I08 {
    func f1<T>(a: T): Unit
}

abstract class Base08 {
    protected func f1<U>(b: U): I08 where U <: I08
}

abstract class Sub08 <: Base08 {
    protected override func f1<T1, U>(x: T1, y: U): I08 where T1 <: I08
}

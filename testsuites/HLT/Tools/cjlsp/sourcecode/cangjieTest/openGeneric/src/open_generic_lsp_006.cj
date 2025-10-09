/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package openGeneric

interface I06 {
    func f1<T>(a: T): Unit
}

abstract class Base06 {
    protected func f1<U>(b: U): I06 where U <: I06
}

abstract class Sub06 <: Base06 {
    protected func f1<T1>(x: T1): I06 where T1 <: I06
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package openGeneric

interface Bar14 {
    func bar<T>(a: T): Unit
}

enum Eoo14 <: Bar14 {
    | Red | Green | Blue

    public func bar<T>(a: T): Unit {}
}

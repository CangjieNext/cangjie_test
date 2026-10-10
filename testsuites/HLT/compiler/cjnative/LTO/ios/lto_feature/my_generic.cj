// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package my_generic
public func identity<T>(x: T): T {
    return x
}
public func swap<T>(a: T, b: T): (T, T) {
    return (b, a)
}
public func firstElement<T>(arr: Array<T>): T {
    return arr[0]
}
public func deadGenericFunc(): String {
    return "dead"
}

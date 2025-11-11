/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp
public class A<T> {
    var a: T
    var b: T
    public init(a: T, b: T) {
        this.a = a
        this.b = b
    }
}
common extend <T> A<T> {
    public common mut prop p1: T {
        get() {a}
        set(v) {a=v}
    }
}
public func f1() {
    return A<Int64>(1, 2).p1
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp
public class B<T> {
    public var a: T
    public init(a: T) {
        this.a = a
    }
}
common extend <T> ?T {
    public common func foo1(a: B<Int64>) { a.a }
    public common static func foo2(a: B<Int64>) { a.a }
}
public func f1() {
    return Some(B<Int64>(1)).foo1(B<Int64>(1)) + Option<B<Int64>>.foo2(B<Int64>(1))
}

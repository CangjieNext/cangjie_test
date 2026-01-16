/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public common class A<T> {
    public common var a: Int64
    public static common var b: Int64
    private common func f(): Int64
    public common func f(a: T): T { a }
    public init() {}
}

protected common class A2<T> {
    protected common func f(): Int64
    static private common func f2<T>(): Int64
    public init() {}
}

public func test_com() { A().f(0) }

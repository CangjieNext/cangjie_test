/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public platform struct A<T> {
    private platform func f(): Int64 { 0 }
    public platform var a: Int64 = 1
    public static platform var b: Int64 = 2
}

protected platform struct A2<T> {
    protected platform func f(): Int64 { 1 }
    static private platform func f2<T>(): Int64 { 3 }
}

public func test_plat() { A().f(0) }

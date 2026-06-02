/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public var arr: Array<Int64> = [1, 2, 3, 4]

public interface fatherInterface<T> {
    func foo1(): Range<Int64>
    func foo2(a: Range<Int64>): Range<Int64> {
        foo1()
    }
    func foo3(): Int64
}

public interface MyInterface<T> <: fatherInterface<T> {
    func foo2(a: Range<Int64>): Range<Int64> {
        foo1();
        0..3
    }
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public platform interface A<T> {
    platform static func f1(a:T): T {
        a
    }
    platform func f2(a:T): T {
        a
    }
}


public class C<T> <: A<Int64> {
    public static func f3(): Int64 {
        3
    }
    public func f4(): Int64 {
        4
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package a

public class A<T> {
    public operator func *(b: A<T>): Bool {
        true
    }
}

public struct B<T> {
    public operator func *(b: B<T>): Bool {
        true
    }
}

public interface C<T> {
    operator func *(b: C<T>): Bool {
        true
    }
}

public class D<T> <: C<T> {}

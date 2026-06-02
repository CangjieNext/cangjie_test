/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public interface faterInterface<T> {
    func foo1(): T
    prop b: T {
        get() {
            foo1()
        }
    }
}

public interface MyInterface<T> <: faterInterface<Int64> {
    prop b: Int64 {
        get() {
            3
        }
    }
}

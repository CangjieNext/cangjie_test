/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public interface MyInterface<T> {
    mut func foo1(): Int32
    mut func foo2(): Int32 {
        foo1()
    }
    prop b: Int64 {
        get() {
            1
        }
    }
}

extend Int16 <: MyInterface<UInt64> {
    public func foo1(): Int32 {
        1
    }
}

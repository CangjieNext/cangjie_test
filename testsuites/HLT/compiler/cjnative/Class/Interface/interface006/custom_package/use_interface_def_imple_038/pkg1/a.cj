/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public var p1: Int64 = 0
public var p2: Int64 = 0

public interface faterInterface<T> {
    mut prop b1: Int64 {
        get() {
            1
        }
        set(value) {
            p1 = value
        }
    }
}

public interface MyInterface<T> <: faterInterface<T> {
    mut prop b2: Int64 {
        get() {
            2
        }
        set(value) {
            p2 = value
        }
    }
}

public enum myEnum <: MyInterface<Int64> {
    A
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public interface fatherInterface {
    prop b: Int64
    prop b1: Int64 {
        get() {
            b
        }
    }
}

public interface MyInterface <: fatherInterface {
    prop b2: Int64 {
        get() {
            b1
        }
    }
}

extend UInt32 <: MyInterface {
    func foo() {
        3
    }
    public prop b: Int64 {
        get() {
            foo()
        }
    }
}

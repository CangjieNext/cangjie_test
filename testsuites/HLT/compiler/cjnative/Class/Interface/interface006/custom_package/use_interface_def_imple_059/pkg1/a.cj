/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public interface faterInterface {
    func foo1(): UIntNative
    func foo2(a: UIntNative): UIntNative {
        a + foo1()
    }
}

public interface MyInterface <: faterInterface {}

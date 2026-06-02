/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public interface fatherInterface {
    func foo1(): String
    func foo2(a!: String): String {
        foo1()
    }
}

public interface MyInterface <: fatherInterface {
    func foo2(a!: String): String {
        foo1() + foo1()
    }
}

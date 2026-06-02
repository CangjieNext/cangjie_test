/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public interface faterInterface {
    func foo1(): Int64
    prop b: Int64 {
        get() {
            foo1()
        }
    }
}

public interface MyInterface <: faterInterface {}

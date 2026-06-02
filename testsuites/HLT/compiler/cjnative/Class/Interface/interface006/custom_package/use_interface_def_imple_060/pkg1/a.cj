/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg1

public interface faterInterface<T> {
    mut func foo1(): Rune
    mut func foo3(): Rune
    mut func foo2(a: Rune): Rune {
        foo1()
    }
}

public interface MyInterface <: faterInterface<Rune> {}

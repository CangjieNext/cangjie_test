/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan Compatible!

package test_stable_abi

// struct类型S1是public修饰，模块外可见，会参与下游模块的编译过程
public struct S1 {
    let x: Int64 = 0

    @OverflowThrowing
    public func getX(): Int64 {
        return x
    }
}

// struct类型S2虽然无public修饰，模块外不可见，但也会参与下游模块的编译过程。原因在于S2用于定义S3中的x成员变量类型，产生依赖
struct S2 {
    let x: Int64 = 0
}


public struct S3 {
    let x: S2 = S2()

    public func getX(): Int64 {
        return x.x
    }
}


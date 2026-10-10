/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


package upstream

public abstract class AbstractFuncShape {
    // 具体方法（无 abstract 语义）
    public func compute(): Int64 {
        return 42
    }

    // 抽象方法（无函数体；探针实证 SDK 中 isAbstract=true、isOpen=true、
    //   toString="open abstract func abstractFunc(): Int64"）
    public func abstractFunc(): Int64

    // 泛型抽象方法（无函数体）：覆盖"泛型 apply 对应成员函数 abstract → InvocationTargetException"
    public func abstractGenericFunc<T>(x: T): T
}

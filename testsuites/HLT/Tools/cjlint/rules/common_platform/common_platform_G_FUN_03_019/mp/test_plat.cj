/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public platform func fa<T>(a:T): T {
    a
}

public platform func printValue1<R>(value: R): Unit  where R <: ToString {
    println(value)
}

public platform func printValue2<T>(value: T): Unit {
    println(value)
}

public platform func fb<T>(a:T,b:Int64): Int64 {
    a+b
    1
}
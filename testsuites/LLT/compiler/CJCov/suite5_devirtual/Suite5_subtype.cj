// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件5-2: Tuple/Func 子类型关系 → 触发 isSubType 的 TK_TUPLE / TK_CFUNC 分支
//   + CJSpecificOpt 的特定优化分支
//   触发: 泛型函数接收不同 Tuple 类型 + 函数类型参数
// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

open class Animal { public open func speak(): String { return "animal" } }
class Dog <: Animal { public override func speak(): String { return "dog" } }
class Cat <: Animal { public override func speak(): String { return "cat" } }

// 通过基类数组调用 override 方法
func chorus(animals: Array<Animal>): String {
    var s = ""
    for (a in animals) {
        s = s + a.speak() + ","
    }
    return s
}

// 泛型函数 + 类型约束(触发 isFunctionSubType)
func apply<T>(x: T, f: (T) -> Int64): Int64 {
    return f(x)
}

// Tuple 传递(触发 TK_TUPLE 子类型) - Cangjie 元组类型用 (A, B) 注解
func useTuple(): Int64 {
    let t: (Int64, String) = (1, "hello")
    let (n, s) = t
    if (n > 0 && s != "") { return 0 }
    return 1
}

main(): Int64 {
    let zoo: Array<Animal> = [Dog(), Cat(), Dog(), Animal()]
    let r = chorus(zoo)
    if (r != "") { return 0 }
    return 1
}

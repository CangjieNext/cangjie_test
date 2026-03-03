// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package demo.utils

// 定义一个 public 函数，这样才能被其他包访问
public func add(a: Int64, b: Int64): Int64 {
    return a + b
}

// 定义一个 public 类
public class Greeter {
    public func sayHello(): Unit {
        println("Hello from Utils Package!")
    }
}
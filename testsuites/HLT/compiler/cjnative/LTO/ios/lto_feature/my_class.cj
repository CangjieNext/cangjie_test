// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package my_class
public class MyClass {
    public func greet(): String {
        return "hello from class"
    }
}
public func createGreeter(): MyClass {
    return MyClass()
}
public func classMethodCall(c: MyClass): String {
    return c.greet()
}
public func deadClassFunc(): String {
    return "dead"
}

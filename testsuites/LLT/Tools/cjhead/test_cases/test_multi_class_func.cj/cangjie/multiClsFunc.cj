// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

/**
 *  func dprint
 */
public func dprint() {
    println("dprint")
}

/**
 *  class A
 */
public class A {
    /**
     *  func A::dprint
     */
    public func dprint() {
        println("A::dprint")
    }
}

/**
 *  class B
 */
public class B {
    /**
     *  useless func
     */
    public func test() {
        println("test")
    }
    /**
     *  func B::dprint
     */
    public func dprint() {
        println("B::dprint")
    }
}

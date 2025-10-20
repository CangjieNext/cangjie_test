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

public class B {
    /**
     *  useless func
     */
    private func test() {
        println("test")
    }
    /**
     *  func B::dprint
     */
    public func dprint() {
        println("B::dprint")
    }

    /**
     *  func B::dprint(str)
     */
    public func dprint(str: String) {
        println("B::dprint(str)")
    }
}

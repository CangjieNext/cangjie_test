/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package mp

public platform class A {
    public var a: Int64
    public platform init(a!: Int64) { this.a = a }

}
public func test_plat() { A(a: 0).v + A(a: 0).a }



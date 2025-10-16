/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package mp

public platform interface A {
    platform static prop p1: Int64 { get() { 1 } }
    platform prop p2: Int64 { get() { 1 } }
}
public func test_plat() { C.p1 + C().p2 }



/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public common interface I {
    func f1(): Int64 {
        1
    }
}
class C1 <: I {}

public func test_com(): Int64 {
    C1().f1()
}

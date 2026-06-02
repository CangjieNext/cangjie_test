/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkgs

public func Foo(a!: Int64 = 1) {
    var b: Int64 = Goo()
    return a + b
}

func Goo(b!: Int64 = 2): Int64 {
    return b
}

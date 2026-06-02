// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package package_001

@C
public func callableInC() {
    println("callableInC(): CFunc")
}

public let f1: CFunc<() -> Unit> = {
    => println("f1(): CFunc lambda")
}

public func foo() {
    println("foo(): Function")
}

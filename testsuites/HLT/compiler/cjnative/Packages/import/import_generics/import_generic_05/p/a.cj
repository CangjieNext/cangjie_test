/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package a

@C
public func callableInC() {
    println("This function is defined in Cangjie.")
}

public let f1: CFunc<() -> Unit> = {
    => println("This function is defined with CFunc lambda.")
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cj005.b

internal import pro1.pa.*

@When[feature1 == "lion"]
public func b_test():Unit {
    pro_test()
    println("b lion feature")
}

@When[feature1 == "cat"]
public func b_test() :Unit{
    pro_test()
    println("b cat feature")
}

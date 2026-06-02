/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pro1.pa

@When[feature1 == "lion"]
public func pro_test(): Unit {
    println("pro_test lion feature")
}

@When[feature1 == "cat"]
public func pro_test(): Unit {
    println("pro_test cat feature")
}

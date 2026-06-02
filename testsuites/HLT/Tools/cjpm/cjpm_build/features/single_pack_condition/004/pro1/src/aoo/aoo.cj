/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pro1.aoo

@When[feature1 == "tiger"]
public func aoo1(): Unit {
    println("aoo feature tiger")
}

@When[feature1 == "lion"]
public func aoo1(): Unit {
    println("aoo feature lion")
}

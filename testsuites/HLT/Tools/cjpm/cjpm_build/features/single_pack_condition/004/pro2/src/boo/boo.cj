/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pro2.boo

@When[feature1 == "tiger"]
public func boo1(): Unit {
    println("boo feature tiger")
}

@When[feature1 == "lion"]
public func boo1(): Unit {
    println("boo feature lion")
}

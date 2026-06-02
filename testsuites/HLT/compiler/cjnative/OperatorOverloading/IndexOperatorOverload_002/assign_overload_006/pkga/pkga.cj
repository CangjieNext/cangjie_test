/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkga

public var x: Int64 = 0
public var y: Array<Int64> = []

public class A {
    public var a: Int64 = 0
    public operator func [](arg1: Int64, value!: Array<Int64>): Unit {
        this.a = arg1
        x = this.a
        y = value
    }
}

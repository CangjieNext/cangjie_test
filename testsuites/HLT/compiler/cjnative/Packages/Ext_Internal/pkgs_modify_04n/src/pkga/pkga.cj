/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkga

public let one: Int32 = 1
public let two: Int32 = 2
public let t: Data = Test()

func Test(): Data {
    let a: Int32 = one
    let b: Int32 = two
    return Data(a, b)
}

public class Data {
    public var a: Int32
    public init(x: Int32, y: Int32) {
        this.a = x + y
    }
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.modifier.pkg3

public class ABCD {
    public init(x: Int32, y: Int32)  {
        this.a = x
        this.c = y
    }
    public ABCD(b: Int64, public let a: Int32, var c: Int32) {}

    public let num: Int64 = 1
}

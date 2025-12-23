/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

common public abstract class C1 {
    common public func f1(): Int64
    common public prop p1: Int64
    public init() {}
}

common public class C2 {
    common public mut prop p1: Int64
    public init() {}
}

public func test_com() {
    A()
}

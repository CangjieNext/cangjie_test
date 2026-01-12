// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package up

public class C {
    var a: Int64 = 0
    let b: Int64 = 1
    func hoo(): Int64 { a + b }
    @Frozen
    public func foo(): Int64 { hoo() }
}

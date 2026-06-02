// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public class Foo {}

public interface ToStringI {
    func test(): Int64
}

extend Foo <: ToStringI {
    public func test(): Int64 {
        return 1
    }
}

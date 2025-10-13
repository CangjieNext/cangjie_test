package a

public class B {
    @Frozen
    public B(public let a!: Int64 = 3,
        public let b!: Int64 = 15,
        public var c!: String = "fafa",
        public let d!: Bool = false) {}
}
@Frozen
public func too(): Int64 {
    1
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

public let a: Int32 = 0
public class A1 {}
public class A2 {
    public func foo(): ?A1 { Option<A1>.None }
}

main() {
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

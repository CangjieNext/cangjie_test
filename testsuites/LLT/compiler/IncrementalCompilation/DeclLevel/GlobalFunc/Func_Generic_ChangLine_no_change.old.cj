public interface I{}
public class A <: I {}

public func foo<T >() : Int64 where  T <: I {
    return 0
}

main() {
    foo<A>()
    return 0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package a

func foo(): Unit {}

public func bar(a: Int64) {
    if (a > 3) {
        foo()
    } else {
        foo()
        foo()
    }
}
@Frozen
public func too(): Unit {
    0 // was 111
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

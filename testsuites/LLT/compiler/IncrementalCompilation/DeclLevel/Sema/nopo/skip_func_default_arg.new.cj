package a

@Frozen
public func B (a!: Int64 = 3,
    b!: Int64 = 15,
    c!: String = "fafa",
    d!: Bool = false) {}
// No Frozen no export body, so just compile pkga, not b and c
public func too(): Int64 {
    1
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

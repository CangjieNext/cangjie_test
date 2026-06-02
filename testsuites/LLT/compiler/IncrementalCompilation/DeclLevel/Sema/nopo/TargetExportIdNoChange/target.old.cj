package a

@Frozen
public func B() {}

public func too(): Int64 {
    0
}

// ASSERT: scan the changed decl after Spreading is:too
// ASSERT: scan-not the changed decl after Spreading is:B

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

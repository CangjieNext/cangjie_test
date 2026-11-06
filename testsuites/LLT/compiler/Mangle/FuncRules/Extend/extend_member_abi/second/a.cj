// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package abi_demo
public interface ISecond { func second(): Int64 }
extend Int64 <: ISecond {
    private func helperSecond(): Int64 { this + 22 }
    @Frozen
    public func second(): Int64 { helperSecond() }
}

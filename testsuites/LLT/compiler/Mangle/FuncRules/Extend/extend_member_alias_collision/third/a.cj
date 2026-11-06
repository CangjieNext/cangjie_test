// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package abi_demo
public interface IThird { func third(): Int64 }
extend Int64 <: IThird {
    private func helperThird(): Int64 { this + 33 }
    @Frozen
    public func third(): Int64 { helperThird() }
}

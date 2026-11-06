// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package abi_demo
public interface IDummy { func dummy(): Int64 }
extend Int64 <: IDummy { public func dummy(): Int64 { 0 } }
public interface IFirst { func first(): Int64 }
extend Int64 <: IFirst {
    private func helper(): Int64 { this + 11 }
    @Frozen
    public func first(): Int64 { helper() }
}

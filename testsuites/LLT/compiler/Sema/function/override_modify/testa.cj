// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package testa

public abstract class TaskOption<M, N> {
    public func getHandler(): Unit
}

public open class CallableTaskOption<M, N> <: TaskOption<M, N> {
    override public func getHandler(): Unit {}
}

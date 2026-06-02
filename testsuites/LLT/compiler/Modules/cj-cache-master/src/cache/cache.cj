// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cache

internal import std.time.*

let NoExpiration = Duration.second * (-1)

public class Cache<T> {
    public func Set(d!: Duration = NoExpiration) {}
}

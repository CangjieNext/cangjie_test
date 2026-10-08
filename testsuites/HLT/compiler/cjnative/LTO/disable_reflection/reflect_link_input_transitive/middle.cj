// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package middle

import std.reflect.*

public func reflectName(): String {
    return TypeInfo.of<Int64>().toString()
}

public func reflectDouble(): String {
    return TypeInfo.of<Float64>().toString()
}

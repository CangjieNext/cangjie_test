// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package default.pkg1

internal import std.math.*

public func func3() {
    var a: Option<Int64> = checkedAbs(Int64(3))
    match (a) {
        case Some(temp) => print("a=${temp}")
        case None => print("none")
    }
    return
}

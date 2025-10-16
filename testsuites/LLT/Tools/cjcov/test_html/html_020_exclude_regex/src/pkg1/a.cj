// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package default.pkg1

internal import std.regex.*

public func func1() {
    var matchData = Regex("\\db").matcher(" b1b").find()
    var pos = match (matchData) {
        case Some(s) =>
            print("${s.groupNumber()}\n")
            s.matchPosition(0)
        case None => return
    }
    print("${pos.start}\n")
    print("${pos.end}\n")
}

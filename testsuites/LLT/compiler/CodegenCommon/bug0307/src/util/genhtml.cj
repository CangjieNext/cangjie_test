// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package util

internal import std.collection.*
internal import std.argopt.*

func getArgValue(argMap: HashMap<String, String>, longOpt: String, shortOpt: String): String {
    if (argMap.contains(longOpt)) {
        return argMap[longOpt]
    }

    if (argMap.contains(shortOpt)) {
        return argMap[shortOpt]
    }

    return ""
}

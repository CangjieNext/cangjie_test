/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

internal import std.process.*
internal import std.collection.*

main(): Int64 {
    var args = ArrayList<String>(Process.current.arguments)
    print(args[10])
    return 0
}

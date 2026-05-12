/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
import std.ffi.python.*
import std.log.*

main(): Int64 {
    Python.load("not_end_with_so_file", loglevel: LogLevel.INFO)
    Python.unload()
    return 0
}

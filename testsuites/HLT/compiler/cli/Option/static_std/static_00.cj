/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// (!host_win) EXEC-PIPE: ldd %output 2>&1 | compare %f
// (host_win) EXEC-PIPE: dumpbin /dependents %output 2>&1 | compare %f
// ASSERT: scan libcangjie-runtime.dll
// ASSERT: scan msvcrt.dll
// ASSERT: scan KERNEL32.dll
// ASSERT: scan libboundscheck.dll

import std.core.*
//import std.ast.* // ast is always dynamically linked
import std.collection.*
import std.convert.*
import std.convert.*
import std.io.*
import std.math.*
import std.regex.*
import std.sync.*
import std.time.*
import std.unicode.*
// import std.unittest.* // block this since unittest depends on libraries not in std
import std.argopt.*
import std.random.*

main() {
    return 0
}

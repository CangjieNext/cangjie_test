/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0-core
// EXEC: %compiler %cmp_opt --static %f -o %output
// (not OHOS) EXEC-PIPE: ldd %output 2>&1 | compare %f
// (OHOS) EXEC-PIPE: readelf -a main 2>&1 | compare %f
// (not MAC) ASSERT: scan-not libcangjie-std-unittest.so
// (not MAC) ASSERT: scan-not libcangjie-std-argopt.so
// (not MAC) ASSERT: scan-not libcangjie-std-random.so

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

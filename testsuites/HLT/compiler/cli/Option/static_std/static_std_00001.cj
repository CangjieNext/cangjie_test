/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (CJNATIVE and not MAC) EXEC-PIPE: %compiler %cmp_opt %static_std %static_libs %f
// (CJNATIVE and not OHOS and not MAC) EXEC-PIPE: ldd main 2>&1 | compare %f
// (OHOS and not MAC) EXEC-PIPE: readelf -a main 2>&1 | compare %f
// (not MAC) ASSERT: scan-not libcangjie-std-core.so
// (not MAC) ASSERT: scan-not libcangjie-std-collection.so
// (not MAC) ASSERT: scan-not libcangjie-std-convert.so
// (not MAC) ASSERT: scan-not libcangjie-std-convert.so
// (not MAC) ASSERT: scan-not libcangjie-std-io.so
// (not MAC) ASSERT: scan-not libcangjie-std-log.so
// (not MAC) ASSERT: scan-not libcangjie-std-math.so
// (not MAC) ASSERT: scan-not libcangjie-std-posix.so
// (not MAC) ASSERT: scan-not libcangjie-std-regex.so
// (not MAC) ASSERT: scan-not libcangjie-std-sync.so
// (not MAC) ASSERT: scan-not libcangjie-std-time.so
// (not MAC) ASSERT: scan-not libcangjie-std-unicode.so
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

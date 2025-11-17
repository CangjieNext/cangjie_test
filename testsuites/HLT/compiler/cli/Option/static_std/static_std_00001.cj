/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (CJNATIVE) EXEC-PIPE: %compiler %cmp_opt %static_std %static_libs %f
// (CJNATIVE and not OHOS) EXEC-PIPE: ldd main 2>&1 | compare %f
// (OHOS) EXEC-PIPE: readelf -a main 2>&1 | compare %f
// ASSERT: scan-not libcangjie-std-core.so
// ASSERT: scan-not libcangjie-std-collection.so
// ASSERT: scan-not libcangjie-std-convert.so
// ASSERT: scan-not libcangjie-std-convert.so
// ASSERT: scan-not libcangjie-std-io.so
// ASSERT: scan-not libcangjie-std-log.so
// ASSERT: scan-not libcangjie-std-math.so
// ASSERT: scan-not libcangjie-std-posix.so
// ASSERT: scan-not libcangjie-std-regex.so
// ASSERT: scan-not libcangjie-std-sync.so
// ASSERT: scan-not libcangjie-std-time.so
// ASSERT: scan-not libcangjie-std-unicode.so
// ASSERT: scan-not libcangjie-std-unittest.so
// ASSERT: scan-not libcangjie-std-argopt.so
// ASSERT: scan-not libcangjie-std-random.so

import std.core.*
import std.collection.*
import std.convert.*
import std.convert.*
import std.io.*
import std.math.*
import std.regex.*
import std.sync.*
import std.time.*
import std.unicode.*
import std.argopt.*
import std.random.*

main() {
    return 0
}

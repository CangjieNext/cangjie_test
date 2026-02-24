/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt -Woff=all %f --dy-std --import-path %cangjie-dynamic-stdx-path -L %cangjie-dynamic-stdx-path %cangjie-stdx-list -o %output
// (!host_win) EXEC-PIPE: ldd %output 2>&1 | compare %f
// (host_win) EXEC-PIPE: dumpbin /dependents %output 2>&1 | compare %f

// Windows basic dynamic linked libraries.
// ASSERT: scan msvcrt.dll
// ASSERT: scan KERNEL32.dll

// Cangjie runtime dynamic libraries.
// ASSERT: scan-not libboundscheck.dll
// ASSERT: scan libcangjie-runtime.dll

// All of Cangjie stdlib dynamic libraries.
// ASSERT: scan libcangjie-std-core.dll
// ASSERT: scan libcangjie-std-argopt.dll
// ASSERT: scan libcangjie-std-ast.dll
// ASSERT: scan libcangjie-std-binary.dll
// ASSERT: scan libcangjie-std-collection.dll
// ASSERT: scan libcangjie-std-collection.concurrent.dll
// ASSERT: scan libcangjie-std-convert.dll
// ASSERT: scan libcangjie-std-crypto.cipher.dll
// ASSERT: scan libcangjie-std-crypto.digest.dll
// ASSERT: scan libcangjie-std-database.sql.dll
// ASSERT: scan-not libcangjie-std-deriving.dll
// ASSERT: scan libcangjie-std-env.dll
// ASSERT: scan libcangjie-std-fs.dll
// ASSERT: scan libcangjie-std-interop.dll
// ASSERT: scan libcangjie-std-io.dll
// ASSERT: scan libcangjie-std-math.dll
// ASSERT: scan libcangjie-std-math.numeric.dll
// ASSERT: scan libcangjie-std-net.dll
// ASSERT: scan libcangjie-std-objectpool.dll
// ASSERT: scan libcangjie-std-overflow.dll
// ASSERT: scan libcangjie-std-posix.dll
// ASSERT: scan libcangjie-std-process.dll
// ASSERT: scan libcangjie-std-random.dll
// ASSERT: scan libcangjie-std-ref.dll
// ASSERT: scan libcangjie-std-reflect.dll
// ASSERT: scan libcangjie-std-regex.dll
// ASSERT: scan libcangjie-std-runtime.dll
// ASSERT: scan libcangjie-std-sort.dll
// ASSERT: scan libcangjie-std-sync.dll
// ASSERT: scan libcangjie-std-time.dll
// ASSERT: scan libcangjie-std-unicode.dll
// ASSERT: scan libcangjie-std-unittest.dll
// ASSERT: scan libcangjie-std-unittest.mock.dll
// ASSERT: scan-not libcangjie-std-unittest.mock.mockmacro.dll
// ASSERT: scan-not libcangjie-std-unittest.testmacro.dll
// ASSERT: scan libcangjie-std-unittest.common.dll
// ASSERT: scan libcangjie-std-unittest.diff.dll
// ASSERT: scan libcangjie-std-unittest.prop_test.dll

// Cangjie stdx dynamic libraries.


// RUN-EXEC: %run %run_opt %output %run_args

import std.core.*
import std.argopt.*
import std.ast.*
import std.binary.*
import std.collection.*
import std.collection.concurrent.*
import std.convert.*
import std.crypto.cipher.*
import std.crypto.digest.*
import std.database.sql.*
import std.deriving.* // this is macro package.
import std.env.*
import std.fs.*
import std.interop.*
import std.io.*
import std.math.*
import std.math.numeric.*
import std.net.*
import std.objectpool.*
import std.overflow.*
import std.posix.*
import std.process.*
import std.random.*
import std.ref.*
import std.reflect.*
import std.regex.*
import std.runtime.*
import std.sort.*
import std.sync.*
import std.time.*
import std.unicode.*
import std.unittest.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.* // this is macro package.
import std.unittest.testmacro.* // this is macro package.
import std.unittest.common.*
import std.unittest.diff.*
import std.unittest.prop_test.*

// Cangjie stdx libraries.
import stdx.actors.*
import stdx.actors.macros.* // this is macro package.
import stdx.aspectCJ.*
import stdx.chir.*
import stdx.compress.*
import stdx.compress.tar.*
import stdx.compress.zlib.*
import stdx.crypto.common.*
// import stdx.crypto.crypto.*
// import stdx.crypto.digest.*
// import stdx.crypto.keys.*
// import stdx.crypto.kit.*
// import stdx.crypto.x509.*
// import stdx.effect.*
// import stdx.encoding.json.*
// import stdx.encoding.json.stream.*
// import stdx.encoding.url.*
// import stdx.fuzz.fuz.*
// import stdx.log.*
// import stdx.logger.*
// import stdx.net.http.*
// import stdx.net.tls.*
// import stdx.net.serialization.serialization.*
// import stdx.string_itern.*
// import stdx.syntax.*
// import stdx.unittest.data.*

public func stdCore(): Unit {
    let a = Array<Int64>()
}

public func stdCollection(): Unit {
    let a = ArrayList<Int64>()
}

main(): Unit {
    stdCore()
    stdCollection()
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: my_utils.cj check_linux.txt check_win.txt check_mac.txt
// EXEC: %compiler %cmp_opt my_utils.cj --output-type=dylib
// EXEC: %compiler %cmp_opt -Woff=all %f --dy-std --import-path %cangjie-dynamic-stdx-path -L %cangjie-dynamic-stdx-path %cangjie-stdx-list -L. -lmy_utils -o %output
// (host_mac) EXEC-PIPE: otool -L %output | compare check_linux.txt
// (host_linux) EXEC-PIPE: ldd %output | compare check_linux.txt
// (host_win) EXEC-PIPE: dumpbin /dependents %output | compare check_win.txt
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %ls

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
// MacOS and iOS currently does not support reflection.
@When[os != "macOS" && os != "iOS"]
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

// User's libraries.
import my_utils.*

// Cangjie stdx libraries.
// import stdx.actors.*
// import stdx.actors.macros.* // this is macro package.
// import stdx.aspectCJ.*
// import stdx.chir.*
// import stdx.compress.*
// import stdx.compress.tar.*
// import stdx.compress.zlib.*
// import stdx.crypto.common.*
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

public func myUtils(): Unit {
    let c = C()
}

main(): Unit {
    stdCore()
    stdCollection()
    myUtils()
}

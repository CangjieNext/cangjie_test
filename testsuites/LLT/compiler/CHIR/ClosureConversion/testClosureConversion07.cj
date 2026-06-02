// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %import-cangjie-stdx %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan The top level func in the line:18 and the column:1 was closure converted
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

internal import std.collection.*
internal import stdx.encoding.json.*

var Map_Len = 1 << 10

func create(Index: Int64): (String, JsonString) {
    return ("${Index}", JsonString("${Index}"))
}

main() {
    var map1 = HashMap<String, JsonValue>(Map_Len, create)
    var js1 = JsonObject(map1)
    var v1 = js1.getFields()
    0
}


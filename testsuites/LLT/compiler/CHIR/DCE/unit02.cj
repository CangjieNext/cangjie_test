// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %f %dumpCHIRDebug -g 2>&1 >a.t
// (DEBUG_OPTION)EXEC: %touch b.t
// (DEBUG_OPTION)EXEC: %diff a.t b.t
// (Linux and CJNATIVE and DEBUG_OPTION) EXEC: sed -n '/Func @_CN7default6<main>Hv/,/Func @\w+/p' default_CHIR/0_AST_CHIR.chir | compare %f
// (Linux and not CJNATIVE and DEBUG_OPTION) EXEC: sed -n '/Func @_ZN7default6<main>Ev/,/Func @\w+/p' default_CHIR/0_AST_CHIR.chir | compare %f

var a = 1
var b = 2

main() {
    if (a < b) {
    } else {
    }
    ()
}

// ASSERT: regex %\d+: Unit = Load\(%\d+\) // loc: "unit02.cj"-17-5, scope: 0, skip: dce warning

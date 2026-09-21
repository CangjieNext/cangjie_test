/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// LEVEL: 0
// SKIP-COMPILE: LM-DOC-20260910 prescribed SDK has no JsonObject @local! ctor.
// Evidence: cjc exits rc=1 with `no matching constructor for call 'JsonObject'`
// and local receiver mismatch at size() (2 errors generated, 2 printed).
// UPDATE 2026-09-11: SDK local_mode-localmods-20260911-final 已修复本文件原阻塞器，恢复 EXEC（原阻塞记录见下）。
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output
// DISABLED-EXEC: %set_stdx_path %run %run_opt %output %run_args
//
// LM-DOC-20260910: T521 isolated positive.  This compilation unit contains
// only JsonObject() @local! and its size observation: no heap control, map
// setup, put, serializer, or other local value may alter region placement.
// If the isolated constructor reaches the runtime, expected result is size 0
// and exit 0.  The currently observed runtime blocker is
// `Barrier::WriteGeneric does not support local object` (SIGABRT, rc=134);
// restore EXEC only after this exact isolated case runs ALL PASSED.

import stdx.encoding.json.*


main(): Int64 {
    let object: JsonObject @local! = JsonObject() @local!
    if (object.size() != 0) {
        println("FAIL: T521_noarg_size")
        return 1
    }
    println("ALL PASSED")
    return 0
}

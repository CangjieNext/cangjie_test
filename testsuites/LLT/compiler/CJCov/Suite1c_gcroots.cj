// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件1c-3: 全局GC引用 → CJMetadata emitGCRoots/emitGCTibTable/GC flags
// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class GcObj { var x: Int64 = 0; var s: String = "" }
let g_globalObj = GcObj()

main(): Int64 {
    g_globalObj.x = 5; g_globalObj.s = "hello"
    let another = GcObj()
    another.x = 10; another.s = "world"
    g_globalObj.x = another.x; g_globalObj.s = another.s
    if (g_globalObj.x == 10 && g_globalObj.s == "world") { return 0 }
    return 1
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %frontendCompiler %dump-ir-to-screen %cmp_opt %enableCompileDebug %n.cj 2>&1 | compare %f
// (CJNATIVE) ASSERT: regex-auto !DISubprogram(name: "new", linkageName: "_CN7default3AAA3newHv"
// (not CJNATIVE) ASSERT: regex-auto !DISubprogram(name: "new", linkageName: "_ZN7default3AAA3newEv"

interface AAA {
    static func new() {
        0
    }
}

main() {
    var a = AAA.new()
    0
}

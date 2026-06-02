// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not Windows and DEBUG_OPTION) EXEC-PIPE-0: %compiler %enableCompileDebug %dumpCHIRDebug  %f -o %n.%suffix 2>&1
// (not Windows and CJNATIVE and DEBUG_OPTION) EXEC-PIPE-0: sed -E '0,/Func @_CN7default6<main>Hv\(\)/d' %n\_CHIR/[0-9]*\_AST\_CHIR.chir | compare %f

// ASSERT: regex-begin GoTo\(#2\)
// ASSERT: regex-next Block #2: // preds: #3, #1 // loc: ""-0-0

main() {
    var x: ToString = if (false) {}
    println(x)
}

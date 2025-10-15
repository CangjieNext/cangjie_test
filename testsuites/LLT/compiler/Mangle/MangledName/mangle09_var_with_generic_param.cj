// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt -g %n.cj -o %n.%suffix
// (DEBUG_OPTION)EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %enableCompileDebug %n.cj 2>&1 | compare %f

// (CJNATIVE) ASSERT: scan @_CN7default1aE
// (CJNATIVE) ASSERT: scan @_CN7default1bE
// (CJNATIVE) ASSERT: scan-not @_CN7default1aIlE
// (CJNATIVE) ASSERT: scan-not @_CN7default1bIRNat6StringEE
// (not CJNATIVE) ASSERT: scan @_ZN7default1aE
// (not CJNATIVE) ASSERT: scan @_ZN7default1bE
// (not CJNATIVE) ASSERT: scan-not @_ZN7default1aIlE
// (not CJNATIVE) ASSERT: scan-not @_ZN7default1bIR_ZN8std.core6StringEE

// Test var decl with genric param

var a: Array<Int64> = [1]
var b: Array<String> = ["foo"]

main() {
    a[0]
    b[0]
    return 0
}

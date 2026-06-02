// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and DEBUG_OPTION) EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %compile_lib_opt %enableCompileDebug --apc=1 %f 2>&1 | compare %f
// (not CJNATIVE and DEBUG_OPTION) EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %compile_lib_opt %enableCompileDebug %f 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define internal i64 @"_CN7defaultUmangle02$1fHv"
// (CJNATIVE) ASSERT: scan define internal i64 @"_CN7defaultUmangle02$1fHl"
// (not CJNATIVE) ASSERT: scan define internal i64 @"_ZN7default9$mangle021fEv"
// (not CJNATIVE) ASSERT: scan define internal i64 @"_ZN7default9$mangle021fEl"
private func f(): Int64 {
    return 0
}

private func f(a: Int64): Int64 {
    return 1
}

main() {
    var a = f()
    var b = f(1)
    print(a)
    print(b)
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %dump-ir-to-screen %cmp_opt %enableCompileDebug %compile_lib_opt --apc=1 %n.cj 2>&1 | compare %f
// ASSERT: regex define internal void @cjfoo\(\) #\d+ !dbg !(?P<num1>\d+)
// ASSERT: regex call void @_CN7defaultU00000002sAPsR5cjfooHv\(\), !dbg !(?P<num2>\d+)
// ASSERT: regex !(?P=num1) = distinct !DISubprogram\(name: "cjfoo", linkageName: "cjfoo", scope: !\d+, file: !\d+, line: 16
// ASSERT: regex !(?P=num2) = !DILocation\(line: 16, column: 1, scope: !(?P=num1)\)

foreign func cfoo(f: CFunc<() -> Unit>): Unit

@C
private func cjfoo(): Unit {
    println("xx")
}

unsafe main() {
    cfoo(cjfoo)
    0
}

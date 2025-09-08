// DEPENDENCE: %n.txt
// EXEC: %compiler %incrementalCompile %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.txt %n.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %n.cj -o %output 2>&1 | compare %f


struct A{
    static func foo() {
        0
    }
}

main():Int64{
    return A.foo();
}

// ASSERT: scan changed decls to recompile: 2
// ASSERT: scan the changed decl after Spreading is:foo in file ModifyStructFuncModifier.cj in line 9 in column 10
// ASSERT: scan the changed decl after Spreading is:main in file ModifyStructFuncModifier.cj in line 14 in column 1
// ASSERT: scan incremental sema

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %mkdir %n
// EXEC: %cpfile %n.old.cj %n
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt %n.%lib_extension %f -o %output
// EXEC: %cpfile %n.new.cj %n/%n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt %n.%lib_extension %f -o %output 2>&1 | compare %f
// RUN-EXEC-1: %run %run_opt %output %run_args

import p1.*

main() {
    let a: Int32 = 7
    Int64(a)-6
}

interface I2 {
}
extend Int32 <: I2 {}

// ASSERT: scan changed decls to recompile: 6
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file ImportedExtendInt_AddPubMethod.old.cj in line 4 in column 1
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file ImportedExtendInt_AddPubMethod.cj in line 20 in column 1
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file countable.cj
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file to_string.cj
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file hashable.cj
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file comparable.cj

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

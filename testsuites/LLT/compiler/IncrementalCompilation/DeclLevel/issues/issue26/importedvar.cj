// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %n.old.cj -O2 -Woff unused %compile_lib_opt -o libpkg1.%lib_extension
// EXEC: %compiler %incrementalCompile %n.cj libpkg1.%lib_extension -O2 %cmp_opt -o %output
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC: %compiler %incrementalCompile %n.old.cj -O2 -Woff unused %compile_lib_opt -o libpkg1.%lib_extension
// EXEC-PIPE: %compiler %incrementalCompile %n.cj libpkg1.%lib_extension -O2 %cmp_opt -o %output 2>&1 | compare %f
// ASSERT: scan changed decls to recompile: 2
// ASSERT: scan-not the changed decl after Spreading is:a in file importedvar.old.cj in line 4 in column 12
// ASSERT: scan the changed decl after Spreading is:b in file importedvar.old.cj in line 5 in column 14
// ASSERT: scan the changed decl after Spreading is:main in file importedvar.cj in line 15 in column 1
// EXEC-1: %run %run_opt %output %run_args

internal import pkg.*

main() {
    a-b
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

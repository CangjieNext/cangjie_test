// DEPENDENCE: pkg.old.cj pkg.new.cj
// EXEC: %cpfile pkg.old.cj pkg.inc.cj
// EXEC: %compiler %incrementalCompile %cmp_opt pkg.inc.cj %compile_lib_opt -o pkg.%lib_extension -O2
// EXEC: %compiler %incrementalCompile %cmp_opt pkg.%lib_extension %f -o %output -O2
// EXEC-1: %run %run_opt %output %run_args
// EXEC: %cpfile pkg.new.cj pkg.inc.cj
// EXEC: %rmfile %output
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt pkg.inc.cj %compile_lib_opt -o pkg.%lib_extension -O2 
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt pkg.%lib_extension %f -o %output -O2 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan incremental compilation triggered

internal import pkg.*

main() {
    return B.f()
}

// ASSERT: scan changed decls to recompile: 4
// ASSERT: scan the changed decl after Spreading is:main in file ImportParentChanges.cj in line 15 in column 1
// ASSERT: scan the changed decl after Spreading is:I in file pkg.inc.cj in line 3 in column 18
// ASSERT: scan the changed decl after Spreading is:f in file pkg.inc.cj in line 5 in column 17
// ASSERT: scan the changed decl after Spreading is:B in file pkg.inc.cj in line 8 in column 14

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

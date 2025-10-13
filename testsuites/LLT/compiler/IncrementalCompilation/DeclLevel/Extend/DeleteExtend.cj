// DEPENDENCE: AddExtend.pkg.cj AddExtend.new.cj AddExtend.old.cj
// EXEC: %compiler %compile_lib_opt AddExtend.pkg.cj -o libp1.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt AddExtend.new.cj libp1.%lib_extension -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile AddExtend.new.cj
// EXEC: %cpfile AddExtend.old.cj AddExtend.new.cj
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt AddExtend.new.cj libp1.%lib_extension -o %output 2>&1 | compare %f

// ASSERT: scan changed decls to recompile: 2
// ASSERT: scan the changed decl after Spreading is:A1 in file AddExtend.new.cj in line 5 in column 14
// ASSERT: scan the changed decl after Spreading is:A2 in file AddExtend.new.cj in line 6 in column 15
// ASSERT: scan deleted decls: 2
// ASSERT: scan deleted 2A1<:2I1X
// ASSERT: scan deleted 2A2<:2I2<i>X


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

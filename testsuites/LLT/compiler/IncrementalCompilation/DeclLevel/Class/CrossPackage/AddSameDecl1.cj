// DEPENDENCE: %n.old.cj %n.new.cj

// EXEC: %mkdir %n
// EXEC: %cpfile %n.cj %n
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt %n.%lib_extension %n.old.cj -o %output
// EXEC-1: %run %run_opt %output %run_args

// EXEC: %rmfile %n.old.cj
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE-1: %compiler %incrementalCompile %cmp_opt %n.%lib_extension %n.old.cj -o %output 2>&1 | compare %f

// ASSERT: scan incremental compilation triggered
// ASSERT: scan error: return type of 'main' is not 'Integer' or 'Unit'
// ASSERT: scan error: expected member name or constructor call after 'ABC' type name
// ASSERT: scan the changed decl after Spreading is:foo
// ASSERT: scan the changed decl after Spreading is:main
// ASSERT: scan the changed decl after Spreading is:ABC

package inc

public var ABC:Int64 = 1


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %mkdir %n
// EXEC: %cpfile %n.old.cj %n
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o pkg1.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt pkg1.%lib_extension %f -o %output
// EXEC-1: %run %run_opt %output %run_args
// EXEC: %rmfile %n/%n.old.cj
// EXEC: %move %n.new.cj %n/%n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o pkg1.%lib_extension
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt pkg1.%lib_extension %f -o %output 2>&1 | compare %f
// ASSERT: scan incremental compilation triggered
// EXEC: %run %run_opt %output %run_args

internal import pkg1.*

func foo(_: Int32): Int64 { 0 }
func foo(_: Int64): Int64 { 1 }
main(): Int64 {
    foo(f1())
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

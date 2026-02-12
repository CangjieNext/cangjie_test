// DEPENDENCE: %n.old.cj %n.new.cj Incr.expect %n.diag.txt

// EXEC: %mkdir %n && %mkdir out
// EXEC: %cpfile %n.old.cj %n
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt %n.%lib_extension %f -o out/%output
// EXEC: %run %run_opt out/%output %run_args

// EXEC: %rmfile %n/%n.old.cj
// EXEC: %cpfile %n.new.cj %n/%n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension 2>&1 && (cd .cached && %cat *.log) | compare Incr.expect

// EXEC-PIPE-1: %compiler %cmp_opt %incrementalCompile %n.%lib_extension %f -o out/%output 2>&1 | compare %n.diag.txt
// EXEC: (cd .cached && %cat *.log) | compare %f

// ASSERT: scan incremental compilation triggered

internal import inc.*

main() {
    let e = Green
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

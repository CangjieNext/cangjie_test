// DEPENDENCE: %n.old.cj %n.new.cj %n.diag.txt

// EXEC: %mkdir %n
// EXEC: %cpfile %n.cj %n
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt %n.%lib_extension %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args

// EXEC: %rmfile %n.old.cj
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE-1: %compiler %incrementalCompile %cmp_opt %n.%lib_extension %n.old.cj -o %output 2>&1 | compare %n.diag.txt
// EXEC: (cd .cached && %cat *.log) | compare %f

// ASSERT: scan rollback

package inc

public func ABC(){
    return 0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

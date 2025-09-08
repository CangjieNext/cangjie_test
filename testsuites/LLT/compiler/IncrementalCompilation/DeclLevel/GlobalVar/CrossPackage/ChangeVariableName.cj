// DEPENDENCE: %n.old.cj %n.new.cj Incr.expect
// EXEC: %mkdir inc
// EXEC: %cpfile %n.old.cj inc

// EXEC: %compiler %incrementalCompile %cmp_opt -p inc %compile_lib_opt -o A.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt %f A.%lib_extension -o %output
// EXEC: %run %run_opt %output %run_args

// EXEC: %rmfile inc/%n.old.cj
// EXEC: %move %n.new.cj inc/%n.old.cj

// EXEC: %compiler %cmp_opt %incrementalCompile -p inc %compile_lib_opt -o A.%lib_extension 2>&1 | compare Incr.expect
// EXEC: %compiler %cmp_opt %incrementalCompile %f A.%lib_extension -o %output 2>&1 | compare %f

// ASSERT: scan error: undeclared identifier 'xy'

internal import A.*

main():Int64{
    return xy
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

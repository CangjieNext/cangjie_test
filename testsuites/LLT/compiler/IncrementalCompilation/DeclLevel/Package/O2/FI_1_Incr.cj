// DEPENDENCE: %n.old.cj %n.new.cj %n.expect Incr.expect
// EXEC: %mkdir %n
// EXEC: %cpfile %n.old.cj %n/
// EXEC: %compiler %incrementalCompile %cmp_opt %enableO2 -p %n %compile_lib_opt -o A.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt %debugCHIROpt %enableO2 A.%lib_extension %f -o %output | compare %f
// ASSERT: scan The Apply node in the line:20 and the column:5, was optimized by Function Inline
// EXEC: %run %run_opt %output %run_args

// EXEC: %rmfile %n/%n.old.cj
// EXEC: %cpfile %n.new.cj %n/%n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %enableO2 -p %n %compile_lib_opt -o A.%lib_extension 2>&1 | compare Incr.expect

// EXEC: %compiler %incrementalCompile %debugCHIROpt %enableO2 %cmp_opt A.%lib_extension %f -o %output 2>&1 | compare %n.expect

// EXEC-3: %run %run_opt %output %run_args

internal import inc.*

func bar():Int64{
    foo()
}
main():Int64{
    bar()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

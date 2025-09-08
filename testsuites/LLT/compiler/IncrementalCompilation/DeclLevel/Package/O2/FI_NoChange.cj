// DEPENDENCE: %n.old.cj %n.new.cj Incr.expect NoChange.expect
// EXEC: %mkdir %n
// EXEC: %cpfile %n.old.cj %n/
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o A.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt A.%lib_extension %f -o %output 
// EXEC: %run %run_opt %output %run_args

// EXEC: %rmfile %n/%n.old.cj
// EXEC: %cpfile %n.new.cj %n/%n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o A.%lib_extension 2>&1 | compare Incr.expect

// EXEC: %compiler %incrementalCompile %cmp_opt A.%lib_extension %f -o %output 2>&1 | compare NoChange.expect

// EXEC: %run %run_opt %output %run_args

internal import inc.*

main():Int64{
    foo()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

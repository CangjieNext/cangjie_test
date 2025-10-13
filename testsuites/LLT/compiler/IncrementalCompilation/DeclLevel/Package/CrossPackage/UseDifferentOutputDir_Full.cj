// DEPENDENCE: %n.old.cj %n.new.cj Incr.expect
// EXEC: %mkdir %n
// EXEC: %mkdir inc
// EXEC: %mkdir outputDir
// EXEC: %cpfile %f %n
// EXEC: %cpfile %n.old.cj inc

// EXEC: %compiler %incrementalCompile %cmp_opt -p inc %compile_lib_opt -o A.%lib_extension %output_dir_opt outputDir
// EXEC: %compiler %incrementalCompile %cmp_opt %n/%f %import_path_opt outputDir outputDir/A.%lib_extension -o %output
// EXEC: %run %run_opt %output %run_args

// EXEC: %rmfile inc/%n.old.cj
// EXEC: %move %n.new.cj inc/%n.old.cj

// EXEC: %compiler %cmp_opt %incrementalCompile -p inc %compile_lib_opt -o A.%lib_extension %output_dir_opt outputDir 2>&1 | compare Incr.expect
// EXEC: %compiler %cmp_opt %incrementalCompile %n/%f %import_path_opt outputDir outputDir/A.%lib_extension -o %output 2>&1 | compare Incr.expect


internal import A.*

main():Int64{
    Int64(foo())
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

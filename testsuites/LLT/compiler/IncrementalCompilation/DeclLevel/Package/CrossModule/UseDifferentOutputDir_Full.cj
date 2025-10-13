// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %mkdir %n inc build build/inc
// EXEC: %cpfile %f %n
// EXEC: %cpfile %n.old.cj inc

// EXEC: %compiler %incrementalCompile %cmp_opt -p inc %compile_lib_opt %output_dir_opt build/inc -o A.%lib_extension
// EXEC: %compiler %import_path_opt build %cmp_opt %incrementalCompile %n/%f build/inc/A.%lib_extension -o %output
// EXEC: %run %run_opt %output %run_args

// EXEC: %rmfile inc/%n.old.cj
// EXEC: %move %n.new.cj inc/%n.old.cj

// EXEC: %compiler %cmp_opt %incrementalCompile -p inc %compile_lib_opt %output_dir_opt build/inc -o A.%lib_extension 2>&1 | compare %f
// EXEC: %compiler %import_path_opt build %cmp_opt %incrementalCompile %n/%f build/inc/A.%lib_extension -o %output 2>&1 | compare %f

// ASSERT: scan incremental compilation triggered

import inc.A.*

main():Int64{
    Int64(foo())
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

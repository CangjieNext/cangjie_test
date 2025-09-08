// DEPENDENCE: %n.old.cj %n.new.cj %n.3rd.cj
// EXEC: %mkdir %n && %cpfile %n.old.cj %n

// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC: %compiler %cmp_opt %n.%lib_extension %f -o %output
// EXEC: %run %run_opt %output %run_args

// EXEC: %rmfile %n/%n.old.cj

// EXEC: %cpfile %n.new.cj %n/%n.old.cj
// EXEC-PIPE-1: %compiler %cmp_opt %incrementalCompile -p %n %compile_lib_opt -o %n.%lib_extension 2>&1 | compare %f

// ASSERT: scan illegal source code leads to duplicated raw mangle name, roll back to full compilation
// ASSERT: scan error: redefinition of declaration 'a'

// EXEC: %rmfile $n.old.cj
// EXEC: %cpfile %n.3rd.cj %n/%n.old.cj
// EXEC: %compiler %cmp_opt %incrementalCompile -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC: %compiler %cmp_opt %n.%lib_extension %f -o %output
// EXEC-1: %run %run_opt %output %run_args

internal import inc.*

main() {
    let c = C()
    return c.a
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

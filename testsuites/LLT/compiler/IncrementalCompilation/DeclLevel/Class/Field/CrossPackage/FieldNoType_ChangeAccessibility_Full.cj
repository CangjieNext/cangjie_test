// DEPENDENCE: %n.old.cj %n.new.cj

// EXEC: %mkdir %n
// EXEC: %cpfile %n.old.cj %n
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt %n.%lib_extension %f -o %output
// EXEC: %run %run_opt %output %run_args

// EXEC: %rmfile %n/%n.old.cj
// EXEC: %cpfile %n.new.cj %n/%n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension

// EXEC-PIPE-1: %compiler %cmp_opt %incrementalCompile %n.%lib_extension %f -o %output 2>&1 | compare %f
// ASSERT: scan incremental compilation triggered
// ASSERT: scan error: can not access field 'a'

internal import inc.*

class D <: C{

}

let c = C()

func useA(){
    return c.a
}

func useType(){
    let c:C
}

main() {
    return useA()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

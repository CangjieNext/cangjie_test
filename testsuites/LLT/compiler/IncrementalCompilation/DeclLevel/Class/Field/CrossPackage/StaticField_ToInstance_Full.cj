// DEPENDENCE: %n.old.cj %n.new.cj %n.diag.txt

// EXEC: %mkdir %n && %mkdir out
// EXEC: %cpfile %n.old.cj %n
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt %n.%lib_extension %f -o out/%output
// EXEC: %run %run_opt out/%output %run_args

// EXEC: %rmfile %n/%n.old.cj
// EXEC: %cpfile %n.new.cj %n/%n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension

// EXEC-PIPE-1: %compiler %cmp_opt %incrementalCompile %n.%lib_extension %f -o out/%output 2>&1 | compare %n.diag.txt
// EXEC: (cd out && cd .cached && %cat *.log) | compare %f

// ASSERT: scan incremental compilation triggered
// ASSERT: scan the changed decl after Spreading is:c
// ASSERT: scan the changed decl after Spreading is:useFoo
// ASSERT: scan the changed decl after Spreading is:useA

internal import inc.*

let c = C()

func useA(){
    return C.a
}

func useType(){
    let t:C
}

func useFoo(){
    return c.foo()
}

main() {
    return useA() + useFoo()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

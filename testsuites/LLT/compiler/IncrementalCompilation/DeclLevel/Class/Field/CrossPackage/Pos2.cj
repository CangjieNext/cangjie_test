// DEPENDENCE: %n.old.cj %n.new.cj

// EXEC: %mkdir %n
// EXEC: %cpfile %n.old.cj %n
// EXEC: %compiler %incrementalCompile %cmp_opt %noStackInfo -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt %noStackInfo %n.%lib_extension %f -o %output
// EXEC: %run %run_opt %output %run_args

// EXEC: %rmfile %n/%n.old.cj
// EXEC: %cpfile %n.new.cj %n/%n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %noStackInfo -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC-PIPE-0: %compiler %cmp_opt %noStackInfo %incrementalCompile %n.%lib_extension %f -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan no change

internal import inc.*

let c = C()
let s = S()

func useCA(){
    c.a
}

func useCB(){
    c.b
}
func useCC(){
    C.c
}
func useCD(){
    C.d
}
func useCE(){
    C.e
}

func useSA(){
    s.a
}
func useSB(){
    s.b
}
func useSC(){
    S.c
}
func useSD(){
    S.d
}
func useSE(){
    S.e
}

main() {

}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

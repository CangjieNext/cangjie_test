// DEPENDENCE: %n.old.cj %n.new.cj

// EXEC: %mkdir %n
// EXEC: %cpfile %n.old.cj %n
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt %n.%lib_extension %f -o %output
// EXEC: %run %run_opt %output %run_args

// EXEC: %rmfile %n/%n.old.cj
// EXEC: %cpfile %n.new.cj %n/%n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension

// EXEC-PIPE-0: %compiler %cmp_opt %incrementalCompile %n.%lib_extension %f -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan incremental compilation triggered
// ASSERT: scan-not the changed decl after Spreading is:a
// ASSERT: scan-not the changed decl after Spreading is:b
// ASSERT: scan-not the changed decl after Spreading is:c
// ASSERT: scan-not the changed decl after Spreading is:d
// ASSERT: scan the changed decl after Spreading is:m
// ASSERT: scan-not the changed decl after Spreading is:e
// ASSERT: scan-not the changed decl after Spreading is:g
// ASSERT: scan-not the changed decl after Spreading is:h
// ASSERT: scan the changed decl after Spreading is:n
 
// ASSERT: scan-not the changed decl after Spreading is:useCA
// ASSERT: scan-not the changed decl after Spreading is:useCB
// ASSERT: scan-not the changed decl after Spreading is:useCC
// ASSERT: scan-not the changed decl after Spreading is:useCD
// ASSERT: scan the changed decl after Spreading is:useCM
// ASSERT: scan-not the changed decl after Spreading is:useSE
// ASSERT: scan-not the changed decl after Spreading is:useSF
// ASSERT: scan-not the changed decl after Spreading is:useSG
// ASSERT: scan-not the changed decl after Spreading is:useSH
// ASSERT: scan the changed decl after Spreading is:useSN

// Static public let variables are counted as changed, and position change affect bodyHash

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
func useCM(){
    C.m
}

func useSE(){
    s.e
}
func useSF(){
    s.f
}
func useSG(){
    S.g
}
func useSH(){
    S.h
}
func useSN(){
    S.n
}

main() {

}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

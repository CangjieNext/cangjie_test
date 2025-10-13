// DEPENDENCE: %n.old.cj %n.new.cj %n.pkg.cj Incr.expect

// EXEC: %mkdir inc1 inc2
// EXEC: %cpfile %n.pkg.cj inc1
// EXEC: %cpfile %n.old.cj inc2

// EXEC: %compiler %incrementalCompile %cmp_opt -p inc1 %compile_lib_opt -o inc1.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt -p inc2 %compile_lib_opt -o inc2.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt inc1.%lib_extension inc2.%lib_extension %f -o %output

// EXEC: %rmfile inc2/%n.old.cj
// EXEC: %cpfile %n.new.cj inc2/%n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -p inc2 %compile_lib_opt -o inc2.%lib_extension
// EXEC-PIPE-1: %compiler %incrementalCompile %cmp_opt inc1.%lib_extension inc2.%lib_extension %f -o %output 2>&1 | compare %f

// ASSERT: scan error: find multiple constructor 'Green' of enum declaration

internal import inc1.*
internal import inc2.*

main() {
    let a = Green
    let b = Cyan
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

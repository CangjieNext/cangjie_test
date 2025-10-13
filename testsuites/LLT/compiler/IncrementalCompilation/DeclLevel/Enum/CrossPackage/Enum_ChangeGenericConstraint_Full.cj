// DEPENDENCE: %n.old.cj %n.new.cj Incr.expect

// EXEC: %mkdir %n
// EXEC: %cpfile %n.old.cj %n
// EXEC: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt %n.%lib_extension %f -o %output
// EXEC: %run %run_opt %output %run_args

// EXEC: %rmfile %n/%n.old.cj
// EXEC: %cpfile %n.new.cj %n/%n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension 2>&1 | compare Incr.expect

// EXEC: %compiler %cmp_opt %incrementalCompile %n.%lib_extension %f -o %output

// ASSERT: scan incremental compilation triggered
// ASSERT: the changed decl after Spreading is:a
// ASSERT: the changed decl after Spreading is:useType

internal import inc.*

let a = E<Int32>.A(1u32)

func useType(){
    let t : E<Int32>
    return 0
}

main() {
    useType()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: %n.old.cj %n.new.cj %n.next.cj

// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj %compile_lib_opt -o liba.%lib_extension -O2
// EXEC: %compiler %incrementalCompile %cmp_opt %f %compile_lib_opt -o libb.%lib_extension liba.%lib_extension -O2
// EXEC: %compiler %incrementalCompile %cmp_opt %n.next.cj %compile_lib_opt -o libc.%lib_extension libb.%lib_extension liba.%lib_extension -O2
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj %compile_lib_opt -o liba.%lib_extension -O2
// EXEC: %compiler %incrementalCompile %cmp_opt %f %compile_lib_opt -o libb.%lib_extension liba.%lib_extension -O2
// EXEC: %compiler %incrementalCompile %cmp_opt %n.next.cj %compile_lib_opt -o libc.%lib_extension libb.%lib_extension liba.%lib_extension -O2 2>&1 | compare %f

package b
import a.*
@Frozen
public func jar() {
    B()
}
@Frozen
public func s() {
    too()
}

// ASSERT: scan no change


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

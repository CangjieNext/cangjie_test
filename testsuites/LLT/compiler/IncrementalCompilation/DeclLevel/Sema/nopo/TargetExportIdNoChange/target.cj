// DEPENDENCE: %n.old.cj %n.new.cj %n.next.cj

// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj %compile_lib_opt -o liba.%lib_extension -O2
// EXEC: %compiler %incrementalCompile %cmp_opt %f %compile_lib_opt -o libb.%lib_extension liba.%lib_extension -O2
// EXEC: %compiler %incrementalCompile %cmp_opt %n.next.cj %compile_lib_opt -o libc.%lib_extension libb.%lib_extension liba.%lib_extension -O2
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj %compile_lib_opt -o liba.%lib_extension -O2 | compare %n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %f %compile_lib_opt -o libb.%lib_extension liba.%lib_extension -O2 | compare %f
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

// [用例意图] 看护包 b 中 func jar body 中的 refExpr 的 target(B) 的exportId 在不修改的情况下不会变化，若变化第2次编译包c 会识别到变更且编译错误
// [测试条件] 包a中的too 的 body 变化, 且不源码导出。 
// [编译顺序] 1.包 a，2.包 b，3.包c, 4.包a(修改too 的 body)，5.包b, 6.包c.
// [预期结果] 第4次编译识别到变更且 B 无变更触发增量，第5，6次识别到不变，不进行增量。

// ASSERT: scan no change

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

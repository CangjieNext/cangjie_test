// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %dump-ir-to-screen %cmp_opt %n.cj 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

public var xxx = 1
var ggg = 1

main() {
    xxx = xxx - ggg
    xxx
}

// ASSERT: scan-begin define void @_CGP7defaultilHv()
// ASSERT: scan-next
// ASSERT: regex-next bb[0-9]+:
// ASSERT: scan-next %0 = load i1, i1* @has_invoked_pkg_init_literal
// ASSERT: regex-next br i1 %0, label %bb[0-9]+, label %bb[0-9]+
// ASSERT: scan-next
// ASSERT: regex-next bb[0-9]+:
// ASSERT: scan-next ret void
// ASSERT: scan-next
// ASSERT: regex-next bb[0-9]+:
// ASSERT: scan-next store i1 true, i1* @has_invoked_pkg_init_literal
// ASSERT: scan-next call void @_CGPatilHv()
// ASSERT: scan-next call void @_CGF7defaultU00000000pSAneilHv()
// ASSERT: scan-next ret void
// ASSERT: scan-next }

/*
define void @"_CGP7defaultilHv"() #5 gc "cangjie" personality i32 (...)* @"__cj_personality_v0$" !dbg !32 {
bb5:
  %0 = load i1, i1* @has_invoked_pkg_init_literal, align 1, !dbg !33
  br i1 %0, label %bb6, label %bb7, !dbg !33

bb6:                                              ; preds = %bb5
  ret void, !dbg !33

bb7:                                              ; preds = %bb5
  store i1 true, i1* @has_invoked_pkg_init_literal, align 1, !dbg !33
  call void @_CGPatilHv(), !dbg !33
  call void @_CGF7defaultU0_ilHv(), !dbg !33
  ret void, !dbg !33
}
 */

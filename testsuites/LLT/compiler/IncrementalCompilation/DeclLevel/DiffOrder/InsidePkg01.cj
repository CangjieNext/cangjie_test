// DEPENDENCE: pkg01 pkg01next
// EXEC: %compiler %incrementalCompile %cmp_opt -p pkg01
// EXEC: %cpdir pkg01next/* pkg01
// EXEC: %compiler %incrementalCompile %cmp_opt -p pkg01 %incrementalCompile 2>&1 | compare %f

// ASSERT: scan incremental compilation triggered
// ASSERT: scan incremental sema

// ASSERT: scan the changed decl after Spreading is:a
// ASSERT: scan the changed decl after Spreading is:b
// ASSERT: scan the changed decl after Spreading is:c
// ASSERT: scan the changed decl after Spreading is:e
// ASSERT: scan-not the changed decl after Spreading is:d
// ASSERT: scan-not the changed decl after Spreading is:f

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

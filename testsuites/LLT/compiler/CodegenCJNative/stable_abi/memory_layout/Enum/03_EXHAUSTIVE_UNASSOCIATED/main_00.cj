// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %mkdir tmps
// EXEC: %compiler %cmp_opt %compile_lib_opt %disableAPC %f %save_temps_opt=tmps
// EXEC: %llvmDissembler tmps/%n.bc -o tmps/%n.ll
// EXEC-PIPE: %cat tmps/%n.ll 2>&1 | compare %f
// ASSERT: regex %enum\.Trivial = type { i32 }
// ASSERT: regex @"default:TimeUnit1\.ti" = global %TypeInfo {.*}, !RelatedType !(?P<TimeUnit1_layout_id>[0-9]+)
// ASSERT: regex !(?P=TimeUnit1_layout_id) = !{!"enum\.Trivial"}

public enum TimeUnit1 {
    Year | Month | Day | Hour
}

public let eeee = TimeUnit1.Year

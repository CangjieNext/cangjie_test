// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %mkdir tmps
// EXEC: %compiler %cmp_opt %compile_lib_opt %disableAPC %f %save_temps_opt=tmps
// EXEC: %llvmDissembler tmps/%n.bc -o tmps/%n.ll
// EXEC-PIPE: %cat tmps/%n.ll 2>&1 | compare %f
// ASSERT: regex %"ObjLayout\.default:E0:0" = type { i32, i64, i1, i32, i8 }
// ASSERT: regex %"enum\.default:E0" = type { \[18 x i8\] }
// ASSERT: regex @"default:E0\.ti" = global %TypeInfo {.*}, !RelatedType !(?P<E0_layout_id>[0-9]+)
// (not Windows)ASSERT: regex @"default:E0:0\.ti" = linkonce_odr global %TypeInfo {.*}, !RelatedType !(?P<E0_A_layout_id>[0-9]+)
// (Windows)ASSERT: regex @"default:E0:0\.ti" = global %TypeInfo {.*}, !RelatedType !(?P<E0_A_layout_id>[0-9]+)
// ASSERT: regex !(?P=E0_layout_id) = !{!"enum\.default:E0"}
// ASSERT: regex !(?P=E0_A_layout_id) = !{!"ObjLayout\.default:E0:0"}

public enum E0 {
    A(Int64, Bool, Rune, Int8)
}

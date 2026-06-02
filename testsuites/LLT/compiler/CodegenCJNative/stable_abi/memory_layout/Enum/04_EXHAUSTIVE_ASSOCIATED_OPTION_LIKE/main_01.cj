// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %mkdir tmps
// EXEC: %compiler %cmp_opt %compile_lib_opt %disableAPC %f %save_temps_opt=tmps
// EXEC: %llvmDissembler tmps/%n.bc -o tmps/%n.ll
// EXEC-PIPE: %cat tmps/%n.ll 2>&1 | compare %f
// ASSERT: regex %enum\.OptionLike\.Ref = type { i8 addrspace\(1\)\*, \[0 x i8\] }
// ASSERT: regex @"default:Option_Like_Enum_1\.ti" = global %TypeInfo {.*}, !RelatedType !(?P<Option_Like_Enum_1_layout_id>[0-9]+)
// ASSERT: regex !(?P=Option_Like_Enum_1_layout_id) = !{!"enum\.OptionLike\.Ref"}

public enum Option_Like_Enum_1 {
    Case1 | Case2(Any)
}

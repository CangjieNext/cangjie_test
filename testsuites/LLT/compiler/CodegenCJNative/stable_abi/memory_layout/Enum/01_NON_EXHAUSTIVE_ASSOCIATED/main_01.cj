// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %mkdir tmps
// EXEC: %compiler %cmp_opt %compile_lib_opt %disableAPC %f %save_temps_opt=tmps
// EXEC: %llvmDissembler tmps/%n.bc -o tmps/%n.ll
// EXEC-PIPE: %cat tmps/%n.ll 2>&1 | compare %f
// ASSERT: regex %"ObjLayout\.default:EA:0" = type { i32, i64, i1, i8 }
// ASSERT: regex %"ObjLayout\.default:EA:1" = type { i32, i64 }
// ASSERT: regex %"ObjLayout\.default:EA:2" = type { i32, i64 }
// ASSERT: regex %enum\.Common = type { i8 addrspace\(1\)\* }
// ASSERT: regex @"default:EA\.ti" = global %TypeInfo {.*}, !RelatedType !(?P<EA_layout_id>[0-9]+)
// (not Windows)ASSERT: regex @"default:EA:0\.ti" = linkonce_odr global %TypeInfo {.*}, !RelatedType !(?P<EA_Case1_layout_id>[0-9]+)
// (not Windows)ASSERT: regex @"default:EA:1\.ti" = linkonce_odr global %TypeInfo {.*}, !RelatedType !(?P<EA_Case2_layout_id>[0-9]+)
// (not Windows)ASSERT: regex @"default:EA:2\.ti" = linkonce_odr global %TypeInfo {.*}, !RelatedType !(?P<EA_Case3_layout_id>[0-9]+)
// (Windows)ASSERT: regex @"default:EA:0\.ti" = global %TypeInfo {.*}, !RelatedType !(?P<EA_Case1_layout_id>[0-9]+)
// (Windows)ASSERT: regex @"default:EA:1\.ti" = global %TypeInfo {.*}, !RelatedType !(?P<EA_Case2_layout_id>[0-9]+)
// (Windows)ASSERT: regex @"default:EA:2\.ti" = global %TypeInfo {.*}, !RelatedType !(?P<EA_Case3_layout_id>[0-9]+)
// ASSERT: regex !(?P=EA_layout_id) = !{!"enum\.Common"}
// ASSERT: regex !(?P=EA_Case1_layout_id) = !{!"ObjLayout\.default:EA:0"}
// ASSERT: regex !(?P=EA_Case2_layout_id) = !{!"ObjLayout\.default:EA:1"}
// ASSERT: regex !(?P=EA_Case3_layout_id) = !{!"ObjLayout\.default:EA:2"}

public enum EA {
    Case1(Int64, Bool, Byte) | Case2(Int) | Case3(Int) | ...
}

public let eeee = EA.Case1(100, true, b'c')

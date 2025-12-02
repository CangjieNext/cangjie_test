// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %mkdir tmps
// EXEC: %compiler %cmp_opt %compile_lib_opt %disableAPC %f %save_temps_opt=tmps
// EXEC: %llvmDissembler tmps/%n.bc -o tmps/%n.ll
// EXEC-PIPE: %cat tmps/%n.ll 2>&1 | compare %f
// ASSERT: regex %"ObjLayout\.default:EXHAUSTIVE_OTHER:0" = type { i32 }
// ASSERT: regex %"ObjLayout\.default:EXHAUSTIVE_OTHER:1" = type { i32 }
// ASSERT: regex %"ObjLayout\.default:EXHAUSTIVE_OTHER:2" = type { i32, i8 addrspace\(1\)\* }
// ASSERT: regex %enum\.Common = type { i8 addrspace\(1\)\* }
// ASSERT: regex @"default:EXHAUSTIVE_OTHER\.ti" = global %TypeInfo {.*}, !RelatedType !(?P<EXHAUSTIVE_OTHER_layout_id>[0-9]+)
// (not Windows)ASSERT: regex @"default:EXHAUSTIVE_OTHER:0\.ti" = linkonce_odr global %TypeInfo {.*}, !RelatedType !(?P<EXHAUSTIVE_OTHER_A_layout_id>[0-9]+)
// (not Windows)ASSERT: regex @"default:EXHAUSTIVE_OTHER:1\.ti" = linkonce_odr global %TypeInfo {.*}, !RelatedType !(?P<EXHAUSTIVE_OTHER_B_layout_id>[0-9]+)
// (not Windows)ASSERT: regex @"default:EXHAUSTIVE_OTHER:2\.ti" = linkonce_odr global %TypeInfo {.*}, !RelatedType !(?P<EXHAUSTIVE_OTHER_C_layout_id>[0-9]+)
// (Windows)ASSERT: regex @"default:EXHAUSTIVE_OTHER:0\.ti" = global %TypeInfo {.*}, !RelatedType !(?P<EXHAUSTIVE_OTHER_A_layout_id>[0-9]+)
// (Windows)ASSERT: regex @"default:EXHAUSTIVE_OTHER:1\.ti" = global %TypeInfo {.*}, !RelatedType !(?P<EXHAUSTIVE_OTHER_B_layout_id>[0-9]+)
// (Windows)ASSERT: regex @"default:EXHAUSTIVE_OTHER:2\.ti" = global %TypeInfo {.*}, !RelatedType !(?P<EXHAUSTIVE_OTHER_C_layout_id>[0-9]+)
// ASSERT: regex !(?P=EXHAUSTIVE_OTHER_layout_id) = !{!"enum\.Common"}
// ASSERT: regex !(?P=EXHAUSTIVE_OTHER_A_layout_id) = !{!"ObjLayout\.default:EXHAUSTIVE_OTHER:0"}
// ASSERT: regex !(?P=EXHAUSTIVE_OTHER_B_layout_id) = !{!"ObjLayout\.default:EXHAUSTIVE_OTHER:1"}
// ASSERT: regex !(?P=EXHAUSTIVE_OTHER_C_layout_id) = !{!"ObjLayout\.default:EXHAUSTIVE_OTHER:2"}

public class CCCC {
    public var x = 999
}

public enum EXHAUSTIVE_OTHER {
    A | B | C(CCCC)
}

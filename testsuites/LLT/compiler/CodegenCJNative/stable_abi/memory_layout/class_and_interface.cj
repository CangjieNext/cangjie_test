// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . -j1 --apc=1 --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: regex %"ObjLayout\.default:CA" = type { i32, i16, i64 }
// (CJNATIVE) ASSERT: regex %"ObjLayout\.default:CC" = type { i32, i16 }
// (CJNATIVE) ASSERT: regex %"ObjLayout\.default:I1" = type {}
// (CJNATIVE) ASSERT: regex @"default:CA\.ti" = global %TypeInfo {.*}, !RelatedType !(?P<CA_id>[0-9]+)
// (CJNATIVE) ASSERT: regex !(?P=CA_id) = !{!"ObjLayout\.default:CA"}
// (CJNATIVE) ASSERT: regex @"default:CC\.ti" = global %TypeInfo {.*}, !RelatedType !(?P<CC_id>[0-9]+)
// (CJNATIVE) ASSERT: regex !(?P=CC_id) = !{!"ObjLayout\.default:CC"}
// (CJNATIVE) ASSERT: regex @"default:I1\.ti" = global %TypeInfo {.*}, !RelatedType !(?P<I1_id>[0-9]+)
// (CJNATIVE) ASSERT: regex !(?P=I1_id) = !{!"ObjLayout.default:I1"}

interface I1 {}

abstract class CC <: I1 {
    var a: Int32 = 3
    var b: Int16 = 5
}

class CA <: CC {
    var c: Int64 = 9
}

let aaa: I1 = CA()

// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Darwin) EXEC: %compiler %cmp_opt %f --save-temps . -j1
// (Darwin) EXEC: %llvmDissembler %n.bc -o %n.ll
// (Darwin) EXEC: %cat %n.ll 2>&1 | compare %f
// (Darwin) ASSERT: scan call void @_CN7default3fooHaRNY_5EmptyEtY2_(%"record.default:Big"* noalias sret(%"record.default:Big") %2, i8 noundef signext 1, i16 noundef zeroext 2)

@C struct Empty {}

@C struct Big {
    var a: Int64 = 0
    var b: Int64 = 0
    var c: Int64 = 0
}

@C func foo(_: Int8, _: Empty, _: UInt16, _: Empty): Big {
    var big = Big()
    return big
}

unsafe main() {
    let empty = Empty()
    let _ = foo(Int8(1), empty, UInt16(2), empty)
}

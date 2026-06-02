// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . -j1 --apc=1 --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define i64 @_CN7default2SAIG_E3fooHb(%"record.default:SA<T>" addrspace(1)* noalias %this, i8 addrspace(1)* %"$BP", i1 %x, %TypeInfo* %outerTI)

struct SA<T> {
    var a = 1
    mut func foo(x: Bool) {
        1
    }
}

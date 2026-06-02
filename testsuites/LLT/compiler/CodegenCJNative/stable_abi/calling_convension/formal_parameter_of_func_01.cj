// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . -j1 --apc=1 --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define i32 @_CN7default6calleeHiRNY_2SAEV1_l(i32 %x, %"record.default:SA"* noalias nocapture readonly %y, [2 x i64]* noalias %z)

struct SA {
    var a = 1
}

func callee(x: Int32, y: SA, z: VArray<Int64, $2>): Int32 {
    0
}

func caller() {
    var sa = SA()
    let res = callee(5, sa, [1, 2])
    0
}

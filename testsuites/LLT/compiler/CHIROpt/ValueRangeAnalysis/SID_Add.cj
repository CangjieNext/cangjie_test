// (DEBUG_OPTION)EXEC:%compiler %enableO2 %debugCHIROpt %disableConstPropagation %f --int-overflow=throwing -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC:%run %run_opt %output

main() {
    let i0 = 0
    let i1 = 1
    let i2 = 2
    let i3 = 3
    let i4 = 4
    let im1 = -1
    let im2 = -2
    let imax = 0x7fffffffffffffff
    let imin = -0x8000000000000000

    // 7
    let res0 = i0 == i0
    let res1 = i1 == i1
    let res2 = imax == imax
    let res3 = imin == imin
    let res4 = im1 == im1
    let res5 = i0 != i1
    let res6 = imax != imin

    // 14
    let res7 = i0 + i1 == i1
    let res8 = i0 + imax == imax
    let res9 = i0 + imin == imin
    let res10 = i1 + i1 == i2
    let res11 = i2 + i2 == i4
    let res12 = i1 + i3 == i4
    let res13 = i3 + i1 == i4
    let res14 = i2 + i3 != i4
    let res15 = i3 + i2 != i4
    let res16 = imax + i0 == imax
    let res17 = imin + imax == im1
    let res18 = i4 + im2 == im2 + i4
    let res19 = imax + im1 == 0x7ffffffffffffffe
    let res20 = im2 + imax == 0x7ffffffffffffffd

    // 10
    let res21 = i0 - i1 == im1
    let res22 = im1 + im2 == -3
    let res23 = i1 - i1 == i0
    let res24 = i2 - i2 == i0
    let res25 = i2 - i0 == i2
    let res26 = i0 - i2 == im2
    let res27 = i4 - i3 == i1
    let res28 = i4 - i1 == i3
    let res29 = im1 - im2 == 1
    let res30 = 0x7ffffffffffffffe - imax == im1

    // 8
    let res31 = i1 * i2 == i2
    let res32 = i1 * i0 == i0
    let res33 = imax * i0 == i0
    let res34 = imax * im1 == imin + i1
    let res35 = i3 * i3 == 9
    let res36 = i4 * i2 == i2 * i4
    let res37 = -1 * i2 == -2
    let res38 = i0 * im1 == i0

    return
}

// ASSERT: scan [RangeAnalysis] The value of Equal at [16,16] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [17,16] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [18,16] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [19,16] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [20,16] has been set to true
// ASSERT: scan [RangeAnalysis] The value of NotEqual at [21,16] has been set to true
// ASSERT: scan [RangeAnalysis] The value of NotEqual at [22,16] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [25,16] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [26,16] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [27,16] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [28,17] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [29,17] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [30,17] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [31,17] has been set to true
// ASSERT: scan [RangeAnalysis] The value of NotEqual at [32,17] has been set to true
// ASSERT: scan [RangeAnalysis] The value of NotEqual at [33,17] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [34,17] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [35,17] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [36,17] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [37,17] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [38,17] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [41,17] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [42,17] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [43,17] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [44,17] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [45,17] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [46,17] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [47,17] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [48,17] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [49,17] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [50,17] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [53,17] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [54,17] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [55,17] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [56,17] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [57,17] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [58,17] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [59,17] has been set to true
// ASSERT: scan [RangeAnalysis] The value of Equal at [60,17] has been set to true

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

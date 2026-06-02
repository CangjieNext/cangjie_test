/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args --include-tags=UT_01+RUNNING,RUNNING,UT_05 --exclude-tags=NRUNNING | compare %f
// ASSERT: scan Test_Tag_Filter_01
// ASSERT: scan Test_Tag_Filter_02
// ASSERT: scan Test_Tag_Filter_03
// ASSERT: scan Test_Tag_Filter_04

@Test
@Tag[UT_01, RUNNING]
func Test_Tag_Filter_01() {
}

@Test
@Tag[UT_02, RUNNING]
func Test_Tag_Filter_02() {
}

@Test
@Tag[UT_03, RUNNING]
func Test_Tag_Filter_03() {
}

@Test
@Tag[UT_04, RUNNING]
func Test_Tag_Filter_04() {
}

@Test
@Tag[UT_05, NRUNNING]
func Test_Tag_Filter_05() {
    throw Exception("case should not running")
}

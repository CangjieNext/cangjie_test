/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color --show-tags 2>&1 | compare %f
// ASSERT: scan-1 TCS: MyTestSuite (tags: suiteTag), CASE: shouldPrintInheritedTagsFromEnclosingSuite (tags: case1Tag)
// ASSERT: scan-1 TCS: TestCase_shouldNotDuplicateTagsForTopLevelCase, CASE: shouldNotDuplicateTagsForTopLevelCase (tags: case2Tag)

@Test
@Tag[suiteTag]
class MyTestSuite {
    @TestCase
    @Tag[case1Tag]
    func shouldPrintInheritedTagsFromEnclosingSuite() {
        @Assert(false)
    }
}

@Test
@Tag[case2Tag]
func shouldNotDuplicateTagsForTopLevelCase() {
    @Assert(false)
}

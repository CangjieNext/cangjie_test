/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args --no-color --show-tags 2>&1 | compare %f
// ASSERT: scan-1 TestsWithTags (tags: tag0, tag1)
// ASSERT: scan-1 TestsWithTag (tags: tag1)
// ASSERT: scan-1 CASE: twoTags (tags: tag2, tag3)
// ASSERT: scan-1 CASE: oneTag (tags: tag4)
// ASSERT: scan-not CASE: noTags (tags:
// ASSERT: scan-not TestsWithoutTag (tags:
// ASSERT: scan-1 CASE: oneTag (tags: tag5)
// ASSERT: scan-not TestCase_topLevel (tags:
// ASSERT: scan-1 CASE: topLevel (tags: tag6, tag7)

@Test
@Tag[tag0, tag1]
class TestsWithTags {
    @TestCase
    func noTags() {}
}

@Test
@Tag[tag1]
class TestsWithTag {
    @TestCase
    @Tag[tag2, tag3]
    func twoTags() {}

    @TestCase
    @Tag[tag4]
    func oneTag() {}

    @TestCase
    func noTags() {}
}

@Test
class TestsWithoutTag {
    @TestCase
    @Tag[tag5]
    func oneTag() {}

    @TestCase
    func noTags() {}
}

@Test
@Tag[tag6, tag7]
func topLevel() {}

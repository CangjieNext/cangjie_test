/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color --show-tags --bench 2>&1 | compare %f
// ASSERT: scan-1 Starting the benchmark `MyTestSuite.oneTag()` (tags: suiteTag1, suiteTag2, tag3).
// ASSERT: scan-1 Starting the benchmark `MyTestSuite.noTags()` (tags: suiteTag1, suiteTag2).
// ASSERT: scan-1 TCS: MyTestSuite (tags: suiteTag1, suiteTag2), time elapsed
// ASSERT: scan-1 [ PASSED ] CASE: oneTag (tags: tag3)
// ASSERT: scan-1 [ FAILED ] CASE: negative (tags: negativeTag)
// ASSERT: scan-1 TCS: MyTestSuite (tags: suiteTag1, suiteTag2), CASE: negative (tags: negativeTag)

@Test
@Tag[suiteTag1, suiteTag2]
@Configure[warmup: Duration.nanosecond, minDuration: Duration.nanosecond]
class MyTestSuite {
    @Bench
    @Tag[tag3]
    func oneTag() {}

    @Bench
    func noTags() {}

    @Bench
    @Tag[negativeTag]
    func negative() {
        @Expect(false)
    }
}

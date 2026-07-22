/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

@Test
public class RangeIsEmptyTest {
    @TestCase
    func test_isEmpty_closed_step_positive(): Unit {
        // isClosed=true, step>0: empty when start > end
        @Expect(Range<Int64>(5, 3, 1, true, true, true).isEmpty())
        @Expect(!Range<Int64>(3, 5, 1, true, true, true).isEmpty())
        @Expect(!Range<Int64>(3, 3, 1, true, true, true).isEmpty())
    }

    @TestCase
    func test_isEmpty_closed_step_negative(): Unit {
        // isClosed=true, step<0: empty when start < end
        @Expect(Range<Int64>(3, 5, -1, true, true, true).isEmpty())
        @Expect(!Range<Int64>(5, 3, -1, true, true, true).isEmpty())
        @Expect(!Range<Int64>(3, 3, -1, true, true, true).isEmpty())
    }

    @TestCase
    func test_isEmpty_open_step_positive(): Unit {
        // isClosed=false, step>0: empty when start >= end
        @Expect(Range<Int64>(5, 3, 1, true, true, false).isEmpty())
        @Expect(Range<Int64>(3, 3, 1, true, true, false).isEmpty())
        @Expect(!Range<Int64>(3, 5, 1, true, true, false).isEmpty())
    }

    @TestCase
    func test_isEmpty_open_step_negative(): Unit {
        // isClosed=false, step<0: empty when start <= end
        @Expect(Range<Int64>(3, 5, -1, true, true, false).isEmpty())
        @Expect(Range<Int64>(3, 3, -1, true, true, false).isEmpty())
        @Expect(!Range<Int64>(5, 3, -1, true, true, false).isEmpty())
    }

    @TestCase
    func test_isEmpty_normal_ranges(): Unit {
        @Expect(!(0..10).isEmpty())
        @Expect((10..0).isEmpty())
        @Expect(!(0..10 : 2).isEmpty())
        @Expect(!(10..0 : -2).isEmpty())
    }

    @TestCase
    func test_iterator_non_unit_step(): Unit {
        // Test iterator with step=2 to cover last() remainder path
        var sum = 0
        for (i in 0..10 : 2) {
            sum += i
        }
        @Expect(sum, 0 + 2 + 4 + 6 + 8)

        // Step=-2 descending
        var sum2 = 0
        for (i in 10..0 : -2) {
            sum2 += i
        }
        @Expect(sum2, 10 + 8 + 6 + 4 + 2)
    }

    @TestCase
    func test_iterator_closed_non_unit_step(): Unit {
        // Closed range with non-unit step
        var sum = 0
        for (i in Range<Int64>(0, 10, 2, true, true, true)) {
            sum += i
        }
        @Expect(sum, 0 + 2 + 4 + 6 + 8 + 10)
    }


    @TestCase
    func test_iterator_empty_range(): Unit {
        var count = 0
        for (_ in 10..0) {
            count++
        }
        @Expect(count, 0)
    }

    @TestCase
    func test_iterator_single_element_closed(): Unit {
        var count = 0
        for (_ in Range<Int64>(5, 5, 1, true, true, true)) {
            count++
        }
        @Expect(count, 1)
    }
}

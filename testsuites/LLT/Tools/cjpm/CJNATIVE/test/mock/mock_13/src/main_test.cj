// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package b

internal import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

@Test
class CalculateParallelTest {
    @TestCase
    func test_to_be_benched_with_mock_1(): Unit {
        let m = mock<ParallaToMock>()
        let res = getCpus()
        let value = 1
        @On(m.calculateParallel(value)).returns(res)

        @Expect(m.calculateParallel(value) == res)
    }

    @TestCase
    func test_to_be_benched_with_mock_3(): Unit {
        let m = mock<ParallaToMock>()
        let value = 3
        let res = 2 * getCpus() / value
        @On(m.calculateParallel(value)).returns(res)

        @Expect(m.calculateParallel(value) == res)
    }
}

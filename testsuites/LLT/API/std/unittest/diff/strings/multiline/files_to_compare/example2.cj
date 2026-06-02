/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
@Test
public class VerifyMisconfigurationTest {
    public override func beforeAll(): Unit {
        @On(e.a()).returns("").anyTimes()
        @On(e.b()).returns("").anyTimes()
        @On(e.i1(_)).returns(()).anyTimes()
        @On(e.i2(_)).returns(()).anyTimes()
        @On(e.s1(_)).returns(()).anyTimes()
        @On(e.s2(_)).returns(()).anyTimes()
        @On(eln.a()).returns("").anyTimes()
    }

    private let e = mock<Example1>()
    private let eln = mock<Example_LN>()

    @TestCase
    func testArgThatCapturingMatcher(): Unit {
        success {
            misconfigurationFailure(
                "Cannot use capture(valueListener) as part of statement e.p(capture(valueListener))" +
                    " declared at line_numbers.cj:154") {
                Verify.that(invalidMatchersForCalledMacro(eln))
            }
        }
    }
}

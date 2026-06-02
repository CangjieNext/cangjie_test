/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

@Test
public class Test {
    @TestCase
    func case1() {
        @Expect("abcd\neeee\nffff", 
                "abcd\nffff")
    }
    @TestCase
    func case2() {
        @Expect("abcd\neeee\nffff", 
                "ffff ffff")
    }
    @TestCase
    func case3() {
        @Expect("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", 
                "ffff\nffff")
    }
    @TestCase
    func case4() {
        let a = "t\nest1"
        let b = "test2"
        @Expect(
                a +
                b,
                b
                + a)
    }
    @TestCase
    func case5() {
        @Expect("abcd\neeee\nffff".replace("\n", " "), 
                "abcd\nffff".replace("\n", " "))
    }
    @TestCase
    func case6() {
        @Expect("abcd\\neeee\\\nffff".replace("\n", " "), 
                "abcd\nffff".replace("\n", " "))
    }
    @TestCase
    func case7() {
        @Expect("t\nest1".test(), "sdfg\t sdgf \t fff \v".test())
    }
}

extend String {
    func test() {
        A()
    }
}

class A <: ToString & Equatable<A> {
    static var i = 0
    public override func toString() {
        i++
        "t\nest1${i}"
    }
    public operator override func ==(another: A) {
        return false
    }
    public operator override func !=(another: A) {
        return true
    }
}

/* SCAN-IN
    Expect Failed: {COLOR=YELLOW}"abcd\neeee\nffff"{/COLOR} != {COLOR=YELLOW}"abcd\nffff"{/COLOR} (multiline difference below)
         {COLOR=GRAY}abcd{/COLOR}
{COLOR=RED}        -eeee{/COLOR}
         {COLOR=GRAY}ffff{/COLOR}
 */

/* SCAN-IN
    Expect Failed: {COLOR=YELLOW}"abcd\neeee\nffff"{/COLOR} != {COLOR=YELLOW}"ffff ffff"{/COLOR} (multiline difference below)
{COLOR=RED}        -abcd{/COLOR}
{COLOR=RED}        -eeee{/COLOR}
{COLOR=RED}        -ffff{/COLOR}
{COLOR=GREEN}        +ffff ffff{/COLOR}
 */

/* SCAN-IN
    Expect Failed: {COLOR=YELLOW}"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."{/COLOR} != {COLOR=YELLOW}"ffff\nffff"{/COLOR} (multiline difference below)
{COLOR=RED}        -Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.{/COLOR}
{COLOR=GREEN}        +ffff{/COLOR}
{COLOR=GREEN}        +ffff{/COLOR}
 */

/* SCAN-IN
    Expect Failed: {COLOR=YELLOW}a + b{/COLOR} != {COLOR=YELLOW}b + a{/COLOR} (multiline difference below)
{COLOR=RED}        -t{/COLOR}
{COLOR=RED}        -est1test2{/COLOR}
{COLOR=GREEN}        +test2t{/COLOR}
{COLOR=GREEN}        +est1{/COLOR}
 */

/* SCAN-IN
    Expect Failed: {COLOR=YELLOW}"abcd\neeee\nffff".replace("\n", " "){/COLOR} != {COLOR=YELLOW}"abcd\nffff".replace("\n", " "){/COLOR}
        "abcd\neeee\nffff".replace("\n", " "): "abcd{COLOR=RED} eeee{/COLOR} ffff"
              "abcd\nffff".replace("\n", " "): "abcd{COLOR=RED}·····{/COLOR} ffff"
                                                ===={COLOR=RED}-----{/COLOR}=====
 */

/* SCAN-IN
    Expect Failed: `({COLOR=YELLOW}"t\nest1".test(){/COLOR} == {COLOR=YELLOW}"sdfg\t sdgf \t fff \v".test(){/COLOR})`
       left: t
est11
      right: t
est12
 */

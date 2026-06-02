/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let a = "Please, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the apple"
        let b = "Please, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an applePlease, Give me an apple"
        @Assert(a, b)
    }
    @TestCase
    func case2(): Unit {
        let a = "Please, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the apple"
        let b = "Please, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me th1 applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the apple"
        @Assert(a, b)
    }
    @TestCase
    func case3(): Unit {
        let a = "Please, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me th1 applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the bpplePlease, give me the applePlease, give me the appl1"
        let b = "Please, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me th1 applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the bpplePlease, give me the applePlease, give me the appl2"
        @Assert(a, b)
    }
    @TestCase
    func case4(): Unit {
        let a = "Please, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me th1 applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the bpplePlease, give me the applePlease, give me the appl1"
        let b = " lease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me th1 applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the bpplePlease, give me the applePlease, give me the appl1"
        @Assert(a, b)
    }
    @TestCase
    func case5(): Unit {
        let a = "Please, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the apple"
        let b = "lease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the apple"
        @Assert(a, b)
    }
    @TestCase
    func case6(): Unit {
        let a = "Please, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the apple"
        let b = " me the applePlease, give me the applePlease, give me the applePlease, give me the apple"
        @Assert(a, b)
    }
    @TestCase
    func case7(): Unit {
        let a = "Please, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the apple"
        let b = " give me the apple"
        @Assert(a, b)
    }
    @TestCase
    func case8(): Unit {
        let a = "Please, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the apple"
        let b = "e"
        @Assert(a, b)
    }
    @TestCase
    func case9(): Unit {
        let b = "Please, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the apple"
        let a = "lease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the apple"
        @Assert(a, b)
    }
    @TestCase
    func case10(): Unit {
        let a = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaae"
        let b = "e"
        @Assert(a, b)
    }
    @TestCase
    func case11(): Unit {
        let a = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaae"
        let b = "e"
        @Assert(a, b)
    }
    @TestCase
    func case12(): Unit {
        let a = "nljkasdljnfsdklfdjndsklfjknjafsnadfjaksdnfkjasjdfl;kajsdf;lkjsadflk;jaslk;djnljkasdljnfsdklfdjndsklfjknjafsnadfjaksdnfkjasjdfl;kajsdf;lkjsadflk;jaslk;djnljkasdljnfsdklfdjndsklfjknjafsnadfjaksdnfkjasjdfl;kajsdf;lkjsadflk;jaslk;djnljkasdljnfsdklfdjndsklfjknjafsnadfjaksdnfkjasjdfl;kajsdf;lkjsadflk;jaslk;dj"
        let b = "nljkasdljnfsdklfdjndsklfjknjaf2nadfjaksdnfkj45jdfl;kajsdf;lkjsadflk;jaslk;djnljkasdljnfsdklfdjndsklfjknjaf2nadfjakfl;kajsdf;lkjsadflk;jaslk;djnljkasdljnfsdklfdjndsklfjknjaf2nadfjaksdnfkj45jdfl;kajsdf;lkjsadflk;jaslk;djnljkasdljnfsdklfdjndsklfjknjaf2nadfjaksdnfkj45jdfl;kajsdf;lkjsadflk;jaslk;djnljkasdljnfsdklfdjndsklfjknjaf2nadfjaksdnfkj45jdfl;kajsdf;lkjsadflk;jaslk;dj"
        @Assert(a, b)
    }
}

/* SCAN-IN
    Assert Failed: a != b
        a: "Please, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the apple..."
        b: "Please, Give me ·an applePlease, Give me ·an applePlease, Give me ·an applePlease, Give me ·an applePlease, Give me ·an applePlease, Give me ·an apple..."
            ========!=======-!!==============!=======-!!==============!=======-!!==============!=======-!!==============!=======-!!==============!=======-!!======
 */

/* SCAN-IN
    Assert Failed: a != b
        a: "(588 characters omitted...)me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, ..."
        b: "(588 characters omitted...)me th1 applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, ..."
                                       =====!===========================================================================================================================================
 */

/* SCAN-IN
    Assert Failed: a != b
        a: "(769 characters omitted...) appl1"
        b: "(769 characters omitted...) appl2"
                                       =====!
 */

/* SCAN-IN
    Assert Failed: a != b
        a: "Please, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the apple..."
        b: " lease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the apple..."
            !=====================================================================================================================================================
 */

/* SCAN-IN
    Assert Failed: a != b
        a: "Please, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the apple..."
        b: "·lease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the apple..."
            -=====================================================================================================================================================
 */

/* SCAN-IN
    Assert Failed: a != b
        a: "Please, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the apple..."
        b: "······························································ me the applePlease, give me the applePlease, give me the applePlease, give me the apple"
            --------------------------------------------------------------========================================================================================
 */

/* SCAN-IN
    Assert Failed: a != b
        a: "Please, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the apple..."
        b: " give me the apple"
 */

/* SCAN-IN
    Assert Failed: a != b
        a: "Please, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the apple..."
        b: "e"
 */

/* SCAN-IN
    Assert Failed: a != b
        a: "·lease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the apple..."
        b: "Please, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the apple..."
            +=====================================================================================================================================================
 */

/* SCAN-IN
    Assert Failed: a != b
        a: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaae"
        b: "e"
 */

/* SCAN-IN
    Assert Failed: a != b
        a: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa..."
        b: "e"
 */

/* SCAN-IN
    Assert Failed: a != b
        a: "(25 characters omitted...)knjafsnadfjaksdnfkjasjdfl;kajsdf;lkjsadflk;jaslk;djnljkasdljnfsdklfdjndsklfjknjafsnadfjaksdnfkjasjdfl;kajsdf;lkjsadflk;jaslk;djnljkasdljnfsdklfdj·····..."
        b: "(25 characters omitted...)knjaf2nadfjaksdnfkj45jdfl;kajsdf;lkjsadflk;jaslk;djnljkasdljnfsdklfdjndsklfjknjaf2nadfja·····k·····fl;kajsdf;lkjsadflk;jaslk;djnljkasdljnfsdklfdjndskl..."
                                      =====!=============!!============================================================!======-----=-----==============================================+++++
 */

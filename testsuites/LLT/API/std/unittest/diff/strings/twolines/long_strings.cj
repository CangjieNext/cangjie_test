/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

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
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "Please, {COLOR=YELLOW}g{/COLOR}ive me {COLOR=RED}t{/COLOR}{COLOR=YELLOW}he{/COLOR} applePlease, {COLOR=YELLOW}g{/COLOR}ive me {COLOR=RED}t{/COLOR}{COLOR=YELLOW}he{/COLOR} applePlease, {COLOR=YELLOW}g{/COLOR}ive me {COLOR=RED}t{/COLOR}{COLOR=YELLOW}he{/COLOR} applePlease, {COLOR=YELLOW}g{/COLOR}ive me {COLOR=RED}t{/COLOR}{COLOR=YELLOW}he{/COLOR} applePlease, {COLOR=YELLOW}g{/COLOR}ive me {COLOR=RED}t{/COLOR}{COLOR=YELLOW}he{/COLOR} applePlease, {COLOR=YELLOW}g{/COLOR}ive me {COLOR=RED}t{/COLOR}{COLOR=YELLOW}he{/COLOR} apple..."
        b: "Please, {COLOR=YELLOW}G{/COLOR}ive me {COLOR=RED}·{/COLOR}{COLOR=YELLOW}an{/COLOR} applePlease, {COLOR=YELLOW}G{/COLOR}ive me {COLOR=RED}·{/COLOR}{COLOR=YELLOW}an{/COLOR} applePlease, {COLOR=YELLOW}G{/COLOR}ive me {COLOR=RED}·{/COLOR}{COLOR=YELLOW}an{/COLOR} applePlease, {COLOR=YELLOW}G{/COLOR}ive me {COLOR=RED}·{/COLOR}{COLOR=YELLOW}an{/COLOR} applePlease, {COLOR=YELLOW}G{/COLOR}ive me {COLOR=RED}·{/COLOR}{COLOR=YELLOW}an{/COLOR} applePlease, {COLOR=YELLOW}G{/COLOR}ive me {COLOR=RED}·{/COLOR}{COLOR=YELLOW}an{/COLOR} apple..."
            ========{COLOR=YELLOW}!{/COLOR}======={COLOR=RED}-{/COLOR}{COLOR=YELLOW}!!{/COLOR}=============={COLOR=YELLOW}!{/COLOR}======={COLOR=RED}-{/COLOR}{COLOR=YELLOW}!!{/COLOR}=============={COLOR=YELLOW}!{/COLOR}======={COLOR=RED}-{/COLOR}{COLOR=YELLOW}!!{/COLOR}=============={COLOR=YELLOW}!{/COLOR}======={COLOR=RED}-{/COLOR}{COLOR=YELLOW}!!{/COLOR}=============={COLOR=YELLOW}!{/COLOR}======={COLOR=RED}-{/COLOR}{COLOR=YELLOW}!!{/COLOR}=============={COLOR=YELLOW}!{/COLOR}======={COLOR=RED}-{/COLOR}{COLOR=YELLOW}!!{/COLOR}======
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "(588 characters omitted...)me th{COLOR=YELLOW}e{/COLOR} applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, ..."
        b: "(588 characters omitted...)me th{COLOR=YELLOW}1{/COLOR} applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, ..."
                                       ====={COLOR=YELLOW}!{/COLOR}===========================================================================================================================================
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "(769 characters omitted...) appl{COLOR=YELLOW}1{/COLOR}"
        b: "(769 characters omitted...) appl{COLOR=YELLOW}2{/COLOR}"
                                       ====={COLOR=YELLOW}!{/COLOR}
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=YELLOW}P{/COLOR}lease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the apple..."
        b: "{COLOR=YELLOW} {/COLOR}lease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the apple..."
            {COLOR=YELLOW}!{/COLOR}=====================================================================================================================================================
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=RED}P{/COLOR}lease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the apple..."
        b: "{COLOR=RED}·{/COLOR}lease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the apple..."
            {COLOR=RED}-{/COLOR}=====================================================================================================================================================
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=RED}Please, give me the applePlease, give me the applePlease, give{/COLOR} me the applePlease, give me the applePlease, give me the applePlease, give me the apple..."
        b: "{COLOR=RED}······························································{/COLOR} me the applePlease, give me the applePlease, give me the applePlease, give me the apple"
            {COLOR=RED}--------------------------------------------------------------{/COLOR}========================================================================================
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=YELLOW}Please, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the apple...{/COLOR}"
        b: "{COLOR=YELLOW} give me the apple{/COLOR}"
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=YELLOW}Please, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the apple...{/COLOR}"
        b: "{COLOR=YELLOW}e{/COLOR}"
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=GREEN}·{/COLOR}lease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the apple..."
        b: "{COLOR=GREEN}P{/COLOR}lease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the applePlease, give me the apple..."
            {COLOR=GREEN}+{/COLOR}=====================================================================================================================================================
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=YELLOW}aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaae{/COLOR}"
        b: "{COLOR=YELLOW}e{/COLOR}"
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "{COLOR=YELLOW}aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa...{/COLOR}"
        b: "{COLOR=YELLOW}e{/COLOR}"
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR}
        a: "(25 characters omitted...)knjaf{COLOR=YELLOW}s{/COLOR}nadfjaksdnfkj{COLOR=YELLOW}as{/COLOR}jdfl;kajsdf;lkjsadflk;jaslk;djnljkasdljnfsdklfdjndsklfjknjaf{COLOR=YELLOW}s{/COLOR}nadfja{COLOR=RED}ksdnf{/COLOR}k{COLOR=RED}jasjd{/COLOR}fl;kajsdf;lkjsadflk;jaslk;djnljkasdljnfsdklfdj{COLOR=GREEN}·····{/COLOR}..."
        b: "(25 characters omitted...)knjaf{COLOR=YELLOW}2{/COLOR}nadfjaksdnfkj{COLOR=YELLOW}45{/COLOR}jdfl;kajsdf;lkjsadflk;jaslk;djnljkasdljnfsdklfdjndsklfjknjaf{COLOR=YELLOW}2{/COLOR}nadfja{COLOR=RED}·····{/COLOR}k{COLOR=RED}·····{/COLOR}fl;kajsdf;lkjsadflk;jaslk;djnljkasdljnfsdklfdj{COLOR=GREEN}ndskl{/COLOR}..."
                                      ====={COLOR=YELLOW}!{/COLOR}============={COLOR=YELLOW}!!{/COLOR}============================================================{COLOR=YELLOW}!{/COLOR}======{COLOR=RED}-----{/COLOR}={COLOR=RED}-----{/COLOR}=============================================={COLOR=GREEN}+++++{/COLOR}
 */

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./files_to_compare
// EXEC: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

import std.collection.*
import std.fs.*
import std.unittest.*
import std.unittest.testmacro.*
import std.io.*

@Test
public class TestA {
    @TestCase
    func case1(): Unit {
        let a = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\nIt was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        let b = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum hasn't been the industry's standard dummy text ever since the 1500s, when an known printer took the galley of type and scrambled it to make a type specimen book.\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\nIt was popularised in the 1950s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker excluding versions of Lorem Ipsum."
        @Assert(a, b)
    }
    @TestCase
    func case2(): Unit {
        let a = "1\n2\n3\n4\n5\n6\n"
        let b = "1\n2\n5\n6\n "
        @Assert(a, b)
    }
    @TestCase
    func case3(): Unit {
        let a = "abc\nabcd\nabcde\nabcdef\nabcdefg\nabcdefgh\nabcdefghj"
        let b = "_bc\nabcd\nabcde\nabcdef\nabcdefg\nabcdefgh\nabcdefghi"
        @Assert(a, b)
    }
    @TestCase
    func case4(): Unit {
        let str1 = String.fromUtf8(readToEnd(File("./files_to_compare/example1.cj", Read)))
        let str2 = String.fromUtf8(readToEnd(File("./files_to_compare/example2.cj", Read)))
        @Expect(str1, str2)
    }
    @TestCase
    func case5(): Unit {
        let a = "abc\nabcd\nabcde\nabcdef\nabcdefg\nabcdefgh\nabcdefghj"
        let b = "abc\nabcd\nabcde\r\nabcdef\nabcdefg\nabcdefgh\nabcdefghj"
        @Assert(a, b)
    }
    @TestCase
    func case6(): Unit {
        let a = "abc\r\nabcd\r\nabcde\r\nabcdef\r\nabcdefg\r\nabcdefgh\r\nabcdefghj"
        let b = "abc\nabcd\nabcde\nabcdef\nabcdefg\nabcdefgh\nabcdefghj"
        @Assert(a, b)
    }
    @TestCase
    func case7(): Unit {
        let a = "abc\nabcd\nabcde\nabcdef\nabcdefg\r\nabcdefgh\nabcdefghj"
        let b = "abc\r\nabcd\r\nabcde\r\nabcdef\r\nabcdefg\r\nabcdefgh\r\nabcdefghj"
        @Assert(a, b)
    }
    @TestCase
    func case8(): Unit {
        let a = ###"
let a = "123456789101112131415161718"
        "###
        let b = ###"
var a = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        "###
        @Assert(a, b)
    }
}

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR} (multiline difference below)
         {COLOR=GRAY}Lorem Ipsum is simply dummy text of the printing and typesetting industry.{/COLOR}
        -Lorem Ipsum has{COLOR=GREEN}···{/COLOR} been the industry's standard dummy text ever since the 1500s, when an {COLOR=RED}un{/COLOR}known printer took {COLOR=GREEN}··{/COLOR}{COLOR=YELLOW}a{/COLOR} galley of type and scrambled it to mak...
        +Lorem Ipsum has{COLOR=GREEN}n't{/COLOR} been the industry's standard dummy text ever since the 1500s, when an {COLOR=RED}··{/COLOR}known printer took {COLOR=GREEN}th{/COLOR}{COLOR=YELLOW}e{/COLOR} galley of type and scrambled it to mak...
         ==============={COLOR=GREEN}+++{/COLOR}======================================================================={COLOR=RED}--{/COLOR}==================={COLOR=GREEN}++{/COLOR}{COLOR=YELLOW}!{/COLOR}=======================================
         {COLOR=GRAY}It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.{/COLOR}
        -(23 characters omitted...)he 19{COLOR=YELLOW}6{/COLOR}0s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageM...
        +(23 characters omitted...)he 19{COLOR=YELLOW}5{/COLOR}0s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageM...
                                   ====={COLOR=YELLOW}!{/COLOR}===========================================================================================================================================
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR} (multiline difference below)
         {COLOR=GRAY}1{/COLOR}
         {COLOR=GRAY}2{/COLOR}
{COLOR=RED}        -3{/COLOR}
{COLOR=RED}        -4{/COLOR}
         {COLOR=GRAY}5{/COLOR}
         {COLOR=GRAY}6{/COLOR}
{COLOR=RED}        -{/COLOR}
{COLOR=GREEN}        + {/COLOR}
 */

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR} (multiline difference below)
{COLOR=RED}        -abc{/COLOR}
{COLOR=GREEN}        +_bc{/COLOR}
         {COLOR=GRAY}abcd{/COLOR}
{COLOR=GRAY}        (...3 equal lines skipped...){/COLOR}
         {COLOR=GRAY}abcdefgh{/COLOR}
        -abcdefgh{COLOR=YELLOW}j{/COLOR}
        +abcdefgh{COLOR=YELLOW}i{/COLOR}
         ========{COLOR=YELLOW}!{/COLOR}
 */

/* SCAN-IN
    Expect Failed: {COLOR=YELLOW}str1{/COLOR} != {COLOR=YELLOW}str2{/COLOR} (multiline difference below)
{COLOR=GRAY}        (...11 equal lines skipped...){/COLOR}
         {COLOR=GRAY}        @On(e.b()).returns("").anyTimes(){/COLOR}
{COLOR=RED}        -        @On(e.c()).returns("").anyTimes(){/COLOR}
         {COLOR=GRAY}        @On(e.i1(_)).returns(()).anyTimes(){/COLOR}
{COLOR=GRAY}        (...13 equal lines skipped...){/COLOR}
         {COLOR=GRAY}                "Cannot use capture(valueListener) as part of statement e.p(capture(valueListener))" +{/COLOR}
        -                    " declared at line_numbers.cj:1{COLOR=YELLOW}4{/COLOR}4") {
        +                    " declared at line_numbers.cj:1{COLOR=YELLOW}5{/COLOR}4") {
         ==================================================={COLOR=YELLOW}!{/COLOR}=====
{COLOR=RED}        -                {/COLOR}
{COLOR=GREEN}        +                Verify.that(invalidMatchersForCalledMacro(eln)){/COLOR}
         {COLOR=GRAY}            }{/COLOR}
{COLOR=GRAY}        (...3 equal lines skipped...){/COLOR}
*/

/* SCAN-IN
    Assert Failed: {COLOR=YELLOW}a{/COLOR} != {COLOR=YELLOW}b{/COLOR} (multiline difference below)
         {COLOR=GRAY}{/COLOR}
{COLOR=RED}        -let a = "123456789101112131415161718"{/COLOR}
{COLOR=GREEN}        +var a = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"{/COLOR}
 */

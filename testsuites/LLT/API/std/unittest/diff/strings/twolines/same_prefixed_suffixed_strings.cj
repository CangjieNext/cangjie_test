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
        let a = "IELTS sample test questions. Official practice and sample questions and answers. We have a range of materials to help you do well in your IELTS test"
        let b = "IELTS sample test questions. Official practice aren't going to be answers unfortunately."
        @Assert(a, b)
    }
    @TestCase
    func case2(): Unit {
        let a = "IELTS sample test questions. Official practice and sample questions and answers. We have a range of materials to help you do well in your IELTS test"
        let b = "help you do well in your IELTS test"
        @Assert(a, b)
    }
}

/* SCAN-IN
    Assert Failed: a != b
        a: "IELTS sample test questions. Official practice a··n·d sample questions and answers. We have a range of materials to help you do well in your IELTS tes"
        b: "IELTS sample test questions. Official practice aren't ·going ····t·o·· ·be answers··········· ·un····f·ort·una···t···el··y.···························"
            ================================================++=+!=-!!!!!=----=-=--=-!!========-----------=-!=----=-!!=-!!=---=---==--=!---------------------------
 */

/* SCAN-IN
    Assert Failed: a != b
        a: "IELTS sample test questions. Official practice and sample questions and answers. We have a range of materials to help you do well in your IELTS test"
        b: "·················································································································help you do well in your IELTS test"
            -----------------------------------------------------------------------------------------------------------------===================================
 */

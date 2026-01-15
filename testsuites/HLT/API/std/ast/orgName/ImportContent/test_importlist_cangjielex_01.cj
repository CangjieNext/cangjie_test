/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %use_ast %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

var input: Tokens = quote(import std.ast.a)

@Test
class test_01{
    @TestCase
func test_importList() {
    let tks = cangjieLex(##"import std.ast.a
import a_a_a_a
public import org1::std.ast.userdefine
public import org1::userdefine
import std.ast.a.*
import abc.*
import org_a::pkgA.pkgB.pkgC.*
import org_a::pkgA.*
import std.ast.a as abcd
import a as abcd
import org_1::std.ast.a as abcd
import org_1::a as abcd
import std.ast.{a1, a.b1.*, a.c1 as c2}
import org_1::std.ast.{a1, a.b1.*, a.c1 as c2}
import {a1.b1, a.*, a.c1 as c2}
import org_1::{a1.b1, a.*, a.c1 as c2}
import {org_1::a1.b1, a.*, org_1::a.c1 as c2}"##)
    @Assert(tks.toString(), ##"import std.ast.a
import a_a_a_a
public import org1 :: std.ast.userdefine
public import org1 :: userdefine
import std.ast.a.*
import abc.*
import org_a :: pkgA.pkgB.pkgC.*
import org_a :: pkgA.*
import std.ast.a as abcd
import a as abcd
import org_1 :: std.ast.a as abcd
import org_1 :: a as abcd
import std.ast.{ a1, a.b1.*, a.c1 as c2 }
import org_1 :: std.ast.{ a1, a.b1.*, a.c1 as c2 }
import { a1.b1, a.*, a.c1 as c2 }
import org_1 :: { a1.b1, a.*, a.c1 as c2 }
import { org_1 :: a1.b1, a.*, org_1 :: a.c1 as c2 }"##)
}
}
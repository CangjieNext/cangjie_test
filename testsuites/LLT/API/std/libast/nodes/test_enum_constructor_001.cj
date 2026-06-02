// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %run %run_opt %n.%suffix %run_args

import std.ast.*

/* return false if failed*/
func testEnumConstructor(): Bool {
    let enumDecl = parseDecl(quote(enum E { CTOR })) as EnumDecl ?? return false
    compareTokens(quote(CTOR), enumDecl.constructors[0].toTokens())
}

/* return false if failed*/
func testEnumConstructorArg1(): Bool {
    let enumDecl = parseDecl(quote(enum E { CTOR(Int32) })) as EnumDecl ?? return false
    compareTokens(quote(CTOR(Int32)), enumDecl.constructors[0].toTokens())
}

/* return false if failed*/
func testEnumConstructorArgs2(): Bool {
    let enumDecl = parseDecl(quote(enum E { CTOR(Int32, Int32) })) as EnumDecl ?? return false
    compareTokens(quote(CTOR(Int32, Int32)), enumDecl.constructors[0].toTokens())
}

/* return false if failed*/
func testEnumConstructorArgs3(): Bool {
    let enumDecl = parseDecl(quote(enum E { CTOR(Int32, Int32, Int32) })) as EnumDecl ?? return false
    compareTokens(quote(CTOR(Int32, Int32, Int32)), enumDecl.constructors[0].toTokens())
}

/* return false if failed*/
func testEnumConstructorArgsPos(): Bool {
    let ctorTokens = quote(CTOR(Int32, Int32, Int32))
    let enumTokens = quote(enum E { $(ctorTokens) })
    let enumDecl = parseDecl(enumTokens) as EnumDecl ?? return false
    let parsedCtorTokens = enumDecl.constructors[0].toTokens()

    if (ctorTokens.size != parsedCtorTokens.size) {
        return false
    }
    for (i in 0..ctorTokens.size) {
        if (ctorTokens[i].kind != COMMA) {
            continue
        }
        let expPos = ctorTokens[i].pos
        let actPos = parsedCtorTokens[i].pos
        if (expPos.fileID != actPos.fileID || expPos.line != actPos.line || expPos.column != actPos.column) {
            return false
        }
    }

    true
}

main(): Int64 {
    if (!testEnumConstructor()) {
        return 1
    }
    if (!testEnumConstructorArg1()) {
        return 2
    }
    if (!testEnumConstructorArgs2()) {
        return 3
    }
    if (!testEnumConstructorArgs3()) {
        return 4
    }
    if (!testEnumConstructorArgsPos()) {
        return 5
    }

    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

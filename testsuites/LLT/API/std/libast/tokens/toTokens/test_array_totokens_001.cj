// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args
internal import std.ast.*

func testToTokensInt8() {
    var arr: Array<Int8> = [1, 2, 3]
    var tksize = arr.toTokens().size
    if (tksize != 7) {
        return 1
    }
    return 0
}

func testToTokensInt16() {
    var arr: Array<Int16> = [1, 2, 3]
    var tksize = arr.toTokens().size
    if (tksize != 7) {
        return 1
    }
    return 0
}

func testToTokensInt32() {
    var arr: Array<Int32> = [1, 2, 3]
    var tksize = arr.toTokens().size
    if (tksize != 7) {
        return 1
    }
    return 0
}

func testToTokensInt64() {
    var arr: Array<Int64> = [1, 2, 3]
    var tksize = arr.toTokens().size
    if (tksize != 7) {
        return 1
    }
    return 0
}

func testToTokensUInt8() {
    var arr: Array<UInt8> = [1, 2, 3]
    var tksize = arr.toTokens().size
    if (tksize != 7) {
        return 1
    }
    return 0
}

func testToTokensUInt16() {
    var arr: Array<UInt16> = [1, 2, 3]
    var tksize = arr.toTokens().size
    if (tksize != 7) {
        return 1
    }
    return 0
}

func testToTokensUInt32() {
    var arr: Array<UInt32> = [1, 2, 3]
    var tksize = arr.toTokens().size
    if (tksize != 7) {
        return 1
    }
    return 0
}

func testToTokensUInt64() {
    var arr: Array<UInt64> = [1, 2, 3]
    var tksize = arr.toTokens().size
    if (tksize != 7) {
        return 1
    }
    return 0
}

func testToTokensBool() {
    var arr: Array<Bool> = [false, true, false]
    var tksize = arr.toTokens().size
    if (tksize != 7) {
        return 1
    }
    return 0
}

func testToTokensRune() {
    var arr: Array<Rune> = [r'a', r'b', r'c']
    var tksize = arr.toTokens().size
    if (tksize != 7) {
        return 1
    }
    return 0
}

func testToTokensTypeNode() {
    let ty = parseType(quote(Int64))
    var arr = ArrayList<TypeNode>([ty, ty])
    var tksize = arr.toTokens().size
    if (tksize != 3) {
        return 1
    }
    return 0
}

func testToTokensPattern() {
    let pattern = parsePattern(quote(_))
    var arr = ArrayList<Pattern>([pattern, pattern])
    var tksize = arr.toTokens().size
    if (tksize != 3) {
        return 1
    }
    return 0
}

main() {
    var ret = 0
    ret = testToTokensInt8() + ret
    ret = testToTokensInt16() + ret
    ret = testToTokensInt32() + ret
    ret = testToTokensInt64() + ret
    ret = testToTokensUInt8() + ret
    ret = testToTokensUInt16() + ret
    ret = testToTokensUInt32() + ret
    ret = testToTokensUInt64() + ret
    ret = testToTokensBool() + ret
    ret = testToTokensRune() + ret
    ret = testToTokensTypeNode() + ret
    ret = testToTokensPattern() + ret
    return ret
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

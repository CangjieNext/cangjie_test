/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 --no-sub-pkg %f -o %output
// RUN-EXEC: %export cjHeapSize=512mb && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ms
import std.time.*
import std.collection.*
import std.math.*

private var BgL_runzd2benchmarkzd2 = RunBenchmark

private class sc_Pair {
    var car: Any
    var cdr: Any
    init(car: Any, cdr: Any) {
        this.car = car
        this.cdr = cdr
    }
}

private class SC_NSNull{
    init() {
    }
}

private var sc_const_4_nboyer = sc_Pair("\u{1E9C}implies",(sc_Pair((sc_Pair("\u{1E9C}and",(sc_Pair((sc_Pair("\u{1E9C}implies",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}and",(sc_Pair((sc_Pair("\u{1E9C}implies",(sc_Pair("\u{1E9C}y",(sc_Pair("\u{1E9C}z",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}and",(sc_Pair((sc_Pair("\u{1E9C}implies",(sc_Pair("\u{1E9C}z",(sc_Pair("\u{1E9C}u",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}implies",(sc_Pair("\u{1E9C}u",(sc_Pair("\u{1E9C}w",SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}implies",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}w",SC_NSNull())))))),SC_NSNull())))))
private var sc_const_3_nboyer = sc_list(ArrayList<Any>([(sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}compile",(sc_Pair("\u{1E9C}form",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}reverse",(sc_Pair((sc_Pair("\u{1E9C}codegen",(sc_Pair((sc_Pair("\u{1E9C}optimize",(sc_Pair("\u{1E9C}form",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}nil",SC_NSNull())),SC_NSNull())))))),SC_NSNull())))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}eqp",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}fix",(sc_Pair("\u{1E9C}x",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}fix",(sc_Pair("\u{1E9C}y",SC_NSNull())))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}greaterp",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}lessp",(sc_Pair("\u{1E9C}y",(sc_Pair("\u{1E9C}x",SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}lesseqp",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}not",(sc_Pair((sc_Pair("\u{1E9C}lessp",(sc_Pair("\u{1E9C}y",(sc_Pair("\u{1E9C}x",SC_NSNull())))))),SC_NSNull())))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}greatereqp",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}not",(sc_Pair((sc_Pair("\u{1E9C}lessp",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),SC_NSNull())))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}boolean",(sc_Pair("\u{1E9C}x",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}or",(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair("\u{1E9C}x",(sc_Pair((sc_Pair("\u{1E9C}t",SC_NSNull())),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair("\u{1E9C}x",(sc_Pair((sc_Pair("\u{1E9C}f",SC_NSNull())),SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}iff",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}and",(sc_Pair((sc_Pair("\u{1E9C}implies",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}implies",(sc_Pair("\u{1E9C}y",(sc_Pair("\u{1E9C}x",SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}even1",(sc_Pair("\u{1E9C}x",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}if",(sc_Pair((sc_Pair("\u{1E9C}zerop",(sc_Pair("\u{1E9C}x",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}t",SC_NSNull())),(sc_Pair((sc_Pair("\u{1E9C}odd",(sc_Pair((sc_Pair("\u{1E9C}sub1",(sc_Pair("\u{1E9C}x",SC_NSNull())))),SC_NSNull())))),SC_NSNull())))))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}countps-",(sc_Pair("\u{1E9C}l",(sc_Pair("\u{1E9C}pred",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}countps-loop",(sc_Pair("\u{1E9C}l",(sc_Pair("\u{1E9C}pred",(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),SC_NSNull())))))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}fact-",(sc_Pair("\u{1E9C}i",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}fact-loop",(sc_Pair("\u{1E9C}i",(sc_Pair((1),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}reverse-",(sc_Pair("\u{1E9C}x",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}reverse-loop",(sc_Pair("\u{1E9C}x",(sc_Pair((sc_Pair("\u{1E9C}nil",SC_NSNull())),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}divides",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}zerop",(sc_Pair((sc_Pair("\u{1E9C}remainder",(sc_Pair("\u{1E9C}y",(sc_Pair("\u{1E9C}x",SC_NSNull())))))),SC_NSNull())))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}assume-true",(sc_Pair("\u{1E9C}var",(sc_Pair("\u{1E9C}alist",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}cons",(sc_Pair((sc_Pair("\u{1E9C}cons",(sc_Pair("\u{1E9C}var",(sc_Pair((sc_Pair("\u{1E9C}t",SC_NSNull())),SC_NSNull())))))),(sc_Pair("\u{1E9C}alist",SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}assume-false",(sc_Pair("\u{1E9C}var",(sc_Pair("\u{1E9C}alist",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}cons",(sc_Pair((sc_Pair("\u{1E9C}cons",(sc_Pair("\u{1E9C}var",(sc_Pair((sc_Pair("\u{1E9C}f",SC_NSNull())),SC_NSNull())))))),(sc_Pair("\u{1E9C}alist",SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}tautology-checker",(sc_Pair("\u{1E9C}x",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}tautologyp",(sc_Pair((sc_Pair("\u{1E9C}normalize",(sc_Pair("\u{1E9C}x",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}nil",SC_NSNull())),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}falsify",(sc_Pair("\u{1E9C}x",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}falsify1",(sc_Pair((sc_Pair("\u{1E9C}normalize",(sc_Pair("\u{1E9C}x",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}nil",SC_NSNull())),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}prime",(sc_Pair("\u{1E9C}x",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}and",(sc_Pair((sc_Pair("\u{1E9C}not",(sc_Pair((sc_Pair("\u{1E9C}zerop",(sc_Pair("\u{1E9C}x",SC_NSNull())))),SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}not",(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair("\u{1E9C}x",(sc_Pair((sc_Pair("\u{1E9C}add1",(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),SC_NSNull())))),SC_NSNull())))))),SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}prime1",(sc_Pair("\u{1E9C}x",(sc_Pair((sc_Pair("\u{1E9C}sub1",(sc_Pair("\u{1E9C}x",SC_NSNull())))),SC_NSNull())))))),SC_NSNull())))))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}and",(sc_Pair("\u{1E9C}p",(sc_Pair("\u{1E9C}q",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}if",(sc_Pair("\u{1E9C}p",(sc_Pair((sc_Pair("\u{1E9C}if",(sc_Pair("\u{1E9C}q",(sc_Pair((sc_Pair("\u{1E9C}t",SC_NSNull())),(sc_Pair((sc_Pair("\u{1E9C}f",SC_NSNull())),SC_NSNull())))))))),(sc_Pair((sc_Pair("\u{1E9C}f",SC_NSNull())),SC_NSNull())))))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}or",(sc_Pair("\u{1E9C}p",(sc_Pair("\u{1E9C}q",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}if",(sc_Pair("\u{1E9C}p",(sc_Pair((sc_Pair("\u{1E9C}t",SC_NSNull())),(sc_Pair((sc_Pair("\u{1E9C}if",(sc_Pair("\u{1E9C}q",(sc_Pair((sc_Pair("\u{1E9C}t",SC_NSNull())),(sc_Pair((sc_Pair("\u{1E9C}f",SC_NSNull())),SC_NSNull())))))))),SC_NSNull())))))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}not",(sc_Pair("\u{1E9C}p",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}if",(sc_Pair("\u{1E9C}p",(sc_Pair((sc_Pair("\u{1E9C}f",SC_NSNull())),(sc_Pair((sc_Pair("\u{1E9C}t",SC_NSNull())),SC_NSNull())))))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}implies",(sc_Pair("\u{1E9C}p",(sc_Pair("\u{1E9C}q",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}if",(sc_Pair("\u{1E9C}p",(sc_Pair((sc_Pair("\u{1E9C}if",(sc_Pair("\u{1E9C}q",(sc_Pair((sc_Pair("\u{1E9C}t",SC_NSNull())),(sc_Pair((sc_Pair("\u{1E9C}f",SC_NSNull())),SC_NSNull())))))))),(sc_Pair((sc_Pair("\u{1E9C}t",SC_NSNull())),SC_NSNull())))))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}fix",(sc_Pair("\u{1E9C}x",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}if",(sc_Pair((sc_Pair("\u{1E9C}numberp",(sc_Pair("\u{1E9C}x",SC_NSNull())))),(sc_Pair("\u{1E9C}x",(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),SC_NSNull())))))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}if",(sc_Pair((sc_Pair("\u{1E9C}if",(sc_Pair("\u{1E9C}a",(sc_Pair("\u{1E9C}b",(sc_Pair("\u{1E9C}c",SC_NSNull())))))))),(sc_Pair("\u{1E9C}d",(sc_Pair("\u{1E9C}e",SC_NSNull())))))))),(sc_Pair((sc_Pair("\u{1E9C}if",(sc_Pair("\u{1E9C}a",(sc_Pair((sc_Pair("\u{1E9C}if",(sc_Pair("\u{1E9C}b",(sc_Pair("\u{1E9C}d",(sc_Pair("\u{1E9C}e",SC_NSNull())))))))),(sc_Pair((sc_Pair("\u{1E9C}if",(sc_Pair("\u{1E9C}c",(sc_Pair("\u{1E9C}d",(sc_Pair("\u{1E9C}e",SC_NSNull())))))))),SC_NSNull())))))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}zerop",(sc_Pair("\u{1E9C}x",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}or",(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair("\u{1E9C}x",(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}not",(sc_Pair((sc_Pair("\u{1E9C}numberp",(sc_Pair("\u{1E9C}x",SC_NSNull())))),SC_NSNull())))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair("\u{1E9C}z",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}x",(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}y",(sc_Pair("\u{1E9C}z",SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}a",(sc_Pair("\u{1E9C}b",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}and",(sc_Pair((sc_Pair("\u{1E9C}zerop",(sc_Pair("\u{1E9C}a",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}zerop",(sc_Pair("\u{1E9C}b",SC_NSNull())))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}difference",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}x",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}a",(sc_Pair("\u{1E9C}b",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}a",(sc_Pair("\u{1E9C}c",SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}fix",(sc_Pair("\u{1E9C}b",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}fix",(sc_Pair("\u{1E9C}c",SC_NSNull())))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),(sc_Pair((sc_Pair("\u{1E9C}difference",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}not",(sc_Pair((sc_Pair("\u{1E9C}lessp",(sc_Pair("\u{1E9C}y",(sc_Pair("\u{1E9C}x",SC_NSNull())))))),SC_NSNull())))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair("\u{1E9C}x",(sc_Pair((sc_Pair("\u{1E9C}difference",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}and",(sc_Pair((sc_Pair("\u{1E9C}numberp",(sc_Pair("\u{1E9C}x",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}or",(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair("\u{1E9C}x",(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}zerop",(sc_Pair("\u{1E9C}y",SC_NSNull())))),SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}meaning",(sc_Pair((sc_Pair("\u{1E9C}plus-tree",(sc_Pair((sc_Pair("\u{1E9C}append",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),SC_NSNull())))),(sc_Pair("\u{1E9C}a",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair((sc_Pair("\u{1E9C}meaning",(sc_Pair((sc_Pair("\u{1E9C}plus-tree",(sc_Pair("\u{1E9C}x",SC_NSNull())))),(sc_Pair("\u{1E9C}a",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}meaning",(sc_Pair((sc_Pair("\u{1E9C}plus-tree",(sc_Pair("\u{1E9C}y",SC_NSNull())))),(sc_Pair("\u{1E9C}a",SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}meaning",(sc_Pair((sc_Pair("\u{1E9C}plus-tree",(sc_Pair((sc_Pair("\u{1E9C}plus-fringe",(sc_Pair("\u{1E9C}x",SC_NSNull())))),SC_NSNull())))),(sc_Pair("\u{1E9C}a",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}fix",(sc_Pair((sc_Pair("\u{1E9C}meaning",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}a",SC_NSNull())))))),SC_NSNull())))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}append",(sc_Pair((sc_Pair("\u{1E9C}append",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair("\u{1E9C}z",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}append",(sc_Pair("\u{1E9C}x",(sc_Pair((sc_Pair("\u{1E9C}append",(sc_Pair("\u{1E9C}y",(sc_Pair("\u{1E9C}z",SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}reverse",(sc_Pair((sc_Pair("\u{1E9C}append",(sc_Pair("\u{1E9C}a",(sc_Pair("\u{1E9C}b",SC_NSNull())))))),SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}append",(sc_Pair((sc_Pair("\u{1E9C}reverse",(sc_Pair("\u{1E9C}b",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}reverse",(sc_Pair("\u{1E9C}a",SC_NSNull())))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair("\u{1E9C}x",(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}y",(sc_Pair("\u{1E9C}z",SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}z",SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair("\u{1E9C}z",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair("\u{1E9C}x",(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair("\u{1E9C}y",(sc_Pair("\u{1E9C}z",SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}or",(sc_Pair((sc_Pair("\u{1E9C}zerop",(sc_Pair("\u{1E9C}x",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}zerop",(sc_Pair("\u{1E9C}y",SC_NSNull())))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}exec",(sc_Pair((sc_Pair("\u{1E9C}append",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair("\u{1E9C}pds",(sc_Pair("\u{1E9C}envrn",SC_NSNull())))))))),(sc_Pair((sc_Pair("\u{1E9C}exec",(sc_Pair("\u{1E9C}y",(sc_Pair((sc_Pair("\u{1E9C}exec",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}pds",(sc_Pair("\u{1E9C}envrn",SC_NSNull())))))))),(sc_Pair("\u{1E9C}envrn",SC_NSNull())))))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}mc-flatten",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}append",(sc_Pair((sc_Pair("\u{1E9C}flatten",(sc_Pair("\u{1E9C}x",SC_NSNull())))),(sc_Pair("\u{1E9C}y",SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}member",(sc_Pair("\u{1E9C}x",(sc_Pair((sc_Pair("\u{1E9C}append",(sc_Pair("\u{1E9C}a",(sc_Pair("\u{1E9C}b",SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}or",(sc_Pair((sc_Pair("\u{1E9C}member",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}a",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}member",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}b",SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}member",(sc_Pair("\u{1E9C}x",(sc_Pair((sc_Pair("\u{1E9C}reverse",(sc_Pair("\u{1E9C}y",SC_NSNull())))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}member",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}length",(sc_Pair((sc_Pair("\u{1E9C}reverse",(sc_Pair("\u{1E9C}x",SC_NSNull())))),SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}length",(sc_Pair("\u{1E9C}x",SC_NSNull())))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}member",(sc_Pair("\u{1E9C}a",(sc_Pair((sc_Pair("\u{1E9C}intersect",(sc_Pair("\u{1E9C}b",(sc_Pair("\u{1E9C}c",SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}and",(sc_Pair((sc_Pair("\u{1E9C}member",(sc_Pair("\u{1E9C}a",(sc_Pair("\u{1E9C}b",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}member",(sc_Pair("\u{1E9C}a",(sc_Pair("\u{1E9C}c",SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}nth",(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),(sc_Pair("\u{1E9C}i",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}exp",(sc_Pair("\u{1E9C}i",(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}j",(sc_Pair("\u{1E9C}k",SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair((sc_Pair("\u{1E9C}exp",(sc_Pair("\u{1E9C}i",(sc_Pair("\u{1E9C}j",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}exp",(sc_Pair("\u{1E9C}i",(sc_Pair("\u{1E9C}k",SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}exp",(sc_Pair("\u{1E9C}i",(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair("\u{1E9C}j",(sc_Pair("\u{1E9C}k",SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}exp",(sc_Pair((sc_Pair("\u{1E9C}exp",(sc_Pair("\u{1E9C}i",(sc_Pair("\u{1E9C}j",SC_NSNull())))))),(sc_Pair("\u{1E9C}k",SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}reverse-loop",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}append",(sc_Pair((sc_Pair("\u{1E9C}reverse",(sc_Pair("\u{1E9C}x",SC_NSNull())))),(sc_Pair("\u{1E9C}y",SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}reverse-loop",(sc_Pair("\u{1E9C}x",(sc_Pair((sc_Pair("\u{1E9C}nil",SC_NSNull())),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}reverse",(sc_Pair("\u{1E9C}x",SC_NSNull())))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}count-list",(sc_Pair("\u{1E9C}z",(sc_Pair((sc_Pair("\u{1E9C}sort-lp",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair((sc_Pair("\u{1E9C}count-list",(sc_Pair("\u{1E9C}z",(sc_Pair("\u{1E9C}x",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}count-list",(sc_Pair("\u{1E9C}z",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}append",(sc_Pair("\u{1E9C}a",(sc_Pair("\u{1E9C}b",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}append",(sc_Pair("\u{1E9C}a",(sc_Pair("\u{1E9C}c",SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair("\u{1E9C}b",(sc_Pair("\u{1E9C}c",SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair((sc_Pair("\u{1E9C}remainder",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair("\u{1E9C}y",(sc_Pair((sc_Pair("\u{1E9C}quotient",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}fix",(sc_Pair("\u{1E9C}x",SC_NSNull())))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}power-eval",(sc_Pair((sc_Pair("\u{1E9C}big-plus1",(sc_Pair("\u{1E9C}l",(sc_Pair("\u{1E9C}i",(sc_Pair("\u{1E9C}base",SC_NSNull())))))))),(sc_Pair("\u{1E9C}base",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair((sc_Pair("\u{1E9C}power-eval",(sc_Pair("\u{1E9C}l",(sc_Pair("\u{1E9C}base",SC_NSNull())))))),(sc_Pair("\u{1E9C}i",SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}power-eval",(sc_Pair((sc_Pair("\u{1E9C}big-plus",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",(sc_Pair("\u{1E9C}i",(sc_Pair("\u{1E9C}base",SC_NSNull())))))))))),(sc_Pair("\u{1E9C}base",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}i",(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair((sc_Pair("\u{1E9C}power-eval",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}base",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}power-eval",(sc_Pair("\u{1E9C}y",(sc_Pair("\u{1E9C}base",SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}remainder",(sc_Pair("\u{1E9C}y",(sc_Pair((1),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}lessp",(sc_Pair((sc_Pair("\u{1E9C}remainder",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}not",(sc_Pair((sc_Pair("\u{1E9C}zerop",(sc_Pair("\u{1E9C}y",SC_NSNull())))),SC_NSNull())))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}remainder",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}x",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}lessp",(sc_Pair((sc_Pair("\u{1E9C}quotient",(sc_Pair("\u{1E9C}i",(sc_Pair("\u{1E9C}j",SC_NSNull())))))),(sc_Pair("\u{1E9C}i",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}and",(sc_Pair((sc_Pair("\u{1E9C}not",(sc_Pair((sc_Pair("\u{1E9C}zerop",(sc_Pair("\u{1E9C}i",SC_NSNull())))),SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}or",(sc_Pair((sc_Pair("\u{1E9C}zerop",(sc_Pair("\u{1E9C}j",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}not",(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair("\u{1E9C}j",(sc_Pair((1),SC_NSNull())))))),SC_NSNull())))),SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}lessp",(sc_Pair((sc_Pair("\u{1E9C}remainder",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair("\u{1E9C}x",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}and",(sc_Pair((sc_Pair("\u{1E9C}not",(sc_Pair((sc_Pair("\u{1E9C}zerop",(sc_Pair("\u{1E9C}y",SC_NSNull())))),SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}not",(sc_Pair((sc_Pair("\u{1E9C}zerop",(sc_Pair("\u{1E9C}x",SC_NSNull())))),SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}not",(sc_Pair((sc_Pair("\u{1E9C}lessp",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),SC_NSNull())))),SC_NSNull())))))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}power-eval",(sc_Pair((sc_Pair("\u{1E9C}power-rep",(sc_Pair("\u{1E9C}i",(sc_Pair("\u{1E9C}base",SC_NSNull())))))),(sc_Pair("\u{1E9C}base",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}fix",(sc_Pair("\u{1E9C}i",SC_NSNull())))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}power-eval",(sc_Pair((sc_Pair("\u{1E9C}big-plus",(sc_Pair((sc_Pair("\u{1E9C}power-rep",(sc_Pair("\u{1E9C}i",(sc_Pair("\u{1E9C}base",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}power-rep",(sc_Pair("\u{1E9C}j",(sc_Pair("\u{1E9C}base",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),(sc_Pair("\u{1E9C}base",SC_NSNull())))))))))),(sc_Pair("\u{1E9C}base",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}i",(sc_Pair("\u{1E9C}j",SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}gcd",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}gcd",(sc_Pair("\u{1E9C}y",(sc_Pair("\u{1E9C}x",SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}nth",(sc_Pair((sc_Pair("\u{1E9C}append",(sc_Pair("\u{1E9C}a",(sc_Pair("\u{1E9C}b",SC_NSNull())))))),(sc_Pair("\u{1E9C}i",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}append",(sc_Pair((sc_Pair("\u{1E9C}nth",(sc_Pair("\u{1E9C}a",(sc_Pair("\u{1E9C}i",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}nth",(sc_Pair("\u{1E9C}b",(sc_Pair((sc_Pair("\u{1E9C}difference",(sc_Pair("\u{1E9C}i",(sc_Pair((sc_Pair("\u{1E9C}length",(sc_Pair("\u{1E9C}a",SC_NSNull())))),SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}difference",(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair("\u{1E9C}x",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}fix",(sc_Pair("\u{1E9C}y",SC_NSNull())))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}difference",(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}y",(sc_Pair("\u{1E9C}x",SC_NSNull())))))),(sc_Pair("\u{1E9C}x",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}fix",(sc_Pair("\u{1E9C}y",SC_NSNull())))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}difference",(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}z",SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}difference",(sc_Pair("\u{1E9C}y",(sc_Pair("\u{1E9C}z",SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair("\u{1E9C}x",(sc_Pair((sc_Pair("\u{1E9C}difference",(sc_Pair("\u{1E9C}c",(sc_Pair("\u{1E9C}w",SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}difference",(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair("\u{1E9C}c",(sc_Pair("\u{1E9C}x",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair("\u{1E9C}w",(sc_Pair("\u{1E9C}x",SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}remainder",(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}z",SC_NSNull())))))),(sc_Pair("\u{1E9C}z",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}difference",(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}b",(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}a",(sc_Pair("\u{1E9C}c",SC_NSNull())))))),SC_NSNull())))))),(sc_Pair("\u{1E9C}a",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}b",(sc_Pair("\u{1E9C}c",SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}difference",(sc_Pair((sc_Pair("\u{1E9C}add1",(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}y",(sc_Pair("\u{1E9C}z",SC_NSNull())))))),SC_NSNull())))),(sc_Pair("\u{1E9C}z",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}add1",(sc_Pair("\u{1E9C}y",SC_NSNull())))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}lessp",(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}z",SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}lessp",(sc_Pair("\u{1E9C}y",(sc_Pair("\u{1E9C}z",SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}lessp",(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}z",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair("\u{1E9C}y",(sc_Pair("\u{1E9C}z",SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}and",(sc_Pair((sc_Pair("\u{1E9C}not",(sc_Pair((sc_Pair("\u{1E9C}zerop",(sc_Pair("\u{1E9C}z",SC_NSNull())))),SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}lessp",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}lessp",(sc_Pair("\u{1E9C}y",(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}not",(sc_Pair((sc_Pair("\u{1E9C}zerop",(sc_Pair("\u{1E9C}x",SC_NSNull())))),SC_NSNull())))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}gcd",(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}z",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair("\u{1E9C}y",(sc_Pair("\u{1E9C}z",SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair("\u{1E9C}z",(sc_Pair((sc_Pair("\u{1E9C}gcd",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}value",(sc_Pair((sc_Pair("\u{1E9C}normalize",(sc_Pair("\u{1E9C}x",SC_NSNull())))),(sc_Pair("\u{1E9C}a",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}value",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}a",SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}flatten",(sc_Pair("\u{1E9C}x",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}cons",(sc_Pair("\u{1E9C}y",(sc_Pair((sc_Pair("\u{1E9C}nil",SC_NSNull())),SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}and",(sc_Pair((sc_Pair("\u{1E9C}nlistp",(sc_Pair("\u{1E9C}x",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}listp",(sc_Pair((sc_Pair("\u{1E9C}gopher",(sc_Pair("\u{1E9C}x",SC_NSNull())))),SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}listp",(sc_Pair("\u{1E9C}x",SC_NSNull())))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}samefringe",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}flatten",(sc_Pair("\u{1E9C}x",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}flatten",(sc_Pair("\u{1E9C}y",SC_NSNull())))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}greatest-factor",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}and",(sc_Pair((sc_Pair("\u{1E9C}or",(sc_Pair((sc_Pair("\u{1E9C}zerop",(sc_Pair("\u{1E9C}y",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair("\u{1E9C}y",(sc_Pair((1),SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair("\u{1E9C}x",(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}greatest-factor",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair((1),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair("\u{1E9C}x",(sc_Pair((1),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}numberp",(sc_Pair((sc_Pair("\u{1E9C}greatest-factor",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}not",(sc_Pair((sc_Pair("\u{1E9C}and",(sc_Pair((sc_Pair("\u{1E9C}or",(sc_Pair((sc_Pair("\u{1E9C}zerop",(sc_Pair("\u{1E9C}y",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair("\u{1E9C}y",(sc_Pair((1),SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}not",(sc_Pair((sc_Pair("\u{1E9C}numberp",(sc_Pair("\u{1E9C}x",SC_NSNull())))),SC_NSNull())))),SC_NSNull())))))),SC_NSNull())))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}times-list",(sc_Pair((sc_Pair("\u{1E9C}append",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair((sc_Pair("\u{1E9C}times-list",(sc_Pair("\u{1E9C}x",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}times-list",(sc_Pair("\u{1E9C}y",SC_NSNull())))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}prime-list",(sc_Pair((sc_Pair("\u{1E9C}append",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}and",(sc_Pair((sc_Pair("\u{1E9C}prime-list",(sc_Pair("\u{1E9C}x",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}prime-list",(sc_Pair("\u{1E9C}y",SC_NSNull())))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair("\u{1E9C}z",(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair("\u{1E9C}w",(sc_Pair("\u{1E9C}z",SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}and",(sc_Pair((sc_Pair("\u{1E9C}numberp",(sc_Pair("\u{1E9C}z",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}or",(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair("\u{1E9C}z",(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair("\u{1E9C}w",(sc_Pair((1),SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}greatereqp",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}not",(sc_Pair((sc_Pair("\u{1E9C}lessp",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),SC_NSNull())))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair("\u{1E9C}x",(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}or",(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair("\u{1E9C}x",(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}and",(sc_Pair((sc_Pair("\u{1E9C}numberp",(sc_Pair("\u{1E9C}x",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair("\u{1E9C}y",(sc_Pair((1),SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}remainder",(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair("\u{1E9C}y",(sc_Pair("\u{1E9C}x",SC_NSNull())))))),(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair("\u{1E9C}a",(sc_Pair("\u{1E9C}b",SC_NSNull())))))),(sc_Pair((1),SC_NSNull())))))),(sc_Pair(sc_list(ArrayList<Any>(["\u{1E9C}and", (sc_Pair("\u{1E9C}not",(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair("\u{1E9C}a",(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),SC_NSNull())))))),SC_NSNull())))), (sc_Pair("\u{1E9C}not",(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair("\u{1E9C}b",(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),SC_NSNull())))))),SC_NSNull())))), (sc_Pair("\u{1E9C}numberp",(sc_Pair("\u{1E9C}a",SC_NSNull())))), (sc_Pair("\u{1E9C}numberp",(sc_Pair("\u{1E9C}b",SC_NSNull())))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}sub1",(sc_Pair("\u{1E9C}a",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}sub1",(sc_Pair("\u{1E9C}b",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),SC_NSNull()))))))])),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}lessp",(sc_Pair((sc_Pair("\u{1E9C}length",(sc_Pair((sc_Pair("\u{1E9C}delete",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}l",SC_NSNull())))))),SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}length",(sc_Pair("\u{1E9C}l",SC_NSNull())))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}member",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}l",SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}sort2",(sc_Pair((sc_Pair("\u{1E9C}delete",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}l",SC_NSNull())))))),SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}delete",(sc_Pair("\u{1E9C}x",(sc_Pair((sc_Pair("\u{1E9C}sort2",(sc_Pair("\u{1E9C}l",SC_NSNull())))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}dsort",(sc_Pair("\u{1E9C}x",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}sort2",(sc_Pair("\u{1E9C}x",SC_NSNull())))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}length",(sc_Pair((sc_Pair("\u{1E9C}cons",(sc_Pair("\u{1E9C}x1",(sc_Pair((sc_Pair("\u{1E9C}cons",(sc_Pair("\u{1E9C}x2",(sc_Pair((sc_Pair("\u{1E9C}cons",(sc_Pair("\u{1E9C}x3",(sc_Pair((sc_Pair("\u{1E9C}cons",(sc_Pair("\u{1E9C}x4",(sc_Pair((sc_Pair("\u{1E9C}cons",(sc_Pair("\u{1E9C}x5",(sc_Pair((sc_Pair("\u{1E9C}cons",(sc_Pair("\u{1E9C}x6",(sc_Pair("\u{1E9C}x7",SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair((6),(sc_Pair((sc_Pair("\u{1E9C}length",(sc_Pair("\u{1E9C}x7",SC_NSNull())))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}difference",(sc_Pair((sc_Pair("\u{1E9C}add1",(sc_Pair((sc_Pair("\u{1E9C}add1",(sc_Pair("\u{1E9C}x",SC_NSNull())))),SC_NSNull())))),(sc_Pair((2),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}fix",(sc_Pair("\u{1E9C}x",SC_NSNull())))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}quotient",(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}x",(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((2),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}x",(sc_Pair((sc_Pair("\u{1E9C}quotient",(sc_Pair("\u{1E9C}y",(sc_Pair((2),SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}sigma",(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),(sc_Pair("\u{1E9C}i",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}quotient",(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair("\u{1E9C}i",(sc_Pair((sc_Pair("\u{1E9C}add1",(sc_Pair("\u{1E9C}i",SC_NSNull())))),SC_NSNull())))))),(sc_Pair((2),SC_NSNull())))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}x",(sc_Pair((sc_Pair("\u{1E9C}add1",(sc_Pair("\u{1E9C}y",SC_NSNull())))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}if",(sc_Pair((sc_Pair("\u{1E9C}numberp",(sc_Pair("\u{1E9C}y",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}add1",(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}add1",(sc_Pair("\u{1E9C}x",SC_NSNull())))),SC_NSNull())))))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}difference",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}difference",(sc_Pair("\u{1E9C}z",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}if",(sc_Pair((sc_Pair("\u{1E9C}lessp",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}not",(sc_Pair((sc_Pair("\u{1E9C}lessp",(sc_Pair("\u{1E9C}y",(sc_Pair("\u{1E9C}z",SC_NSNull())))))),SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}if",(sc_Pair((sc_Pair("\u{1E9C}lessp",(sc_Pair("\u{1E9C}z",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}not",(sc_Pair((sc_Pair("\u{1E9C}lessp",(sc_Pair("\u{1E9C}y",(sc_Pair("\u{1E9C}x",SC_NSNull())))))),SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}fix",(sc_Pair("\u{1E9C}x",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}fix",(sc_Pair("\u{1E9C}z",SC_NSNull())))),SC_NSNull())))))),SC_NSNull())))))))),SC_NSNull())))))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}meaning",(sc_Pair((sc_Pair("\u{1E9C}plus-tree",(sc_Pair((sc_Pair("\u{1E9C}delete",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),SC_NSNull())))),(sc_Pair("\u{1E9C}a",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}if",(sc_Pair((sc_Pair("\u{1E9C}member",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}difference",(sc_Pair((sc_Pair("\u{1E9C}meaning",(sc_Pair((sc_Pair("\u{1E9C}plus-tree",(sc_Pair("\u{1E9C}y",SC_NSNull())))),(sc_Pair("\u{1E9C}a",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}meaning",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}a",SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}meaning",(sc_Pair((sc_Pair("\u{1E9C}plus-tree",(sc_Pair("\u{1E9C}y",SC_NSNull())))),(sc_Pair("\u{1E9C}a",SC_NSNull())))))),SC_NSNull())))))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair("\u{1E9C}x",(sc_Pair((sc_Pair("\u{1E9C}add1",(sc_Pair("\u{1E9C}y",SC_NSNull())))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}if",(sc_Pair((sc_Pair("\u{1E9C}numberp",(sc_Pair("\u{1E9C}y",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}x",(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}fix",(sc_Pair("\u{1E9C}x",SC_NSNull())))),SC_NSNull())))))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}nth",(sc_Pair((sc_Pair("\u{1E9C}nil",SC_NSNull())),(sc_Pair("\u{1E9C}i",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}if",(sc_Pair((sc_Pair("\u{1E9C}zerop",(sc_Pair("\u{1E9C}i",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}nil",SC_NSNull())),(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),SC_NSNull())))))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}last",(sc_Pair((sc_Pair("\u{1E9C}append",(sc_Pair("\u{1E9C}a",(sc_Pair("\u{1E9C}b",SC_NSNull())))))),SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}if",(sc_Pair((sc_Pair("\u{1E9C}listp",(sc_Pair("\u{1E9C}b",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}last",(sc_Pair("\u{1E9C}b",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}if",(sc_Pair((sc_Pair("\u{1E9C}listp",(sc_Pair("\u{1E9C}a",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}cons",(sc_Pair((sc_Pair("\u{1E9C}car",(sc_Pair((sc_Pair("\u{1E9C}last",(sc_Pair("\u{1E9C}a",SC_NSNull())))),SC_NSNull())))),(sc_Pair("\u{1E9C}b",SC_NSNull())))))),(sc_Pair("\u{1E9C}b",SC_NSNull())))))))),SC_NSNull())))))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}lessp",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair("\u{1E9C}z",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}if",(sc_Pair((sc_Pair("\u{1E9C}lessp",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}t",SC_NSNull())),(sc_Pair("\u{1E9C}z",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}f",SC_NSNull())),(sc_Pair("\u{1E9C}z",SC_NSNull())))))),SC_NSNull())))))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}assignment",(sc_Pair("\u{1E9C}x",(sc_Pair((sc_Pair("\u{1E9C}append",(sc_Pair("\u{1E9C}a",(sc_Pair("\u{1E9C}b",SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}if",(sc_Pair((sc_Pair("\u{1E9C}assignedp",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}a",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}assignment",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}a",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}assignment",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}b",SC_NSNull())))))),SC_NSNull())))))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}car",(sc_Pair((sc_Pair("\u{1E9C}gopher",(sc_Pair("\u{1E9C}x",SC_NSNull())))),SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}if",(sc_Pair((sc_Pair("\u{1E9C}listp",(sc_Pair("\u{1E9C}x",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}car",(sc_Pair((sc_Pair("\u{1E9C}flatten",(sc_Pair("\u{1E9C}x",SC_NSNull())))),SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),SC_NSNull())))))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}flatten",(sc_Pair((sc_Pair("\u{1E9C}cdr",(sc_Pair((sc_Pair("\u{1E9C}gopher",(sc_Pair("\u{1E9C}x",SC_NSNull())))),SC_NSNull())))),SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}if",(sc_Pair((sc_Pair("\u{1E9C}listp",(sc_Pair("\u{1E9C}x",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}cdr",(sc_Pair((sc_Pair("\u{1E9C}flatten",(sc_Pair("\u{1E9C}x",SC_NSNull())))),SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}cons",(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),(sc_Pair((sc_Pair("\u{1E9C}nil",SC_NSNull())),SC_NSNull())))))),SC_NSNull())))))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}quotient",(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair("\u{1E9C}y",(sc_Pair("\u{1E9C}x",SC_NSNull())))))),(sc_Pair("\u{1E9C}y",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}if",(sc_Pair((sc_Pair("\u{1E9C}zerop",(sc_Pair("\u{1E9C}y",SC_NSNull())))),(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),(sc_Pair((sc_Pair("\u{1E9C}fix",(sc_Pair("\u{1E9C}x",SC_NSNull())))),SC_NSNull())))))))),SC_NSNull())))))), (sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}get",(sc_Pair("\u{1E9C}j",(sc_Pair((sc_Pair("\u{1E9C}set",(sc_Pair("\u{1E9C}i",(sc_Pair("\u{1E9C}val",(sc_Pair("\u{1E9C}mem",SC_NSNull())))))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}if",(sc_Pair((sc_Pair("\u{1E9C}eqp",(sc_Pair("\u{1E9C}j",(sc_Pair("\u{1E9C}i",SC_NSNull())))))),(sc_Pair("\u{1E9C}val",(sc_Pair((sc_Pair("\u{1E9C}get",(sc_Pair("\u{1E9C}j",(sc_Pair("\u{1E9C}mem",SC_NSNull())))))),SC_NSNull())))))))),SC_NSNull()))))))]))
private var const_nboyer = sc_Pair((sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}f",(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}a",(sc_Pair("\u{1E9C}b",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}c",(sc_Pair((sc_Pair("\u{1E9C}zero",SC_NSNull())),SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}y",(sc_Pair("\u{1E9C}f",(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair((sc_Pair("\u{1E9C}times",(sc_Pair("\u{1E9C}a",(sc_Pair("\u{1E9C}b",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}c",(sc_Pair("\u{1E9C}d",SC_NSNull())))))),SC_NSNull())))))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}z",(sc_Pair("\u{1E9C}f",(sc_Pair((sc_Pair("\u{1E9C}reverse",(sc_Pair((sc_Pair("\u{1E9C}append",(sc_Pair((sc_Pair("\u{1E9C}append",(sc_Pair("\u{1E9C}a",(sc_Pair("\u{1E9C}b",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}None",SC_NSNull())),SC_NSNull())))))),SC_NSNull())))),SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}u",(sc_Pair("\u{1E9C}equal",(sc_Pair((sc_Pair("\u{1E9C}plus",(sc_Pair("\u{1E9C}a",(sc_Pair("\u{1E9C}b",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}difference",(sc_Pair("\u{1E9C}x",(sc_Pair("\u{1E9C}y",SC_NSNull())))))),SC_NSNull())))))))),(sc_Pair((sc_Pair("\u{1E9C}w",(sc_Pair("\u{1E9C}lessp",(sc_Pair((sc_Pair("\u{1E9C}remainder",(sc_Pair("\u{1E9C}a",(sc_Pair("\u{1E9C}b",SC_NSNull())))))),(sc_Pair((sc_Pair("\u{1E9C}member",(sc_Pair("\u{1E9C}a",(sc_Pair((sc_Pair("\u{1E9C}length",(sc_Pair("\u{1E9C}b",SC_NSNull())))),SC_NSNull())))))),SC_NSNull())))))))),SC_NSNull())))))))))

private var BgL_sc_za2symbolzd2recordszd2alistza2_2z00_nboyer: Any = Option<Any>.None
private var if_constructor_nboyer: Any = "\u{1E9C}*"
private var false_term_nboyer: Any = Option<Any>.None
private var true_term_nboyer:Any = Option<Any>.None
private var rewrite_count_nboyer: Int64 = 0
private var unify_subst_nboyer:Any = "\u{1E9C}*"
private var sc_number2string = sc_number2jsstring

/**
 boyer
 */
private func apply_subst_lst_nboyer(alist:Any, lst:Any) : Any {
    var sc_lst_7:Any
    if(lst is SC_NSNull){
        return SC_NSNull()
    }
    sc_lst_7 = (lst as sc_Pair).getOrThrow().cdr
    if(sc_lst_7 is SC_NSNull){
        return sc_Pair(
            apply_subst_nboyer(alist, (lst as sc_Pair).getOrThrow().car),
            SC_NSNull()
        )
    }else{
        return sc_Pair(
            apply_subst_nboyer(alist, (lst as sc_Pair).getOrThrow().car),
            sc_Pair(
              apply_subst_nboyer(alist, (sc_lst_7 as sc_Pair).getOrThrow().car),
              apply_subst_lst_nboyer(alist, (sc_lst_7 as sc_Pair).getOrThrow().cdr)
            )
        )
    }
}
private func rewrite_args_nboyer(lst:Any) : Any {
    var sc_lst_14:Any
    if (lst is SC_NSNull) {
        return SC_NSNull()
    }
    let ran_car = rewrite_nboyer((lst as sc_Pair).getOrThrow().car)
    sc_lst_14 = (lst as sc_Pair).getOrThrow().cdr
    if (sc_lst_14 is SC_NSNull) {
        return sc_Pair(ran_car, SC_NSNull())
    }
    return sc_Pair(
        ran_car,
        sc_Pair(
            rewrite_nboyer((sc_lst_14 as sc_Pair).getOrThrow().car),
            rewrite_args_nboyer((sc_lst_14 as sc_Pair).getOrThrow().cdr)
        )
    )
}
private func translate_alist_nboyer(alist:Any) : Any {
    
    var sc_alist_6:Any
    var term:Any
    var car_value:Any
    if (alist is SC_NSNull) {
        return SC_NSNull()
    }
    term = ((alist as sc_Pair).getOrThrow().car as sc_Pair).getOrThrow().cdr
    sc_alist_6 = (alist as sc_Pair).getOrThrow().cdr
    if (!(term is sc_Pair)){
        car_value = sc_Pair(((alist as sc_Pair).getOrThrow().car as sc_Pair).getOrThrow().car, term)
    } else {
        car_value = sc_Pair(
            ((alist as sc_Pair).getOrThrow().car as sc_Pair).getOrThrow().car,
            sc_Pair(
                BgL_sc_symbolzd2ze3symbolzd2record_1ze3_nboyer(((term as sc_Pair).getOrThrow().car as String).getOrThrow()),
                translate_args_nboyer((term as sc_Pair).getOrThrow().cdr)
            )
        )
    }
    if (sc_alist_6 is SC_NSNull) {
        return sc_Pair(car_value, SC_NSNull())
    } else {
        return sc_Pair(
            car_value,
            sc_Pair(
                sc_Pair(
                    ((sc_alist_6 as sc_Pair).getOrThrow().car as sc_Pair).getOrThrow().car,
                    translate_term_nboyer(((sc_alist_6 as sc_Pair).getOrThrow().car as sc_Pair).getOrThrow().cdr)
                ),
                translate_alist_nboyer((sc_alist_6 as sc_Pair).getOrThrow().cdr)
            )
        )
    }
}
private func one_way_unify1_nboyer(term1:Any, term2:Any) : Bool {
    var lst1:Any
    var lst2:Any
    var temp_temp:Any
    if (!(term2 is sc_Pair)){
        temp_temp = sc_assq(
            if (term2 is String)  {
                (term2 as String).getOrThrow()
            } else {
                if((term2 as Int64).isSome()) {
                    (term2 as Int64).getOrThrow().toString()
                } else {
                    ""
                }
            }, unify_subst_nboyer)
        if (((temp_temp as Bool) ?? true) != false) {
            return is_term_equal_nboyer(term1, (temp_temp as sc_Pair).getOrThrow().cdr)
        }else if (sc_isNumber(term2)) {
            return sc_isEqual(term1, term2)
        }else {
            unify_subst_nboyer = sc_Pair(sc_Pair(term2, term1), unify_subst_nboyer)
            return true
        }
    } else if (!(term1 is sc_Pair)) {
        return false
    }else if (refEq(((term1 as sc_Pair).getOrThrow().car as Object).getOrThrow(), ((term2 as sc_Pair).getOrThrow().car as Object).getOrThrow())) {
        lst1 = (term1 as sc_Pair).getOrThrow().cdr
        lst2 = (term2 as sc_Pair).getOrThrow().cdr
        while (true) {
            if (lst1 is SC_NSNull) {
                return lst2 is SC_NSNull
            }else if (lst2 is SC_NSNull) {
                return false
            }else if (one_way_unify1_nboyer((lst1 as sc_Pair).getOrThrow().car, (lst2 as sc_Pair).getOrThrow().car) != false) {
                lst1 = (lst1 as sc_Pair).getOrThrow().cdr
                lst2 = (lst2 as sc_Pair).getOrThrow().cdr
            }else {
                return false
            }
        }
    }else {
        return false
    }
    throw Exception()
}

private func rewrite_nboyer(term:Any) : Any {
    var term2:Any
    var sc_term_12:Any
    var lst:Any
    var symbol_record:sc_Vector = sc_Vector(ArrayList<Any>())
    var sc_lst_13:Any
    rewrite_count_nboyer = rewrite_count_nboyer + 1
    if (!(term is sc_Pair)) {
        return term
    }else {
        sc_lst_13 = (term as sc_Pair).getOrThrow().cdr
        if (sc_lst_13 is SC_NSNull) {
            sc_term_12 = sc_Pair((term as sc_Pair).getOrThrow().car, SC_NSNull())
        } else {
            sc_term_12 = sc_Pair(
                (term as sc_Pair).getOrThrow().car,
                sc_Pair(
                    rewrite_nboyer((sc_lst_13 as sc_Pair).getOrThrow().car),
                    rewrite_args_nboyer((sc_lst_13 as sc_Pair).getOrThrow().cdr)
                )
            )
        }
        symbol_record = ((term as sc_Pair).getOrThrow().car as sc_Vector).getOrThrow()
        lst = symbol_record.arr[1]
        while (true) {
            if (lst is SC_NSNull) {
                return sc_term_12
            }else {
                term2 = (((lst as sc_Pair).getOrThrow().car as sc_Pair).getOrThrow().cdr as sc_Pair).getOrThrow().car
                unify_subst_nboyer = SC_NSNull()
                if (one_way_unify1_nboyer(sc_term_12, term2) != false) {
                    return rewrite_nboyer(
                        apply_subst_nboyer(
                            unify_subst_nboyer,
                            ((((lst as sc_Pair).getOrThrow().car as sc_Pair).getOrThrow().cdr as sc_Pair).getOrThrow().cdr as sc_Pair).getOrThrow().car
                        )
                    )
                } else {
                    lst = (lst as sc_Pair).getOrThrow().cdr
                }
            }
        }
    }
}

private func tautologyp_nboyer(sc_x_1:Any, true_lst:Any, false_lst_a:Any ) : Bool {
  
    var tmp1125:Bool
    var x:Any
    var tmp1126:Bool
    var sc_x_8:Any
    var sc_tmp1125_9:Bool
    var sc_tmp1126_10:Bool
    var sc_x_11:Any
    var false_lst:Any
    sc_x_11 = sc_x_1
    false_lst = false_lst_a
    while (true) {
        sc_tmp1126_10 = is_term_equal_nboyer(sc_x_11, true_term_nboyer)
        sc_tmp1125_9 = is_term_equal_nboyer(sc_x_11, false_term_nboyer)
        if ((if(sc_tmp1126_10 != false) {sc_tmp1126_10} else {is_term_member_nboyer(sc_x_11, true_lst)})!= false) {
            return true
        }else if ((if(sc_tmp1125_9 != false) {sc_tmp1125_9} else {is_term_member_nboyer(sc_x_11, false_lst)}) != false) {
            return false
        }else if (!(sc_x_11 is sc_Pair)) {
            return false
        }else if (refEq(((sc_x_11 as sc_Pair).getOrThrow().car as Object).getOrThrow(), (if_constructor_nboyer as Object).getOrThrow())) {
            sc_x_8 = ((sc_x_11 as sc_Pair).getOrThrow().cdr as sc_Pair).getOrThrow().car
            tmp1126 = is_term_equal_nboyer(sc_x_8, true_term_nboyer)
            x = ((sc_x_11 as sc_Pair).getOrThrow().cdr as sc_Pair).getOrThrow().car
            tmp1125 = is_term_equal_nboyer(x, false_term_nboyer)
            if ((if(tmp1126 != false) {tmp1126} else{is_term_member_nboyer(sc_x_8, true_lst)}) != false) {
                sc_x_11 = (((sc_x_11 as sc_Pair).getOrThrow().cdr as sc_Pair).getOrThrow().cdr as sc_Pair).getOrThrow().car
            }else if ((if(tmp1125 != false) {tmp1125} else {is_term_member_nboyer(x, false_lst)}) != false) {
                sc_x_11 = ((((sc_x_11 as sc_Pair).getOrThrow().cdr as sc_Pair).getOrThrow().cdr as sc_Pair).getOrThrow().cdr as sc_Pair).getOrThrow().car
            }else if (tautologyp_nboyer((((sc_x_11 as sc_Pair).getOrThrow().cdr as sc_Pair).getOrThrow().cdr as sc_Pair).getOrThrow().car, sc_Pair(((sc_x_11 as sc_Pair).getOrThrow().cdr as sc_Pair).getOrThrow().car, true_lst), false_lst) != false) {
                false_lst = sc_Pair(((sc_x_11 as sc_Pair).getOrThrow().cdr as sc_Pair).getOrThrow().car, false_lst)
                sc_x_11 = ((((sc_x_11 as sc_Pair).getOrThrow().cdr as sc_Pair).getOrThrow().cdr as sc_Pair).getOrThrow().cdr as sc_Pair).getOrThrow().car
            } else {
                return false
            }
        } else {
            return false
        }
    }
    throw Exception()
}

private func BgL_setupzd2boyerzd2() : Bool {

    var symbol_record:sc_Vector
    var value:sc_Pair
    var BgL_sc_symbolzd2record_16zd2:Any
    var sym:String
    var sc_sym_17:String
    var term:Any
    var lst:Any
    var sc_term_18:sc_Pair
    var sc_term_19:sc_Pair
    var car_value:Any
    BgL_sc_za2symbolzd2recordszd2alistza2_2z00_nboyer = SC_NSNull()
    if_constructor_nboyer =
    BgL_sc_symbolzd2ze3symbolzd2record_1ze3_nboyer("\u{1E9C}if");
    sc_term_19 = sc_Pair("\u{1E9C}f", SC_NSNull())
    false_term_nboyer = sc_Pair(
        BgL_sc_symbolzd2ze3symbolzd2record_1ze3_nboyer((sc_term_19.car as String).getOrThrow()),
        translate_args_nboyer(sc_term_19.cdr)
      )
    sc_term_18 = sc_Pair("\u{1E9C}t", SC_NSNull())
    true_term_nboyer = sc_Pair(
      BgL_sc_symbolzd2ze3symbolzd2record_1ze3_nboyer((sc_term_18.car as String).getOrThrow()),
      translate_args_nboyer(sc_term_18.cdr)
    )
    lst = sc_const_3_nboyer
    while (!(lst is SC_NSNull)) {
        term = (lst as sc_Pair).getOrThrow().car
        if ((term is sc_Pair) &&
            ((term as sc_Pair).getOrThrow().car as String).getOrThrow() == "\u{1E9C}equal" &&
            ((term as sc_Pair).getOrThrow().cdr as sc_Pair).getOrThrow().car is sc_Pair) {
            sc_sym_17 = ((((term as sc_Pair).getOrThrow().cdr as sc_Pair).getOrThrow().car as sc_Pair).getOrThrow().car as String).getOrThrow()
            car_value = sc_Pair(
                BgL_sc_symbolzd2ze3symbolzd2record_1ze3_nboyer(((term as sc_Pair).getOrThrow().car as String).getOrThrow()),
                              translate_args_nboyer((term as sc_Pair).getOrThrow().cdr)
            )
            sym = ((((term as sc_Pair).getOrThrow().cdr as sc_Pair).getOrThrow().car as sc_Pair).getOrThrow().car as String).getOrThrow()
            BgL_sc_symbolzd2record_16zd2 =
                          BgL_sc_symbolzd2ze3symbolzd2record_1ze3_nboyer(sym)
            value = sc_Pair(car_value, (BgL_sc_symbolzd2record_16zd2 as sc_Vector).getOrThrow().arr[1])
            symbol_record = (BgL_sc_symbolzd2ze3symbolzd2record_1ze3_nboyer(sc_sym_17) as sc_Vector).getOrThrow()
            symbol_record.arr[1] = (value as Any).getOrThrow()
        } else {
            return false
        }
        lst = (lst as sc_Pair).getOrThrow().cdr
    }
    return true
}

private func BgL_testzd2boyerzd2(n: Int64) : Any {
  
    var optrOpnd:Any
    var term:Any
    var sc_n_20:Int64
    var answer:Bool
    var sc_term_21:Any
    var sc_term_22:Any
    rewrite_count_nboyer = 0
    term = sc_const_4_nboyer
    sc_n_20 = n
    while (sc_n_20 != 0) {
        term = sc_list(ArrayList<Any>.of("\u{1E9C}", term, sc_Pair("\u{1E9C}f", SC_NSNull())))
        sc_n_20 -= 1
    }
    sc_term_22 = term
    if (!(sc_term_22 is sc_Pair)) {
        optrOpnd = sc_term_22
    }else {
        optrOpnd = sc_Pair(
            BgL_sc_symbolzd2ze3symbolzd2record_1ze3_nboyer(((sc_term_22 as sc_Pair).getOrThrow().car as String).getOrThrow()),
            translate_args_nboyer((sc_term_22 as sc_Pair).getOrThrow().cdr)
        )
    }
    if (const_nboyer is SC_NSNull) {
        sc_term_21 = apply_subst_nboyer(SC_NSNull(), optrOpnd)
    } else {
        sc_term_21 = apply_subst_nboyer(
            sc_Pair(
                sc_Pair(
                    (const_nboyer.car as sc_Pair).getOrThrow().car,
                    translate_term_nboyer((const_nboyer.car as sc_Pair).getOrThrow().cdr)
                ),
                translate_alist_nboyer(const_nboyer.cdr)
            ),
            optrOpnd
        )
    }
    answer = tautologyp_nboyer(rewrite_nboyer(sc_term_21), SC_NSNull(), SC_NSNull())
    sc_write(rewrite_count_nboyer,SC_NSNull())
    sc_display(" rewrites", SC_NSNull())
    if (answer != false) {
        return rewrite_count_nboyer
    }else {
        return false
    }
}

private func warn(rewrites:Any) : Bool {
    var rewrites_value:Int64
    if (sc_isNumber(rewrites)){
        rewrites_value = (rewrites as Int64).getOrThrow()
        if (rewrites_value == 95024) {
            return true
        }else {
            return false
        }
    } else {
        return false
    }
}

private func run():Any{
    return BgL_testzd2boyerzd2(0)
}

private func BgL_nboyerzd2benchmarkzd2(argumentsAry: ArrayList<Any>){
   
    var args: ?sc_Pair = Option<sc_Pair>.None
    var sc_tmp = argumentsAry.size - 1
    while (sc_tmp >= 0) {
        args = Some(sc_cons(argumentsAry[sc_tmp], args ?? SC_NSNull()))
        sc_tmp -= 1
    }
    let n = if(args.isNone()) {0} else{args.getOrThrow().car}
    BgL_setupzd2boyerzd2()
    return BgL_runzd2benchmarkzd2("nboyer" + sc_number2string((n as Int64).getOrThrow()), 1, run, warn)
}

private func BgL_makezd2parserzd2(grammar: sc_Pair, lexer: ((lexer: sc_Pair) -> sc_Pair)) : (input:sc_Pair) -> ArrayList<Any>{

    var i: Int64
    // var parser_descr: ArrayList<Any>
    var nb_nts: Int64
    let names: sc_Vector
    let steps: sc_Vector
    let predictors: sc_Vector
    let enders: sc_Vector
    let starters: sc_Vector
    var nts: ArrayList<String> = ArrayList<String>()
    var sc_names_1: sc_Vector
    var sc_steps_2: sc_Vector
    var sc_predictors_3: sc_Vector
    var sc_enders_4: sc_Vector
    var sc_starters_5:  sc_Vector
    var nb_confs: Int64
    var BgL_sc_nbzd2nts_7zd2: Int64
    var sc_nts_8: ArrayList<String> = ArrayList<String>()

    func BgL_sc_defzd2loop_9zd2(defs: Any, sc_nts_11: Any) : ArrayList<String>  {
    
        var head: Any
        var def: sc_Pair
        if (defs is sc_Pair) {
            def = ((defs as sc_Pair).getOrThrow().car as sc_Pair).getOrThrow()
            head = def.car
            func rule_loop(rules: Any, sc_nts_12: sc_Pair) : ArrayList<String> {
                var nt: Any
                var l: Any
                var sc_nts_13: Any
                var rule: Any
                if (rules is sc_Pair) {
                    rule = ((rules as sc_Pair).getOrThrow().car as sc_Pair).getOrThrow()
                    l = rule
                    sc_nts_13 = sc_nts_12
                    while (l is sc_Pair){
                        nt = (l as sc_Pair).getOrThrow().car
                        l = (l as sc_Pair).getOrThrow().cdr
                        sc_nts_13 = (if(((sc_member(nt, sc_nts_13) as Bool) ?? true) != false) {sc_nts_13} else {sc_Pair(nt, sc_nts_13)})
                    }
                    return  rule_loop((rules as sc_Pair).getOrThrow().cdr , (sc_nts_13 as sc_Pair).getOrThrow())
                } else {
                    return BgL_sc_defzd2loop_9zd2((defs as sc_Pair).getOrThrow().cdr , sc_nts_12)
                }
            }
            return rule_loop(def.cdr, if((sc_member(head, sc_nts_11) as Bool).getOrThrow() != false) {(sc_nts_11 as sc_Pair).getOrThrow()} else{sc_Pair(head, sc_nts_11)})
        } else {
            var return_name : ArrayList<String> = ArrayList<String>()
            for (temp_return in sc_list2vector((sc_reverse(sc_nts_11) as sc_Pair).getOrThrow()).arr) {
                return_name.add((temp_return as String).getOrThrow())
            }
            return return_name
        }
    }


    sc_nts_8 = BgL_sc_defzd2loop_9zd2(grammar, SC_NSNull())

    BgL_sc_nbzd2nts_7zd2 = sc_nts_8.size

    func BgL_sc_defzd2loop_6zd2(defs: Any, BgL_sc_nbzd2confs_14zd2: Int64) : Int64 {
     
        let def: Any
        if (defs is sc_Pair) {
            def = (defs as sc_Pair).getOrThrow().car
            func rule_loop(rules: Any, BgL_sc_nbzd2confs_15zd2: Int64) : Int64 {
                 var l: Any
                 var BgL_sc_nbzd2confs_16zd2: Int64
                 var rule: sc_Pair
                 if (rules is sc_Pair) {
                     rule = ((rules as sc_Pair).getOrThrow().car as sc_Pair).getOrThrow()
                     l = rule
                     BgL_sc_nbzd2confs_16zd2 = BgL_sc_nbzd2confs_15zd2
                     while (l is sc_Pair) {
                         var temp_l = ((l as sc_Pair).getOrThrow().cdr as sc_Pair)
                         if(temp_l.isNone()) {
                            BgL_sc_nbzd2confs_16zd2 = BgL_sc_nbzd2confs_16zd2 + 1
                            break
                         }
                         l = temp_l.getOrThrow()
                         BgL_sc_nbzd2confs_16zd2 = BgL_sc_nbzd2confs_16zd2 + 1
                     }
                     return rule_loop((rules as sc_Pair).getOrThrow().cdr, BgL_sc_nbzd2confs_16zd2 + 1)
                 } else {
                     return BgL_sc_defzd2loop_6zd2((defs as sc_Pair).getOrThrow().cdr, BgL_sc_nbzd2confs_15zd2)
                 }
             }
            return rule_loop((def as sc_Pair).getOrThrow().cdr, BgL_sc_nbzd2confs_14zd2)
         } else {
             return BgL_sc_nbzd2confs_14zd2
         }
    }

    nb_confs = BgL_sc_defzd2loop_6zd2(grammar, 0) + BgL_sc_nbzd2nts_7zd2

    sc_starters_5 = sc_makeVector(BgL_sc_nbzd2nts_7zd2 , SC_NSNull())
    sc_enders_4 = sc_makeVector(BgL_sc_nbzd2nts_7zd2 , SC_NSNull())
    sc_predictors_3 = sc_makeVector(BgL_sc_nbzd2nts_7zd2 , SC_NSNull())
    sc_steps_2 = sc_makeVector(nb_confs , false)
    sc_names_1 = sc_makeVector(nb_confs , false)
    nts = sc_nts_8
    starters = sc_starters_5
    enders = sc_enders_4
    predictors = sc_predictors_3
    steps = sc_steps_2
    names = sc_names_1
    nb_nts = sc_nts_8.size
    i = nb_nts - 1
    while (i >= 0) {
        sc_steps_2.arr[i] = i - nb_nts
        sc_names_1.arr[i] = sc_list(ArrayList<Any>([sc_nts_8[i], 0]))
        sc_enders_4.arr[i] = sc_list(ArrayList<Any>([i]))
        i -= 1
    }
    func def_loop(defs: Any, conf: Int64) : Any {
    
        var head: String
        var def: sc_Pair
        if (defs is sc_Pair) {
            def = ((defs as sc_Pair).getOrThrow().car as sc_Pair).getOrThrow()
            head = (def.car as String).getOrThrow()
            func rule_loop(rules: Any, conf: Int64, rule_num: Int64) : Any {
                var i: Int64
                var sc_i_17:Int64
                var nt: String
                var l: Any
                var sc_conf_18: Int64
                var sc_i_19: Int64
                var rule: sc_Pair
                if (rules is sc_Pair) {
                    rule = ((rules as sc_Pair).getOrThrow().car as sc_Pair).getOrThrow()
                    names.arr[conf] = sc_list(ArrayList<Any>([head, rule_num]))
                    sc_i_19 = (ind(head, nts) as Int64).getOrThrow()
                    starters.arr[sc_i_19] = sc_Pair(conf, starters.arr[sc_i_19] )
                    l = rule
                    sc_conf_18 = conf
                    while (l is sc_Pair) {
                        nt = ((l as sc_Pair).getOrThrow().car as String).getOrThrow()
                        steps.arr[sc_conf_18] = ind(nt, nts)
                        sc_i_17 = (ind(nt, nts) as Int64).getOrThrow()
                        predictors.arr[sc_i_17] = sc_Pair(sc_conf_18, predictors.arr[sc_i_17])
                        l = ((l as sc_Pair).getOrThrow().cdr)
                        sc_conf_18 += 1
                    }
                    steps.arr[sc_conf_18] = ((ind(head, nts)) as Int64).getOrThrow() - nb_nts ;
                    i = (ind(head, nts) as Int64).getOrThrow()
                    enders.arr[i] = sc_Pair(sc_conf_18, enders.arr[i])
                    return rule_loop(((rules as sc_Pair).getOrThrow().cdr as Any).getOrThrow(), sc_conf_18 + 1, rule_num + 1)
                } else {
                    var temp_r = ((defs as sc_Pair).getOrThrow().cdr as sc_Pair)
                    if (temp_r.isSome()) {
                        return def_loop(temp_r.getOrThrow(), conf)
                    }
                    return def_loop(SC_NSNull(), conf)
                }
            }
            return rule_loop((def.cdr as Any).getOrThrow(), conf, 1)
        } else {
            return SC_NSNull()
        }
    }

    def_loop(grammar, sc_nts_8.size)
    let parser_descr : ArrayList<Any> = ArrayList<Any>([lexer, sc_nts_8, sc_starters_5, sc_enders_4, sc_predictors_3, sc_steps_2, sc_names_1])


    return { input =>
   
        var optrOpnd: Any
        var sc_optrOpnd_20: sc_Pair
        var sc_optrOpnd_21: sc_Pair
        var sc_optrOpnd_22: sc_Pair
        var BgL_sc_stateza2_23za2: sc_Vector
        var toks: sc_Vector
        var BgL_sc_nbzd2nts_24zd2: Int64
        var sc_steps_25: sc_Vector
        var sc_enders_26: sc_Vector
        var state_num: Int64
        var BgL_sc_statesza2_27za2: sc_Vector
        var states: sc_Vector
        var i: Int64
        var conf: Int64
        var l: Any
        var tok_nts: Any
        var sc_i_28: Int64
        var sc_i_29: Any
        var l1: sc_Pair
        var l2: sc_Pair
        var tok: sc_Pair
        var tail1129: sc_Pair
        var L1125: Any
        var goal_enders: sc_Pair
        var BgL_sc_statesza2_30za2: sc_Vector
        var BgL_sc_nbzd2nts_31zd2 : Int64
        var BgL_sc_nbzd2confs_32zd2: Int64
        var nb_toks: Int64
        var goal_starters: sc_Pair
        var sc_states_33: sc_Vector
        var BgL_sc_nbzd2confs_34zd2: Int64
        var BgL_sc_nbzd2toks_35zd2: Int64
        var sc_toks_36: sc_Vector
        var falseHead1128: sc_Pair
        var sc_names_37: sc_Vector
        var sc_steps_38: sc_Vector
        var sc_predictors_39: sc_Vector
        var sc_enders_40: sc_Vector
        var sc_starters_41: sc_Vector
        var sc_nts_42: ?ArrayList<String>

        func make_states(BgL_sc_nbzd2toks_50zd2: Int64, BgL_sc_nbzd2confs_51zd2: Int64) : sc_Vector {
        
            var v: sc_Vector
            var i: Int64
            var sc_states_52: sc_Vector
            sc_states_52 =   sc_makeVector(BgL_sc_nbzd2toks_50zd2 + 1, false)
            i = BgL_sc_nbzd2toks_50zd2
            while (i >= 0) {
                v = sc_makeVector(BgL_sc_nbzd2confs_51zd2 + 1, false)
                v.arr[0] = -1
                sc_states_52.arr[i] = v
                i -= 1
            }
            return sc_states_52
        }
        func BgL_sc_confzd2setzd2getza2_44za2(state: sc_Vector, BgL_sc_statezd2num_53zd2: Int64, sc_conf_54: Int64) : sc_Vector {
            var conf_set: sc_Vector
            var BgL_sc_confzd2set_55zd2: Any
            BgL_sc_confzd2set_55zd2 = state.arr[sc_conf_54 + 1]
            if (((BgL_sc_confzd2set_55zd2 as Bool) ?? true) != false) {
                return (BgL_sc_confzd2set_55zd2 as sc_Vector).getOrThrow()
            } else {
                conf_set = sc_makeVector( BgL_sc_statezd2num_53zd2 + 6, false)
                conf_set.arr[1] = -3
                conf_set.arr[2] = -1
                conf_set.arr[3] = -1
                conf_set.arr[4] = -1
                state.arr[sc_conf_54 + 1] = conf_set
                return conf_set
            }
        }
        func conf_set_merge_new_bang(conf_set: sc_Vector) {
            conf_set.arr[(conf_set.arr[1] as Int64).getOrThrow() + 5] = conf_set.arr[4]
            conf_set.arr[1] = conf_set.arr[3]
            conf_set.arr[3] = -1
            return conf_set.arr[4] = -1
        }
        func conf_set_adjoin(state: sc_Vector, conf_set: sc_Vector, sc_conf_56: Int64, i: Int64): Any {
            let tail: Int64 = (conf_set.arr[3] as Int64).getOrThrow()
            conf_set.arr[i + 5] = -1
            conf_set.arr[tail + 5] = i
            conf_set.arr[3] = i
            if (tail < 0) {
                conf_set.arr[0] = state.arr[0]
                state.arr[0] = sc_conf_56
                return sc_conf_56
            } else {
                return SC_NSNull()
            }
        }
        func BgL_sc_confzd2setzd2adjoinza2_45za2(sc_states_57: sc_Vector, BgL_sc_statezd2num_58zd2: Int64, l: sc_Pair, i: Int64) : Any {
    
            var conf_set: sc_Vector
            var sc_conf_59: Int64
            var l1: Any
            var state: sc_Vector
            state = (sc_states_57.arr[BgL_sc_statezd2num_58zd2] as sc_Vector).getOrThrow()
            l1 = l
            while (l1 is sc_Pair) {
                sc_conf_59 = ((l1 as sc_Pair).getOrThrow().car as Int64).getOrThrow()
                conf_set = BgL_sc_confzd2setzd2getza2_44za2(state, BgL_sc_statezd2num_58zd2, sc_conf_59)
                if ((conf_set.arr[i + 5] as Bool).getOrThrow() == false) {
                    conf_set_adjoin(state, conf_set, sc_conf_59, i)
                    l1 = (l1 as sc_Pair).getOrThrow().cdr
                } else {
                    l1 = (l1 as sc_Pair).getOrThrow().cdr
                }
            }
            return SC_NSNull()
     }
        func BgL_sc_confzd2setzd2adjoinza2za2_46z00(sc_states_60: sc_Vector, BgL_sc_statesza2_61za2: sc_Vector, BgL_sc_statezd2num_62zd2: Int64, sc_conf_63: Int64, i: Int64) : Bool {
            var BgL_sc_confzd2setza2_64z70: sc_Vector
            var BgL_sc_stateza2_65za2: sc_Vector
            var conf_set: Any
            let state: sc_Vector = (sc_states_60.arr[BgL_sc_statezd2num_62zd2] as sc_Vector).getOrThrow()
            conf_set = state.arr[sc_conf_63+1]
            if ((((if(((conf_set as Bool) ?? true) != false) {((conf_set as sc_Vector).getOrThrow().arr[i+5])} else {false}) as Bool) ?? true) != false ) {
                BgL_sc_stateza2_65za2 = ((BgL_sc_statesza2_61za2.arr[BgL_sc_statezd2num_62zd2]) as sc_Vector).getOrThrow()
                BgL_sc_confzd2setza2_64z70 = BgL_sc_confzd2setzd2getza2_44za2(BgL_sc_stateza2_65za2 , BgL_sc_statezd2num_62zd2, sc_conf_63)
                if(((BgL_sc_confzd2setza2_64z70.arr[i+5] as Bool) ?? true) == false) {
                    (conf_set_adjoin(BgL_sc_stateza2_65za2, BgL_sc_confzd2setza2_64z70, sc_conf_63, i))
                } else{Option<Any>.None}
                return true
            } else {
                return false
            }
        }
        func conf_set_union(state: sc_Vector, conf_set: sc_Vector, sc_conf_66: Int64, other_set: sc_Vector) : Any {
        
            var i = other_set.arr[2]
            while ((i as Int64).getOrThrow() >= 0 ){
                var temp_bool1 = (conf_set.arr[(i as Int64).getOrThrow() + 5] as Bool)
                if (temp_bool1.isSome() && temp_bool1.getOrThrow() == false) {
                    conf_set_adjoin(state, conf_set, sc_conf_66, (i as Int64).getOrThrow())
                    i = other_set.arr[(i as Int64).getOrThrow() + 5]
                } else {
                    i = other_set.arr[(i as Int64).getOrThrow() + 5]
                }
            }
            return SC_NSNull()
        }
        func forw(sc_states_67: sc_Vector, BgL_sc_statezd2num_68zd2: Int64, sc_starters_69: sc_Vector, sc_enders_70: sc_Vector, sc_predictors_71: sc_Vector, sc_steps_72: sc_Vector, sc_nts_73: ArrayList<String>) : Any{
        
            var next_set: sc_Vector
            var next: Int64
            var conf_set: Any
            var ender: Int64
            var l: Any
            var starter_set: sc_Vector
            var starter: Int64
            var sc_l_74: Any
            var head: Int64
            var BgL_sc_confzd2set_76zd2: sc_Vector
            var BgL_sc_statezd2num_77zd2: Int64
            var state: sc_Vector
            var sc_states_78: sc_Vector
            var preds: sc_Pair
            var BgL_sc_confzd2set_79zd2: sc_Vector
            var step: Int64
            var sc_conf_80: Int64
            var BgL_sc_nbzd2nts_81zd2: Int64
            var sc_state_82: sc_Vector
            sc_state_82 = (sc_states_67.arr[BgL_sc_statezd2num_68zd2] as sc_Vector).getOrThrow()
            BgL_sc_nbzd2nts_81zd2 = sc_nts_73.size
            while (true) {
                sc_conf_80 = (sc_state_82.arr[0] as Int64).getOrThrow()
                if (sc_conf_80 >= 0) {
                    step = (sc_steps_72.arr[sc_conf_80] as Int64).getOrThrow()
                    BgL_sc_confzd2set_79zd2 = ((sc_state_82.arr[sc_conf_80 + 1]) as sc_Vector).getOrThrow()
                    head = (BgL_sc_confzd2set_79zd2.arr[4] as Int64).getOrThrow()
                    sc_state_82.arr[0] = BgL_sc_confzd2set_79zd2.arr[0]
                    conf_set_merge_new_bang(BgL_sc_confzd2set_79zd2)
                    if (step >= 0) {
                        sc_l_74 = sc_starters_69.arr[step]
                        while (sc_l_74 is sc_Pair) {
                            starter = ((sc_l_74 as sc_Pair).getOrThrow().car as Int64).getOrThrow()
                            starter_set = BgL_sc_confzd2setzd2getza2_44za2(sc_state_82, BgL_sc_statezd2num_68zd2, starter)
                            var temp_bool: Bool = true
                            var temp_as = (starter_set.arr[BgL_sc_statezd2num_68zd2+5]) as Bool
                            if (temp_as.isSome()) {
                                temp_bool = temp_as.getOrThrow()
                            }
                            if (temp_bool == false) {
                                conf_set_adjoin(sc_state_82, starter_set, starter , BgL_sc_statezd2num_68zd2)
                                var temp_74 = ((sc_l_74 as sc_Pair).getOrThrow().cdr as sc_Pair)
                                sc_l_74 = SC_NSNull()
                                if (temp_74.isSome()) {
                                    sc_l_74 = temp_74.getOrThrow()
                                }
                            } else {
                                var temp_74 = ((sc_l_74 as sc_Pair).getOrThrow().cdr as sc_Pair)
                                sc_l_74 = SC_NSNull()
                                if (temp_74.isSome()) {
                                    sc_l_74 = temp_74.getOrThrow()
                                }
                            }
                        }
                        l = sc_enders_70.arr[step]
                        while (l is sc_Pair) {
                            ender = ((l as sc_Pair).getOrThrow().car as Int64).getOrThrow()
                            conf_set = sc_state_82.arr[(ender)+1]
                            if ((if(((conf_set as Bool) ?? true) != false) {((conf_set as sc_Vector).getOrThrow().arr[BgL_sc_statezd2num_68zd2+5] as Bool).getOrThrow()} else{false}) != false){
                                next = sc_conf_80 + 1
                                next_set = BgL_sc_confzd2setzd2getza2_44za2(sc_state_82, BgL_sc_statezd2num_68zd2, next)
                                conf_set_union(sc_state_82, next_set, next, BgL_sc_confzd2set_79zd2)
                                l = (l as sc_Pair).getOrThrow().cdr
                            } else {
                                l = (l as sc_Pair).getOrThrow().cdr
                            }
                        }
                    } else {
                        preds = (sc_predictors_71.arr[step + BgL_sc_nbzd2nts_81zd2] as sc_Pair).getOrThrow()
                        sc_states_78 = sc_states_67
                        state = sc_state_82
                        BgL_sc_statezd2num_77zd2 = BgL_sc_statezd2num_68zd2
                        BgL_sc_confzd2set_76zd2 = BgL_sc_confzd2set_79zd2
                        func sc_loop1_75(l: Any) : Any {
                            var sc_state_83: sc_Vector
                            var BgL_sc_nextzd2set_84zd2:sc_Vector
                            var sc_next_85:Int64
                            var pred_set:Any
                            var i: Int64
                            var pred: Int64
                            if (l is sc_Pair) {
                                pred = ((l as sc_Pair).getOrThrow().car as Int64).getOrThrow()
                                i = head
                                while (i >= 0) {
                                    sc_state_83 = (sc_states_78.arr[i ] as sc_Vector).getOrThrow()
                                    pred_set = sc_state_83.arr[pred+1]
                                    if (((pred_set as Bool) ?? true) != false){
                                        sc_next_85 = pred + 1
                                        BgL_sc_nextzd2set_84zd2 = BgL_sc_confzd2setzd2getza2_44za2(state, BgL_sc_statezd2num_77zd2 , sc_next_85)
                                        conf_set_union(state, BgL_sc_nextzd2set_84zd2, sc_next_85 , (pred_set as sc_Vector).getOrThrow())
                                    }
                                    i = (BgL_sc_confzd2set_76zd2.arr[i+5] as Int64).getOrThrow()
                                }
                                var temp_75 = ((l as sc_Pair).getOrThrow().cdr as sc_Pair)
                                if (temp_75.isSome()) {
                                    return sc_loop1_75(temp_75.getOrThrow())
                                }
                                return sc_loop1_75(SC_NSNull())
                            } else {
                                return SC_NSNull()
                            }
                        }
                        sc_loop1_75(preds)
                    }
                } else {
                    return SC_NSNull()
                }
            }
        }

        sc_nts_42 = parser_descr[1] as ArrayList<String>
        sc_starters_41 = (parser_descr[2] as sc_Vector).getOrThrow()
        sc_enders_40 = (parser_descr[3] as sc_Vector).getOrThrow()
        sc_predictors_39 = (parser_descr[4] as sc_Vector).getOrThrow()
        sc_steps_38 = (parser_descr[5] as sc_Vector).getOrThrow()
        sc_names_37 = (parser_descr[6] as sc_Vector).getOrThrow()
        falseHead1128 = sc_Pair(SC_NSNull(), SC_NSNull())
        L1125 = lexer(input)
        tail1129 = falseHead1128

        while (!(L1125 is SC_NSNull)) {
            tok = ((L1125 as sc_Pair).getOrThrow().car as sc_Pair).getOrThrow()
            var l1: Any = (tok.cdr as sc_Pair).getOrThrow()
            var l2: Any = SC_NSNull()
            while (l1 is sc_Pair) {
                sc_i_29 = sc_ind_43((l1 as sc_Pair).getOrThrow().car, sc_nts_42 ?? ArrayList<String>())
                if (((sc_i_29 as Bool) ?? true) != false) {
                    l1 = (l1 as sc_Pair).getOrThrow().cdr
                    l2 = sc_Pair(sc_i_29, l2)
                } else {
                    l1 = (l1 as sc_Pair).getOrThrow().cdr
                }
            }
            sc_optrOpnd_22 = sc_Pair(tok.car,   sc_reverse(l2))
            sc_optrOpnd_21 = sc_Pair(sc_optrOpnd_22, SC_NSNull())
            tail1129.cdr = sc_optrOpnd_21
            tail1129 = (tail1129.cdr as sc_Pair).getOrThrow()
            L1125 = (L1125 as sc_Pair).getOrThrow().cdr
        }
        sc_optrOpnd_20 = (falseHead1128.cdr as sc_Pair).getOrThrow()
        sc_toks_36 = sc_list2vector(sc_optrOpnd_20)
        BgL_sc_nbzd2toks_35zd2 = sc_toks_36.arr.size
        BgL_sc_nbzd2confs_34zd2 = sc_steps_38.arr.size
        sc_states_33 = make_states(BgL_sc_nbzd2toks_35zd2 ,BgL_sc_nbzd2confs_34zd2 )
        goal_starters = (sc_starters_41.arr[0] as sc_Pair).getOrThrow()
        BgL_sc_confzd2setzd2adjoinza2_45za2(sc_states_33, 0 , goal_starters, 0)
        forw(sc_states_33, 0, sc_starters_41, sc_enders_40, sc_predictors_39, sc_steps_38, sc_nts_42.getOrThrow())
        sc_i_28 = 0
        while (sc_i_28 < BgL_sc_nbzd2toks_35zd2) {
            tok_nts = (sc_toks_36.arr[sc_i_28] as sc_Pair).getOrThrow().cdr
            var temp111 = (tok_nts as sc_Pair).getOrThrow()
            BgL_sc_confzd2setzd2adjoinza2_45za2(sc_states_33, sc_i_28 + 1, (tok_nts as sc_Pair).getOrThrow(), sc_i_28)
            forw(sc_states_33, sc_i_28 + 1, sc_starters_41, sc_enders_40, sc_predictors_39, sc_steps_38, sc_nts_42.getOrThrow())
            sc_i_28 += 1
        }
        nb_toks = sc_toks_36.arr.size
        BgL_sc_nbzd2confs_32zd2 = sc_steps_38.arr.size
        BgL_sc_nbzd2nts_31zd2 = sc_nts_42.getOrThrow().size
        BgL_sc_statesza2_30za2 = make_states(nb_toks, BgL_sc_nbzd2confs_32zd2)
        goal_enders = (sc_enders_40.arr[0] as sc_Pair).getOrThrow()
        l = goal_enders

        while (l is sc_Pair) {
            conf = ((l as sc_Pair).getOrThrow().car as Int64).getOrThrow()
            BgL_sc_confzd2setzd2adjoinza2za2_46z00(sc_states_33, BgL_sc_statesza2_30za2, nb_toks, conf, 0)
            l = (l as sc_Pair).getOrThrow().cdr
        }
        i = nb_toks
        while (i >= 0) {
            states = sc_states_33
            BgL_sc_statesza2_27za2 = BgL_sc_statesza2_30za2
            state_num = i
            sc_enders_26 = sc_enders_40
            sc_steps_25 = sc_steps_38
            BgL_sc_nbzd2nts_24zd2 = BgL_sc_nbzd2nts_31zd2
            toks = sc_toks_36
            BgL_sc_stateza2_23za2 = (BgL_sc_statesza2_30za2.arr[i] as sc_Vector).getOrThrow()
            func loop1() : Any {
                var prev: Int64 = 0
                var BgL_sc_statesza2_128za2: sc_Vector
                var sc_states_129: sc_Vector
                var j: Int64
                var i: Int64
                var sc_i_130: Int64
                var head: Int64

                var conf_set: sc_Vector
                var sc_conf_131 = (BgL_sc_stateza2_23za2.arr[0] as Int64).getOrThrow()
                if (sc_conf_131 >= 0) {
                    conf_set = (BgL_sc_stateza2_23za2.arr[sc_conf_131 + 1] as sc_Vector).getOrThrow()
                    head = (conf_set.arr[4] as Int64).getOrThrow()
                    BgL_sc_stateza2_23za2.arr[0] = conf_set.arr[0]
                    conf_set_merge_new_bang(conf_set)
                    sc_i_130 = head
                    while (sc_i_130 >= 0) {
                        i = sc_i_130
                        j = state_num
                        sc_states_129 = states
                        BgL_sc_statesza2_128za2 = BgL_sc_statesza2_27za2
                        prev = sc_conf_131 - 1
                        if (sc_conf_131 >= BgL_sc_nbzd2nts_24zd2 && (sc_steps_25.arr[prev] as Int64).getOrThrow() >= 0) {
                            func sc_loop1_127(paramL: Any) : Any {
                                var k: Int64
                                var ender_set: Any
                                var state: sc_Vector
                                var ender: Int64
                                var l: Any = paramL
                                while (true) {
                                    if (l is sc_Pair) {
                                        ender = ((l as sc_Pair).getOrThrow().car as Int64).getOrThrow()
                                        state = (sc_states_129.arr[j] as sc_Vector).getOrThrow()
                                        ender_set = (state.arr[ender + 1] as Any).getOrThrow()
                                        if (((ender_set as Bool) ?? true) != false) {
                                            var temp_k = ((ender_set as sc_Vector).getOrThrow().arr[2] as Int64)
                                            k = -1
                                            if (temp_k.isSome()) {
                                                k = temp_k.getOrThrow()
                                            }
                                            while (k >= 0) {
                                                if (k >= i) {
                                                    if (BgL_sc_confzd2setzd2adjoinza2za2_46z00(sc_states_129,
                                                        BgL_sc_statesza2_128za2, k, prev, i) != false) {
                                                        BgL_sc_confzd2setzd2adjoinza2za2_46z00(sc_states_129, BgL_sc_statesza2_128za2, j, ender, k)
                                                    }
                                                }
                                                var temp_kk = ((ender_set as sc_Vector).getOrThrow().arr[k + 5] as Int64)
                                                k = -1
                                                if (temp_kk.isSome()) {
                                                    k = temp_kk.getOrThrow()
                                                }
                                            }
                                            var temp_127 = ((l as sc_Pair).getOrThrow().cdr as sc_Pair)
                                            if (temp_127.isNone()) {
                                                return sc_loop1_127(SC_NSNull())
                                            }
                                            return sc_loop1_127(temp_127.getOrThrow())
                                        } else {
                                            var temp_ll = ((l as sc_Pair).getOrThrow().cdr as sc_Pair)
                                            l = SC_NSNull()
                                            if (temp_ll.isSome()) {
                                                l = (temp_ll.getOrThrow() as Any).getOrThrow()
                                            }
                                        }
                                    } else {
                                        return SC_NSNull()
                                    }
                                }
                            }
                            sc_loop1_127((sc_enders_26.arr[(sc_steps_25.arr[prev] as Int64).getOrThrow()] as sc_Pair).getOrThrow())
                        }
                        sc_i_130 = (conf_set.arr[sc_i_130 + 5] as Int64).getOrThrow()
                    }
                    return loop1()
                } else {
                     return SC_NSNull()
                }
            }
            loop1()
            i -= 1
        }
  
        optrOpnd = BgL_sc_statesza2_30za2
        return ArrayList<Any>([sc_nts_42.getOrThrow(), sc_starters_41, sc_enders_40, sc_predictors_39, sc_steps_38, sc_names_37, sc_toks_36, optrOpnd, 0, 0, 0])
    }
}

private func ind(nt: String, sc_nts_10:ArrayList<String>) : Any{

    var i = sc_nts_10.size - 1
    while (true) {
        if (i >= 0) {
            if (sc_isEqual(sc_nts_10[i], nt)) {
                return i
            } else {
                i -= 1
            }
        } else {
            return false
        }
    }
}

private func test(k: Int64) : Int64 {

    let const_earley = sc_Pair(sc_Pair("\u{1E9C}s",sc_Pair(sc_Pair("\u{1E9C}a", SC_NSNull()),sc_Pair(sc_Pair("\u{1E9C}s",sc_Pair("\u{1E9C}s", SC_NSNull())),SC_NSNull()))),SC_NSNull());
    var x:ArrayList<Any>
    var p: (input: sc_Pair) -> ArrayList<Any>
    p = BgL_makezd2parserzd2( const_earley, lexer)
    x = p((sc_vector2list( sc_makeVector( k, "\u{1E9C}a")) as sc_Pair).getOrThrow())
    let result = sc_length((BgL_parsezd2ze3treesz31(x, "\u{1E9C}s",  0, k) as sc_Pair).getOrThrow())
    return result
}

private func lexer(l: sc_Pair) : sc_Pair{
    var sc_x_134: ?String
    var falseHead1133: sc_Pair = sc_Pair(SC_NSNull(), SC_NSNull())
    var tail1134 = falseHead1133
    var L1130: Any = l
    while (!(L1130 is SC_NSNull)) {
        sc_x_134 = ((L1130 as sc_Pair).getOrThrow().car as String).getOrThrow()
        tail1134.cdr = sc_Pair(sc_list(ArrayList<Any>([sc_x_134.getOrThrow(), sc_x_134.getOrThrow()])), SC_NSNull())
        tail1134 = (tail1134.cdr as sc_Pair).getOrThrow()
        L1130 = (L1130 as sc_Pair).getOrThrow().cdr
    }
    return (falseHead1133.cdr as sc_Pair).getOrThrow()
}

private func deriv_trees(sc_conf_91: Int64, i: Int64, j: Int64, sc_enders_92: sc_Vector, sc_steps_93: sc_Vector, sc_names_94:sc_Vector,sc_toks_95: ArrayList<sc_Pair>, sc_states_96: sc_Vector, BgL_sc_nbzd2nts_97zd2: Int64) : sc_Pair {

    var prev: Int64
    let name: Any = sc_names_94.arr[sc_conf_91]
    if (((name as Bool) ?? true) != false) {
        if (sc_conf_91 < BgL_sc_nbzd2nts_97zd2) {
            return (sc_list(ArrayList<Any>([sc_list(ArrayList<Any>([(name as Any).getOrThrow(), (sc_toks_95[i].car as Any).getOrThrow()]))])) as sc_Pair).getOrThrow()
        } else {
            return (sc_list(ArrayList<Any>([sc_list(ArrayList<Any>([(name as Any).getOrThrow()]))])) as sc_Pair).getOrThrow()
        }
    } else {
        prev = sc_conf_91 - 1
        func sc_loop1_98(l1_param: Any, l2_param: Any) : Any {
     
            var ender_set: Any
            var state: sc_Vector
            var ender: Int64
            var l1: Any = l1_param
            var l2: Any = l2_param
            while (true) {
                if (l1 is sc_Pair) {
                    ender = ((l1 as sc_Pair).getOrThrow().car as Int64).getOrThrow()
                    state = (sc_states_96.arr[j] as sc_Vector).getOrThrow()
                    ender_set = state.arr[ender + 1]
                    if (((ender_set as Bool) ?? true) != false) {
                        func loop2(paramK: Int64, paramL2: Any) : Any {
                            var ender_trees: sc_Pair
                            var prev_trees: sc_Pair
                            var conf_set: Any
                            var sc_state_99: sc_Vector
                            var k: Int64 = paramK
                            var l2: Any = paramL2
                            while (true) {
                                if (k >= 0) {
                                    sc_state_99 = (sc_states_96.arr[k] as sc_Vector).getOrThrow()
                                    conf_set = sc_state_99.arr[prev+1]
                                    if (k >= i && (((if(((conf_set as Bool) ?? true) != false)  {((conf_set as sc_Vector).getOrThrow().arr[i+5])} else{false}) as Bool) ?? true) != false) {
                                        prev_trees = deriv_trees(prev, i, k,  sc_enders_92,  sc_steps_93,  sc_names_94,  sc_toks_95, sc_states_96,  BgL_sc_nbzd2nts_97zd2)
                                        ender_trees = deriv_trees(ender, k, j, sc_enders_92,  sc_steps_93,  sc_names_94,  sc_toks_95,  sc_states_96, BgL_sc_nbzd2nts_97zd2)
                                        func loop3(l3: Any, l2: Any) : Any {
                                            var l4: Any
                                            var sc_l2_100: Any
                                            var ender_tree: sc_Pair
                                            if (l3 is sc_Pair) {
                                                ender_tree = (sc_list(ArrayList<Any>([((l3 as sc_Pair).getOrThrow().car as Any).getOrThrow()])) as sc_Pair).getOrThrow()
                                                l4 = prev_trees
                                                sc_l2_100 = l2
                                                while (l4 is sc_Pair) {
                                                    sc_l2_100 = sc_Pair(sc_append(ArrayList<Any>([((l4 as sc_Pair).getOrThrow().car as sc_Pair).getOrThrow(), ender_tree])), sc_l2_100)
                                                    var temp_l4 = ((l4 as sc_Pair).getOrThrow().cdr as sc_Pair)
                                                    l4 = SC_NSNull()
                                                    if (temp_l4.isSome()) {
                                                        l4 = temp_l4.getOrThrow()
                                                    }
                                                }
                                                return loop3((l3 as sc_Pair).getOrThrow().cdr, sc_l2_100)
                                            } else {
                                                return (loop2(((ender_set as sc_Vector).getOrThrow().arr[k + 5] as Int64).getOrThrow(), l2) as Any).getOrThrow()
                                            }
                                        }
                                        return loop3(ender_trees, l2)
                                    } else {
                                        k = ((ender_set as sc_Vector).getOrThrow().arr[k + 5] as Int64).getOrThrow()
                                    }
                                } else {
                                    return sc_loop1_98((l1 as sc_Pair).getOrThrow().cdr, l2)
                                }
                            }
                        }
                        return loop2(((ender_set as sc_Vector).getOrThrow().arr[2] as Int64).getOrThrow(), l2)
                    } else {
                        l1 = (l1 as sc_Pair).getOrThrow().cdr
                    }
                } else {
                    return l2
                }
            }
        }
        return (sc_loop1_98(sc_enders_92.arr[(sc_steps_93.arr[prev] as Int64).getOrThrow()], SC_NSNull()) as sc_Pair).getOrThrow()
    }
}

private func BgL_sc_derivzd2treesza2_47z70(nt: String, i: Int64, j: Int64, sc_nts_101: ArrayList<String>, sc_enders_102: sc_Vector, sc_steps_103: sc_Vector, sc_names_104: sc_Vector, sc_toks_105: ArrayList<sc_Pair>, sc_states_106: sc_Vector) : Any {

    var conf_set: Any
    var state: sc_Vector
    var sc_conf_107: Int64
    var l: Any
    var trees: Any
    var BgL_sc_nbzd2nts_108zd2: Int64
    var BgL_sc_ntza2_109za2: Any
    BgL_sc_ntza2_109za2 = sc_ind_43(nt, sc_nts_101)
    if (((BgL_sc_ntza2_109za2 as Bool) ?? true) != false) {
        BgL_sc_nbzd2nts_108zd2 = sc_nts_101.size
        l = sc_enders_102.arr[(BgL_sc_ntza2_109za2 as Int64).getOrThrow()]
        trees = SC_NSNull()
        while (l is sc_Pair) {
            sc_conf_107 = ((l as sc_Pair).getOrThrow().car as Int64).getOrThrow()
            state = (sc_states_106.arr[j] as sc_Vector).getOrThrow()
            conf_set = state.arr[sc_conf_107 + 1]

            if ((((if(((conf_set as Bool) ?? true) != false) {(conf_set as sc_Vector).getOrThrow().arr[i + 5]} else{false}) as Bool) ?? true) != false) {
                l = ((l as sc_Pair).getOrThrow().cdr as sc_Pair).getOrThrow()
                trees = sc_append(ArrayList<Any>([deriv_trees(sc_conf_107, i, j, sc_enders_102, sc_steps_103, sc_names_104, sc_toks_105, sc_states_106, BgL_sc_nbzd2nts_108zd2), trees]))
            } else {
                var temp_lll = (l as sc_Pair).getOrThrow().cdr as sc_Pair
                l = SC_NSNull()
                if (temp_lll.isSome()) {
                    l = temp_lll.getOrThrow()
                }
            }
        }
        return trees
    } else {
        return false
    }
}

private func BgL_parsezd2ze3treesz31(parse: ArrayList<Any>, nt: String, i: Int64, j:Int64) : Any {

    var states: sc_Vector
    var toks: ArrayList<sc_Pair> = ArrayList<sc_Pair>()
    var names: sc_Vector
    var steps: sc_Vector
    var enders: sc_Vector
    var nts: ArrayList<String>
    nts = (parse[0] as ArrayList<String>).getOrThrow()
    enders = (parse[2] as sc_Vector).getOrThrow()
    steps = (parse[4] as sc_Vector).getOrThrow()
    names = (parse[5] as sc_Vector).getOrThrow()
    // toks = ((parse[6] as sc_Vector).getOrThrow().arr as ArrayList<sc_Pair>).getOrThrow()

    for (temp_toks in (parse[6] as sc_Vector).getOrThrow().arr) {
        toks.add((temp_toks as sc_Pair).getOrThrow())
    }

    states = (parse[7] as sc_Vector).getOrThrow()
    return BgL_sc_derivzd2treesza2_47z70( nt, i, j, nts, enders, steps, names, toks, states)
}

private func sc_ind_43(nt: Any, sc_nts_49: ArrayList<String>) : Any {
    
    var i = sc_nts_49.size - 1
    while (true) {
        if (i >= 0) {
            if (sc_isEqual(sc_nts_49[i], nt)) {
                return i
            } else {
                i -= 1
            }
        } else {
            return false
        }
    }
}

private func sc_number2jsstring(x:Int64) : String {
   
    return x.toString()
}

private class sc_ErrorOutputPort{
    func appendJSString(s:Any){
        return
    }
    func close(){}
}

private let SC_DEFAULT_OUT = sc_ErrorOutputPort()

private func sc_toWriteString(o:Any) : String {


    if (o is SC_NSNull) {
        return "()"
    }else if (o is Bool) {
        if (((o as Bool).getOrThrow()) == true) {
            return "#t"
        }
        return "#f"
    }else if (o is Int64) {
        return (o as Int64).getOrThrow().toString()
    }
    return ""
}

private func sc_toDisplayString(o:Any) : String {


    if (o is SC_NSNull) {
        return "()"
    }else if (o is Bool) {
        if (((o as Bool).getOrThrow()) == true) {
            return "#t"
        }
        return "#f"
    }else if (o is Int64) {
        return (o as Int64).getOrThrow().toString()
    }
    return ""
}

private func sc_list(args:ArrayList<Any>) : Any {
    var res:Any = SC_NSNull()
    var i = args.size - 1
    while (i >= 0) {
        res = sc_Pair(args[i],res)
        i -= 1
    }
    return res
}

private func sc_write(o:Any,p:Any) {
 

    var p1 = p
    if(p is SC_NSNull){
        p1 = SC_DEFAULT_OUT
    }
    (p1 as sc_ErrorOutputPort).getOrThrow().appendJSString(sc_toWriteString(o))
}

private func sc_display(o:Any,p:Any) {
   

    var p1 = p
    if(p is SC_NSNull){
        p1 = SC_DEFAULT_OUT
    }
    (p1 as sc_ErrorOutputPort).getOrThrow().appendJSString(sc_toDisplayString(o))
}

private func sc_isNumber(n:Any) : Bool {
    return (n is Int64)
}

private func sc_cons(car: Any,cdr: Any) : sc_Pair {
    return sc_Pair(car, cdr)
}

private func sc_isPair(p:Any) : Bool {
    return p is sc_Pair
}

private func sc_isPairEqual(p1:sc_Pair, p2:sc_Pair, comp:(a: Any, b: Any) -> Bool) : Bool {
    return comp(p1.car, p2.car) && comp(p1.cdr, p2.cdr)
}

private func sc_isVectorEqual(v1: sc_Vector, v2:sc_Vector,comp:(a: Any, b: Any) -> Bool) : Bool {
    if (v1.arr.size != v2.arr.size) {
        return false
    }
    for (i in 0..=(v1.arr.size-1)) {
        if (!comp(v1.arr[i], v2.arr[i])){
            return false
        }
    }
    return true
}

private func sc_isVector(v:Any) : Bool {
    return (v is sc_Vector)
}

private func sc_isEqual(o1:Any,o2:Any) : Bool {
    var result_Any:Bool
    var result_Pair:Bool
    var result_Vector:Bool
    var result_String:Bool

    result_String = (o1 is String) && (o2 is String) && (o1 as String).getOrThrow() == (o2 as String).getOrThrow()
    result_Any = (o1 is Object) && (o2 is Object) && (refEq((o1 as Object).getOrThrow(), (o2 as Object).getOrThrow()))
    result_Pair = sc_isPair(o1) && sc_isPair(o2) && sc_isPairEqual((o1 as sc_Pair).getOrThrow(), (o2 as sc_Pair).getOrThrow(), sc_isEqual)
    result_Vector = sc_isVector(o1) && sc_isVector(o2) && sc_isVectorEqual((o1 as sc_Vector).getOrThrow(), (o2 as sc_Vector).getOrThrow(), sc_isEqual)
    if (result_Any || result_Pair || result_Vector || result_String) {
        return true
    }else{
        return false
    }
}

private func sc_assq(o:String, al:Any) : Any {
    var aln:Any = al

    while (!(aln is SC_NSNull)) {
        if ((((aln as sc_Pair).getOrThrow().car as sc_Pair).getOrThrow().car as String).getOrThrow() == o) {
            return (aln as sc_Pair).getOrThrow().car
        }
        aln = (aln as sc_Pair).getOrThrow().cdr
    }
    return false
}

private func BgL_sc_symbolzd2ze3symbolzd2record_1ze3_nboyer(sym: String) : Any {
    
    var r:Any
    var x:Any
    x = sc_assq(sym, BgL_sc_za2symbolzd2recordszd2alistza2_2z00_nboyer);
    if (x is sc_Pair) {
        return (x as sc_Pair).getOrThrow().cdr
    } else {
        r = sc_Vector(ArrayList([sym, SC_NSNull()]))
        BgL_sc_za2symbolzd2recordszd2alistza2_2z00_nboyer = sc_Pair(
            sc_Pair(sym,r),
            BgL_sc_za2symbolzd2recordszd2alistza2_2z00_nboyer
        )
        return r
    }
}

private func translate_term_nboyer(term: Any) : Any {
   
    var lst: Any
    var cdr_value: Any
    if (!(term is sc_Pair)) {
        return term
    }
    lst = (term as sc_Pair).getOrThrow().cdr
    if (lst is SC_NSNull) {
        cdr_value = SC_NSNull()
        return sc_Pair(
            BgL_sc_symbolzd2ze3symbolzd2record_1ze3_nboyer(((term as sc_Pair).getOrThrow().car as String).getOrThrow()),
            cdr_value
        )
    } else {
        return sc_Pair(
            BgL_sc_symbolzd2ze3symbolzd2record_1ze3_nboyer(((term as sc_Pair).getOrThrow().car as String).getOrThrow()),
            sc_Pair(
              translate_term_nboyer((lst as sc_Pair).getOrThrow().car),
              translate_args_nboyer((lst as sc_Pair).getOrThrow().cdr)
            )
        )
    }
}

private func translate_args_nboyer(lst: Any) : Any {
  
    var sc_lst_5: Any
    var term: Any
    var car_value: Any
    var cdr_value: Any
    if (lst is SC_NSNull) {
        return SC_NSNull()
    }
    term = (lst as sc_Pair).getOrThrow().car
    car_value = if(!(term is sc_Pair)) {term} else{sc_Pair(
        BgL_sc_symbolzd2ze3symbolzd2record_1ze3_nboyer(((term as sc_Pair).getOrThrow().car as String).getOrThrow()),
        translate_args_nboyer((term as sc_Pair).getOrThrow().cdr)
    )};
    sc_lst_5 = (lst as sc_Pair).getOrThrow().cdr
    if (sc_lst_5 is SC_NSNull) {
        cdr_value = SC_NSNull()
    } else {
        cdr_value = sc_Pair(
            translate_term_nboyer((sc_lst_5 as sc_Pair).getOrThrow().car),
            translate_args_nboyer((sc_lst_5 as sc_Pair).getOrThrow().cdr)
        )
    }
    return sc_Pair(car_value, cdr_value)
}

private func apply_subst_nboyer(alist:Any, term:Any) : Any {
    var lst:Any
    var temp_temp:Any
    if (!(term is sc_Pair)) {
        temp_temp = sc_assq(term as String ?? ((term as Int64).getOrThrow()).toString(), alist)
        if (temp_temp is sc_Pair) {
            return (temp_temp as sc_Pair).getOrThrow().cdr
        } else {
            return term
        }
    }else {
        lst = (term as sc_Pair).getOrThrow().cdr
        if (lst is SC_NSNull) {
            return sc_Pair((term as sc_Pair).getOrThrow().car, SC_NSNull())
        }else{
            return sc_Pair(
                (term as sc_Pair).getOrThrow().car,
                sc_Pair(
                    apply_subst_nboyer(alist, (lst as sc_Pair).getOrThrow().car),
                    apply_subst_lst_nboyer(alist, (lst as sc_Pair).getOrThrow().cdr)
                )
            )
        }
    }
}

private func is_term_member_nboyer(x:Any, lst:Any) : Bool {

    var temp_lst = lst
    while (true) {
        if (temp_lst is SC_NSNull) {
            return false
        }else if (is_term_equal_nboyer(x, (temp_lst as sc_Pair).getOrThrow().car) != false) {
            return true
        }else {
            temp_lst = (temp_lst as sc_Pair).getOrThrow().cdr
        }
    }
    throw Exception()
}

private func is_term_equal_nboyer(x:Any, y:Any) : Bool {
    var lst1:Any
    var lst2:Any
    var r2:Any
    var r1:Any
    if (x is sc_Pair) {
        if (y is sc_Pair) {
            r1 = (x as sc_Pair).getOrThrow().car
            r2 = (y as sc_Pair).getOrThrow().car
            if (refEq((r1 as Object).getOrThrow(), (r2 as Object).getOrThrow()) != false) {
                lst1 = (x as sc_Pair).getOrThrow().cdr
                lst2 = (y as sc_Pair).getOrThrow().cdr
                while (true) {
                    if (lst1 is SC_NSNull) {
                        return lst2 is SC_NSNull
                    } else if (lst2 is SC_NSNull) {
                        return false
                    } else if (is_term_equal_nboyer((lst1 as sc_Pair).getOrThrow().car, (lst2 as sc_Pair).getOrThrow().car) != false) {
                        lst1 = (lst1 as sc_Pair).getOrThrow().cdr
                        lst2 = (lst2 as sc_Pair).getOrThrow().cdr
                    }else {
                        return false
                    }
                }
            } else {
                return false
            }
        } else {
            return false
        }
    }else {
        return sc_isEqual(x, y)
    }
    throw Exception()
}

private func sc_member(o: Any, l: Any) : Any {
    var current: Any = l

    while (current is sc_Pair) {
        if (sc_isEqual((current as sc_Pair).getOrThrow().car, o)) {
            return current
        }
        current = (current as sc_Pair).getOrThrow().cdr
    }
    return false
}

private func sc_makeVector(size: Int64, fill: Any) : sc_Vector {
    var nullArr: ArrayList<Any> = ArrayList<Any>()
    for (i in 0..size) {
        nullArr.add(SC_NSNull())
    }
    var a: sc_Vector = sc_Vector(nullArr)
    if (!(fill is SC_NSNull)) {
        var i = 0
        while (i < a.arr.size ) {
            a.arr[i] = fill
            i += 1
        }
    }
    return a
}

private func sc_vector2list(a: sc_Vector) : Any {
    var res: Any = SC_NSNull()
    var i = a.arr.size-1
    while (i >= 0) {
        res = sc_cons(a.arr[i], res)
        i -= 1
    }
    return res
}

private func sc_list2vector(l: sc_Pair) : sc_Vector{
    var a: sc_Vector = sc_Vector(ArrayList<Any>())
    var list: Any = l
    while (!(list is SC_NSNull)) {
        a.arr.add((list as sc_Pair).getOrThrow().car)
        list = (list as sc_Pair).getOrThrow().cdr
    }
    return a
}

private func sc_length(l: sc_Pair) : Int64{
    var res: Int64 = 0
    var l1: Any = l
    while (!(l1 is SC_NSNull)) {
        res += 1
        l1 = (l1 as sc_Pair).getOrThrow().cdr
    }
    return res
}

private func sc_reverseAppendBang(l1: ?sc_Pair, l2: ?sc_Pair) : sc_Pair {
    var res = l2
    var current = l1
    while (current.isSome()) {
        let tmp = res
        res = current
        current = (current.getOrThrow().cdr as sc_Pair)
        res.getOrThrow().cdr = (tmp as Any).getOrThrow()
    }
    return res.getOrThrow()
}

private func sc_dualAppend(l1: ?sc_Pair, l2: ?sc_Pair) : sc_Pair {
    if (l1.isNone()) { return l2.getOrThrow() }
    if (l2.isNone()) { return l1.getOrThrow() }
    let rev: Any = sc_reverse(l1.getOrThrow())
    return sc_reverseAppendBang((rev as sc_Pair), l2)
}

private func sc_append(args: ArrayList<Any>) : Any {

    if (args.size == 0) {
            return SC_NSNull();
    }
    var res: Any = args[args.size - 1]
    var i = args.size - 2
    while (i >= 0) {
        res = (sc_dualAppend((args[i] as sc_Pair), (res as sc_Pair)) as Any).getOrThrow()
        i -= 1
    }
    return res
}

private func sc_reverse(l1: Any) : Any {
    var res: Any = SC_NSNull()
    var current: Any = (l1 as Any).getOrThrow()
    while (current is sc_Pair) {
        res = sc_cons(((current as sc_Pair).getOrThrow().car as Any).getOrThrow(), res)
        current = ((current as sc_Pair).getOrThrow().cdr as Any).getOrThrow()
    }
    return res
}

private func BgL_earleyzd2benchmarkzd2(argumentsAry: ArrayList<Any>) {


    var args: Any = SC_NSNull()
    var sc_tmp = argumentsAry.size - 1
    while (sc_tmp >= 0) {
        args = sc_cons( argumentsAry[sc_tmp], args)
        sc_tmp -= 1
    }
    let k: Int64 = (if (args is SC_NSNull) {7} else{((args as sc_Pair).getOrThrow().car as Int64).getOrThrow()})
    func warn(result: Any) : Bool {
        sc_display(result, SC_NSNull())
        sc_newline(SC_NSNull())
        return (result as Int64).getOrThrow() == 132
    }
    let run:(()->Any) = { =>
        return test(k)
    }
    return BgL_runzd2benchmarkzd2("earley", 1, run, warn)
}

private func sc_newline(p: Any) {
    var p1 = p
    if (p1 is SC_NSNull) { // we assume not given
        p1 = SC_DEFAULT_OUT
    }
    (p1 as sc_ErrorOutputPort).getOrThrow().appendJSString("\n")
}

private func RunBenchmark(name: String, count:Int64, run:()-> Any, warn:(Any) -> Bool){

    for (_ in 0..count) {
        let result:Any = run()
    
        if (!warn(result)) {
            return
        }
    }
}


/*
 * @State
 */
private class Benchmark{
    /*
     *@Benchmark
     */
    func runIteration() {
        BgL_earleyzd2benchmarkzd2(ArrayList<Any>([]))
        BgL_nboyerzd2benchmarkzd2(ArrayList<Any>([]))
    }
}

private class sc_Vector {
    var arr:ArrayList<Any>
    init(arr: ArrayList<Any>) {
        this.arr = arr
    }
}

private func earleyBoyerRunIteration() {
    let start = Timer().getTime()
    for (_ in 0..20) {
        Benchmark().runIteration()
    }
    let end = Timer().getTime()
    println("earley-boyer: ms = ${Float64((end-start).toNanoseconds())/1000000.0}")
}

private class Timer {
    public func getTime() {
        let time = DateTime.now()
        return time
    }
}

private func debuglog(str: String) {
    let isLog = false
    if (isLog) {
        println(str)
    }
}

main() {
    earleyBoyerRunIteration()
}

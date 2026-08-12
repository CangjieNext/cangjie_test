/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


// Int64eresting invariant, which we take advantage of: branching instructions
// always begin with "b", and no non-branching instructions begin with "b".
// Terminal instructions are "jmp" and "ret".

import std.convert.*
import std.collection.*
import std.time.*
import std.math.*
import std.regex.*
import std.core.*

let macroInstructions =
[
    "emit",
    "addi",
    "andi",
    "lshifti",
    "lshiftp",
    "lshiftq",
    "muli",
    "negi",
    "negp",
    "negq",
    "noti",
    "ori",
    "rshifti",
    "urshifti",
    "rshiftp",
    "urshiftp",
    "rshiftq",
    "urshiftq",
    "subi",
    "xori",
    "loadi",
    "loadis",
    "loadb",
    "loadbs",
    "loadh",
    "loadhs",
    "storei",
    "storeb",
    "loadd",
    "moved",
    "stored",
    "addd",
    "divd",
    "subd",
    "muld",
    "sqrtd",
    "ci2d",
    "fii2d", // usage: fii2d <gpr with least significant bits>, <gpr with most significant bits>, <fpr>
    "fd2ii", // usage: fd2ii <fpr>, <gpr with least significant bits>, <gpr with most significant bits>
    "fq2d",
    "fd2q",
    "bdeq",
    "bdneq",
    "bdgt",
    "bdgteq",
    "bdlt",
    "bdlteq",
    "bdequn",
    "bdnequn",
    "bdgtun",
    "bdgtequn",
    "bdltun",
    "bdltequn",
    "btd2i",
    "td2i",
    "bcd2i",
    "movdz",
    "pop",
    "push",
    "move",
    "sxi2q",
    "zxi2q",
    "nop",
    "bieq",
    "bineq",
    "bia",
    "biaeq",
    "bib",
    "bibeq",
    "bigt",
    "bigteq",
    "bilt",
    "bilteq",
    "bbeq",
    "bbneq",
    "bba",
    "bbaeq",
    "bbb",
    "bbbeq",
    "bbgt",
    "bbgteq",
    "bblt",
    "bblteq",
    "btis",
    "btiz",
    "btinz",
    "btbs",
    "btbz",
    "btbnz",
    "jmp",
    "baddio",
    "baddis",
    "baddiz",
    "baddinz",
    "bsubio",
    "bsubis",
    "bsubiz",
    "bsubinz",
    "bmulio",
    "bmulis",
    "bmuliz",
    "bmulinz",
    "borio",
    "boris",
    "boriz",
    "borinz",
    "break",
    "call",
    "ret",
    "cbeq",
    "cbneq",
    "cba",
    "cbaeq",
    "cbb",
    "cbbeq",
    "cbgt",
    "cbgteq",
    "cblt",
    "cblteq",
    "cieq",
    "cineq",
    "cia",
    "ciaeq",
    "cib",
    "cibeq",
    "cigt",
    "cigteq",
    "cilt",
    "cilteq",
    "tis",
    "tiz",
    "tinz",
    "tbs",
    "tbz",
    "tbnz",
    "tps",
    "tpz",
    "tpnz",
    "peek",
    "poke",
    "bpeq",
    "bpneq",
    "bpa",
    "bpaeq",
    "bpb",
    "bpbeq",
    "bpgt",
    "bpgteq",
    "bplt",
    "bplteq",
    "addp",
    "mulp",
    "andp",
    "orp",
    "subp",
    "xorp",
    "loadp",
    "cpeq",
    "cpneq",
    "cpa",
    "cpaeq",
    "cpb",
    "cpbeq",
    "cpgt",
    "cpgteq",
    "cplt",
    "cplteq",
    "storep",
    "btps",
    "btpz",
    "btpnz",
    "baddpo",
    "baddps",
    "baddpz",
    "baddpnz",
    "tqs",
    "tqz",
    "tqnz",
    "bqeq",
    "bqneq",
    "bqa",
    "bqaeq",
    "bqb",
    "bqbeq",
    "bqgt",
    "bqgteq",
    "bqlt",
    "bqlteq",
    "addq",
    "mulq",
    "andq",
    "orq",
    "subq",
    "xorq",
    "loadq",
    "cqeq",
    "cqneq",
    "cqa",
    "cqaeq",
    "cqb",
    "cqbeq",
    "cqgt",
    "cqgteq",
    "cqlt",
    "cqlteq",
    "storeq",
    "btqs",
    "btqz",
    "btqnz",
    "baddqo",
    "baddqs",
    "baddqz",
    "baddqnz",
    "bo",
    "bs",
    "bz",
    "bnz",
    "leai",
    "leap",
    "memfence"
]

let x86Instructions =
[
    "cdqi",
    "idivi"
]

let armInstructions =
[
    "clrbp",
    "mvlbl"
]

let arm64Instructions =
[
    "pcrtoaddr",   // Address from PC relative offset - adr instruction
    "nopFixCortexA53Err835769" // nop on Cortex-A53 (nothing otherwise)
]

let riscInstructions =
[
    "smulli",  // Multiply two 32-bit words and produce a 64-bit word
    "addis",   // Add integers and set a flag.
    "subis",   // Same, but for subtraction.
    "oris",    // Same, but for bitwise or.
    "addps"    // addis but for pointers.
]

let mipsInstructions =
[
    "la",
    "movz",
    "movn",
    "setcallreg",
    "slt",
    "sltu",
    "pichdr"
]

let cxxInstructions =
[
    "cloopCrash",              // no operands
    "cloopCallJSFunction",     // operands: callee
    "cloopCallNative",         // operands: callee
    "cloopCallSlowPath",       // operands: callTarget, currentFrame, currentPC
    "cloopCallSlowPathVoid",   // operands: callTarget, currentFrame, currentPC

    /* For debugging only:
     * Takes no operands but simply emits whatever follows in // comments as
     * a line of C++ code in the generated LLIntAssembly.h file. This can be
     * used to insert instrumentation into the interpreter loop to inspect
     * variables of interest. Do not leave these instructions in production
     * code.
     */
    "cloopDo"             // no operands
]

let instructions = appall1([macroInstructions , x86Instructions , armInstructions , arm64Instructions , riscInstructions , mipsInstructions , cxxInstructions])

public func appall1(all: Array<Array<String>>):Array<String>{
    var arr: ArrayList<String> = ArrayList<String>()
    for (x in all){
        for (y in x){
            arr.add(y)
        }
    }
    return arr.toArray()
}

let instructionSet = instructions

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// (LLVM) DEPENDENCE: %n.c
// (LLVM) EXEC: %clang %clang_opt %n.c -o %cffi_output
// (LLVM) EXEC: %compiler %cmp_opt %ffic_opt %optimization_level_2 %overflow_wrapping --no-sub-pkg -o %output
// (LLVM) RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %run %run_opt %output %run_utest_opt %run_args


import std.time.*
import std.convert.*

var reps = 100000

foreign func testfunc(): Data1024

@C
struct Data1024 {
    var a0: Int8
    var a1: Int8
    var a2: Int16
    var a3: Int16
    var a4: Int32
    var a5: Int32
    var a6: Int64
    var a7: Int64
    var a8: Int8
    var a9: Int8
    var a10: Int16
    var a11: Int16
    var a12: Int32
    var a13: Int32
    var a14: Int64
    var a15: Int64
    var a16: Int64
    var a17: Int64
    var a18: Int64
    var a19: Int64
    var a20: Int64
    var a21: Int64
    var a22: Int64
    var a23: Int64
    var a24: Int64
    var a25: Int64
    var a26: Int64
    var a27: Int64
    var a28: Int64
    var a29: Int64
    var a30: Int64
    var a31: Int64
    var a32: Int64
    var a33: Int64
    var a34: Int64
    var a35: Int64
    var a36: Int64
    var a37: Int64
    var a38: Int64
    var a39: Int64
    var a40: Int64
    var a41: Int64
    var a42: Int64
    var a43: Int64
    var a44: Int64
    var a45: Int64
    var a46: Int64
    var a47: Int64
    var a48: Int64
    var a49: Int64
    var a50: Int64
    var a51: Int64
    var a52: Int64
    var a53: Int64
    var a54: Int64
    var a55: Int64
    var a56: Int64
    var a57: Int64
    var a58: Int64
    var a59: Int64
    var a60: Int64
    var a61: Int64
    var a62: Int64
    var a63: Int64
    var a64: Int64
    var a65: Int64
    var a66: Int64
    var a67: Int64
    var a68: Int64
    var a69: Int64
    var a70: Int64
    var a71: Int64
    var a72: Int64
    var a73: Int64
    var a74: Int64
    var a75: Int64
    var a76: Int64
    var a77: Int64
    var a78: Int64
    var a79: Int64
    var a80: Int64
    var a81: Int64
    var a82: Int64
    var a83: Int64
    var a84: Int64
    var a85: Int64
    var a86: Int64
    var a87: Int64
    var a88: Int64
    var a89: Int64
    var a90: Int64
    var a91: Int64
    var a92: Int64
    var a93: Int64
    var a94: Int64
    var a95: Int64
    var a96: Int64
    var a97: Int64
    var a98: Int64
    var a99: Int64
    var a100: Int64
    var a101: Int64
    var a102: Int64
    var a103: Int64
    var a104: Int64
    var a105: Int64
    var a106: Int64
    var a107: Int64
    var a108: Int64
    var a109: Int64
    var a110: Int64
    var a111: Int64
    var a112: Int64
    var a113: Int64
    var a114: Int64
    var a115: Int64
    var a116: Int64
    var a117: Int64
    var a118: Int64
    var a119: Int64
    var a120: Int64
    var a121: Int64
    var a122: Int64
    var a123: Int64
    var a124: Int64
    var a125: Int64
    var a126: Int64
    var a127: Int64
    var a128: Int64
    var a129: Int64
    var a130: Int64
    var a131: Int64
    var a132: Int64
    var a133: Int64
    var a134: Int64
    var a135: Int64
    public init(a0!: Int8, a1!: Int8, a2!: Int16, a3!: Int16, a4!: Int32, a5!: Int32, a6!: Int64, a7!: Int64, 
        a8!: Int8, a9!: Int8, a10!: Int16, a11!: Int16, a12!: Int32, a13!: Int32, a14!: Int64, a15!: Int64, 
        a16!: Int64, a17!: Int64, a18!: Int64, a19!: Int64, a20!: Int64, a21!: Int64, a22!: Int64, a23!: Int64, 
        a24!: Int64, a25!: Int64, a26!: Int64, a27!: Int64, a28!: Int64, a29!: Int64, a30!: Int64, a31!: Int64, 
        a32!: Int64, a33!: Int64, a34!: Int64, a35!: Int64, a36!: Int64, a37!: Int64, a38!: Int64, a39!: Int64, 
        a40!: Int64, a41!: Int64, a42!: Int64, a43!: Int64, a44!: Int64, a45!: Int64, a46!: Int64, a47!: Int64, 
        a48!: Int64, a49!: Int64, a50!: Int64, a51!: Int64, a52!: Int64, a53!: Int64, a54!: Int64, a55!: Int64, 
        a56!: Int64, a57!: Int64, a58!: Int64, a59!: Int64, a60!: Int64, a61!: Int64, a62!: Int64, a63!: Int64, 
        a64!: Int64, a65!: Int64, a66!: Int64, a67!: Int64, a68!: Int64, a69!: Int64, a70!: Int64, a71!: Int64, 
        a72!: Int64, a73!: Int64, a74!: Int64, a75!: Int64, a76!: Int64, a77!: Int64, a78!: Int64, a79!: Int64, 
        a80!: Int64, a81!: Int64, a82!: Int64, a83!: Int64, a84!: Int64, a85!: Int64, a86!: Int64, a87!: Int64, 
        a88!: Int64, a89!: Int64, a90!: Int64, a91!: Int64, a92!: Int64, a93!: Int64, a94!: Int64, a95!: Int64, 
        a96!: Int64, a97!: Int64, a98!: Int64, a99!: Int64, a100!: Int64, a101!: Int64, a102!: Int64, a103!: Int64, 
        a104!: Int64, a105!: Int64, a106!: Int64, a107!: Int64, a108!: Int64, a109!: Int64, a110!: Int64, 
        a111!: Int64, a112!: Int64, a113!: Int64, a114!: Int64, a115!: Int64, a116!: Int64, a117!: Int64, 
        a118!: Int64, a119!: Int64, a120!: Int64, a121!: Int64, a122!: Int64, a123!: Int64, a124!: Int64, 
        a125!: Int64, a126!: Int64, a127!: Int64, a128!: Int64, a129!: Int64, a130!: Int64, a131!: Int64, 
        a132!: Int64, a133!: Int64, a134!: Int64, a135!: Int64) {
        this.a0 = a0
        this.a1 = a1
        this.a2 = a2
        this.a3 = a3
        this.a4 = a4
        this.a5 = a5
        this.a6 = a6
        this.a7 = a7
        this.a8 = a8
        this.a9 = a9
        this.a10 = a10
        this.a11 = a11
        this.a12 = a12
        this.a13 = a13
        this.a14 = a14
        this.a15 = a15
        this.a16 = a16
        this.a17 = a17
        this.a18 = a18
        this.a19 = a19
        this.a20 = a20
        this.a21 = a21
        this.a22 = a22
        this.a23 = a23
        this.a24 = a24
        this.a25 = a25
        this.a26 = a26
        this.a27 = a27
        this.a28 = a28
        this.a29 = a29
        this.a30 = a30
        this.a31 = a31
        this.a32 = a32
        this.a33 = a33
        this.a34 = a34
        this.a35 = a35
        this.a36 = a36
        this.a37 = a37
        this.a38 = a38
        this.a39 = a39
        this.a40 = a40
        this.a41 = a41
        this.a42 = a42
        this.a43 = a43
        this.a44 = a44
        this.a45 = a45
        this.a46 = a46
        this.a47 = a47
        this.a48 = a48
        this.a49 = a49
        this.a50 = a50
        this.a51 = a51
        this.a52 = a52
        this.a53 = a53
        this.a54 = a54
        this.a55 = a55
        this.a56 = a56
        this.a57 = a57
        this.a58 = a58
        this.a59 = a59
        this.a60 = a60
        this.a61 = a61
        this.a62 = a62
        this.a63 = a63
        this.a64 = a64
        this.a65 = a65
        this.a66 = a66
        this.a67 = a67
        this.a68 = a68
        this.a69 = a69
        this.a70 = a70
        this.a71 = a71
        this.a72 = a72
        this.a73 = a73
        this.a74 = a74
        this.a75 = a75
        this.a76 = a76
        this.a77 = a77
        this.a78 = a78
        this.a79 = a79
        this.a80 = a80
        this.a81 = a81
        this.a82 = a82
        this.a83 = a83
        this.a84 = a84
        this.a85 = a85
        this.a86 = a86
        this.a87 = a87
        this.a88 = a88
        this.a89 = a89
        this.a90 = a90
        this.a91 = a91
        this.a92 = a92
        this.a93 = a93
        this.a94 = a94
        this.a95 = a95
        this.a96 = a96
        this.a97 = a97
        this.a98 = a98
        this.a99 = a99
        this.a100 = a100
        this.a101 = a101
        this.a102 = a102
        this.a103 = a103
        this.a104 = a104
        this.a105 = a105
        this.a106 = a106
        this.a107 = a107
        this.a108 = a108
        this.a109 = a109
        this.a110 = a110
        this.a111 = a111
        this.a112 = a112
        this.a113 = a113
        this.a114 = a114
        this.a115 = a115
        this.a116 = a116
        this.a117 = a117
        this.a118 = a118
        this.a119 = a119
        this.a120 = a120
        this.a121 = a121
        this.a122 = a122
        this.a123 = a123
        this.a124 = a124
        this.a125 = a125
        this.a126 = a126
        this.a127 = a127
        this.a128 = a128
        this.a129 = a129
        this.a130 = a130
        this.a131 = a131
        this.a132 = a132
        this.a133 = a133
        this.a134 = a134
        this.a135 = a135
    }
}

main(): Int64 {
    unsafe {
        var start = DateTime.now()
        for (i in 0..reps) {
            var res: Data1024 = testfunc()
        }
        var end = DateTime.now()
        var perTime: Float64 = Float64((end - start).toNanoseconds()) / Float64(reps)
        println("BenchmarkCffiReturn10: " + perTime.format(".2") + " ns/op")
    }
    return 0
}

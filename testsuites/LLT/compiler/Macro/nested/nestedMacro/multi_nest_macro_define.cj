// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

macro package test

import std.ast.*

var x1 = 1

public macro X1(attr: Tokens, input: Tokens): Tokens {
    if (x1 != 0) {
        x1 = x1 - 1
        return quote(@X1[1](1))
    } else {
        return quote(@X2[1](1))
    }
}

var x2 = 1

public macro X2(attr: Tokens, input: Tokens): Tokens {
    if (x2 != 0) {
        x2 = x2 - 1
        return quote(@X2[1](1))
    } else {
        return quote(@X3[1](1))
    }
}

var x3 = 1

public macro X3(attr: Tokens, input: Tokens): Tokens {
    if (x3 != 0) {
        x3 = x3 - 1
        return quote(@X3[1](1))
    } else {
        return quote(@X4[1](1))
    }
}

var x4 = 1

public macro X4(attr: Tokens, input: Tokens): Tokens {
    if (x4 != 0) {
        x4 = x4 - 1
        return quote(@X4[1](1))
    } else {
        return quote(@X5[1](1))
    }
}

var x5 = 1

public macro X5(attr: Tokens, input: Tokens): Tokens {
    if (x5 != 0) {
        x5 = x5 - 1
        return quote(@X5[1](1))
    } else {
        return quote(@X6[1](1))
    }
}

var x6 = 1

public macro X6(attr: Tokens, input: Tokens): Tokens {
    if (x6 != 0) {
        x6 = x6 - 1
        return quote(@X6[1](1))
    } else {
        return quote(@X7[1](1))
    }
}

var x7 = 1

public macro X7(attr: Tokens, input: Tokens): Tokens {
    if (x7 != 0) {
        x7 = x7 - 1
        return quote(@X7[1](1))
    } else {
        return quote(@X8[1](1))
    }
}

var x8 = 1

public macro X8(attr: Tokens, input: Tokens): Tokens {
    if (x8 != 0) {
        x8 = x8 - 1
        return quote(@X8[1](1))
    } else {
        return quote(@X9[1](1))
    }
}

var x9 = 1

public macro X9(attr: Tokens, input: Tokens): Tokens {
    if (x9 != 0) {
        x9 = x9 - 1
        return quote(@X9[1](1))
    } else {
        return quote(@X10[1](1))
    }
}

var x10 = 1

public macro X10(attr: Tokens, input: Tokens): Tokens {
    if (x10 != 0) {
        x10 = x10 - 1
        return quote(@X10[1](1))
    } else {
        return quote(@X11[1](1))
    }
}

var x11 = 1

public macro X11(attr: Tokens, input: Tokens): Tokens {
    if (x11 != 0) {
        x11 = x11 - 1
        return quote(@X11[1](1))
    } else {
        return quote(@X12[1](1))
    }
}

var x12 = 1

public macro X12(attr: Tokens, input: Tokens): Tokens {
    if (x12 != 0) {
        x12 = x12 - 1
        return quote(@X12[1](1))
    } else {
        return quote(@X13[1](1))
    }
}

var x13 = 1

public macro X13(attr: Tokens, input: Tokens): Tokens {
    if (x13 != 0) {
        x13 = x13 - 1
        return quote(@X13[1](1))
    } else {
        return quote(@X14[1](1))
    }
}

var x14 = 1

public macro X14(attr: Tokens, input: Tokens): Tokens {
    if (x14 != 0) {
        x14 = x14 - 1
        return quote(@X14[1](1))
    } else {
        return quote(@X15[1](1))
    }
}

var x15 = 1

public macro X15(attr: Tokens, input: Tokens): Tokens {
    if (x15 != 0) {
        x15 = x15 - 1
        return quote(@X15[1](1))
    } else {
        return quote(@X16[1](1))
    }
}

var x16 = 1

public macro X16(attr: Tokens, input: Tokens): Tokens {
    if (x16 != 0) {
        x16 = x16 - 1
        return quote(@X16[1](1))
    } else {
        return quote(@X17[1](1))
    }
}

var x17 = 1

public macro X17(attr: Tokens, input: Tokens): Tokens {
    if (x17 != 0) {
        x17 = x17 - 1
        return quote(@X17[1](1))
    } else {
        return quote(@X18[1](1))
    }
}

var x18 = 1

public macro X18(attr: Tokens, input: Tokens): Tokens {
    if (x18 != 0) {
        x18 = x18 - 1
        return quote(@X18[1](1))
    } else {
        return quote(@X19[1](1))
    }
}

var x19 = 1

public macro X19(attr: Tokens, input: Tokens): Tokens {
    if (x19 != 0) {
        x19 = x19 - 1
        return quote(@X19[1](1))
    } else {
        return quote(@X20[1](1))
    }
}

var x20 = 1

public macro X20(attr: Tokens, input: Tokens): Tokens {
    if (x20 != 0) {
        x20 = x20 - 1
        return quote(@X20[1](1))
    } else {
        return quote(@X21[1](1))
    }
}

var x21 = 1

public macro X21(attr: Tokens, input: Tokens): Tokens {
    if (x21 != 0) {
        x21 = x21 - 1
        return quote(@X21[1](1))
    } else {
        return quote(@X22[1](1))
    }
}

var x22 = 1

public macro X22(attr: Tokens, input: Tokens): Tokens {
    if (x22 != 0) {
        x22 = x22 - 1
        return quote(@X22[1](1))
    } else {
        return quote(@X23[1](1))
    }
}

var x23 = 1

public macro X23(attr: Tokens, input: Tokens): Tokens {
    if (x23 != 0) {
        x23 = x23 - 1
        return quote(@X23[1](1))
    } else {
        return quote(@X24[1](1))
    }
}

var x24 = 1

public macro X24(attr: Tokens, input: Tokens): Tokens {
    if (x24 != 0) {
        x24 = x24 - 1
        return quote(@X24[1](1))
    } else {
        return quote(@X25[1](1))
    }
}

var x25 = 1

public macro X25(attr: Tokens, input: Tokens): Tokens {
    if (x25 != 0) {
        x25 = x25 - 1
        return quote(@X25[1](1))
    } else {
        return quote(@X26[1](1))
    }
}

var x26 = 1

public macro X26(attr: Tokens, input: Tokens): Tokens {
    if (x26 != 0) {
        x26 = x26 - 1
        return quote(@X26[1](1))
    } else {
        return quote(@X27[1](1))
    }
}

var x27 = 1

public macro X27(attr: Tokens, input: Tokens): Tokens {
    if (x27 != 0) {
        x27 = x27 - 1
        return quote(@X27[1](1))
    } else {
        return quote(@X28[1](1))
    }
}

var x28 = 1

public macro X28(attr: Tokens, input: Tokens): Tokens {
    if (x28 != 0) {
        x28 = x28 - 1
        return quote(@X28[1](1))
    } else {
        return quote(@X29[1](1))
    }
}

var x29 = 1

public macro X29(attr: Tokens, input: Tokens): Tokens {
    if (x29 != 0) {
        x29 = x29 - 1
        return quote(@X29[1](1))
    } else {
        return quote(@X30[1](1))
    }
}

var x30 = 1

public macro X30(attr: Tokens, input: Tokens): Tokens {
    if (x30 != 0) {
        x30 = x30 - 1
        return quote(@X30[1](1))
    } else {
        return quote(@X31[1](1))
    }
}

var x31 = 1

public macro X31(attr: Tokens, input: Tokens): Tokens {
    if (x31 != 0) {
        x31 = x31 - 1
        return quote(@X31[1](1))
    } else {
        return quote(@X32[1](1))
    }
}

var x32 = 1

public macro X32(attr: Tokens, input: Tokens): Tokens {
    if (x32 != 0) {
        x32 = x32 - 1
        return quote(@X32[1](1))
    } else {
        return quote(@X33[1](1))
    }
}

var x33 = 1

public macro X33(attr: Tokens, input: Tokens): Tokens {
    if (x33 != 0) {
        x33 = x33 - 1
        return quote(@X33[1](1))
    } else {
        return quote(@X34[1](1))
    }
}

var x34 = 1

public macro X34(attr: Tokens, input: Tokens): Tokens {
    if (x34 != 0) {
        x34 = x34 - 1
        return quote(@X34[1](1))
    } else {
        return quote(@X35[1](1))
    }
}

var x35 = 1

public macro X35(attr: Tokens, input: Tokens): Tokens {
    if (x35 != 0) {
        x35 = x35 - 1
        return quote(@X35[1](1))
    } else {
        return quote(@X36[1](1))
    }
}

var x36 = 1

public macro X36(attr: Tokens, input: Tokens): Tokens {
    if (x36 != 0) {
        x36 = x36 - 1
        return quote(@X36[1](1))
    } else {
        return quote(@X37[1](1))
    }
}

var x37 = 1

public macro X37(attr: Tokens, input: Tokens): Tokens {
    if (x37 != 0) {
        x37 = x37 - 1
        return quote(@X37[1](1))
    } else {
        return quote(@X38[1](1))
    }
}

var x38 = 1

public macro X38(attr: Tokens, input: Tokens): Tokens {
    if (x38 != 0) {
        x38 = x38 - 1
        return quote(@X38[1](1))
    } else {
        return quote(@X39[1](1))
    }
}

var x39 = 1

public macro X39(attr: Tokens, input: Tokens): Tokens {
    if (x39 != 0) {
        x39 = x39 - 1
        return quote(@X39[1](1))
    } else {
        return quote(@X40[1](1))
    }
}

var x40 = 1

public macro X40(attr: Tokens, input: Tokens): Tokens {
    if (x40 != 0) {
        x40 = x40 - 1
        return quote(@X40[1](1))
    } else {
        return quote(@X41[1](1))
    }
}

var x41 = 1

public macro X41(attr: Tokens, input: Tokens): Tokens {
    if (x41 != 0) {
        x41 = x41 - 1
        return quote(@X41[1](1))
    } else {
        return quote(@X42[1](1))
    }
}

var x42 = 1

public macro X42(attr: Tokens, input: Tokens): Tokens {
    if (x42 != 0) {
        x42 = x42 - 1
        return quote(@X42[1](1))
    } else {
        return quote(@X43[1](1))
    }
}

var x43 = 1

public macro X43(attr: Tokens, input: Tokens): Tokens {
    if (x43 != 0) {
        x43 = x43 - 1
        return quote(@X43[1](1))
    } else {
        return quote(@X44[1](1))
    }
}

var x44 = 1

public macro X44(attr: Tokens, input: Tokens): Tokens {
    if (x44 != 0) {
        x44 = x44 - 1
        return quote(@X44[1](1))
    } else {
        return quote(@X45[1](1))
    }
}

var x45 = 1

public macro X45(attr: Tokens, input: Tokens): Tokens {
    if (x45 != 0) {
        x45 = x45 - 1
        return quote(@X45[1](1))
    } else {
        return quote(@X46[1](1))
    }
}

var x46 = 1

public macro X46(attr: Tokens, input: Tokens): Tokens {
    if (x46 != 0) {
        x46 = x46 - 1
        return quote(@X46[1](1))
    } else {
        return quote(@X47[1](1))
    }
}

var x47 = 1

public macro X47(attr: Tokens, input: Tokens): Tokens {
    if (x47 != 0) {
        x47 = x47 - 1
        return quote(@X47[1](1))
    } else {
        return quote(@X48[1](1))
    }
}

var x48 = 1

public macro X48(attr: Tokens, input: Tokens): Tokens {
    if (x48 != 0) {
        x48 = x48 - 1
        return quote(@X48[1](1))
    } else {
        return quote(@X49[1](1))
    }
}

var x49 = 1

public macro X49(attr: Tokens, input: Tokens): Tokens {
    if (x49 != 0) {
        x49 = x49 - 1
        return quote(@X49[1](1))
    } else {
        return quote(@X50[1](1))
    }
}

var x50 = 1

public macro X50(attr: Tokens, input: Tokens): Tokens {
    if (x50 != 0) {
        x50 = x50 - 1
        return quote(@X50[1](1))
    } else {
        return quote(@X51[1](1))
    }
}

var x51 = 1

public macro X51(attr: Tokens, input: Tokens): Tokens {
    if (x51 != 0) {
        x51 = x51 - 1
        return quote(@X51[1](1))
    } else {
        return quote(@X52[1](1))
    }
}

var x52 = 1

public macro X52(attr: Tokens, input: Tokens): Tokens {
    if (x52 != 0) {
        x52 = x52 - 1
        return quote(@X52[1](1))
    } else {
        return quote(@X53[1](1))
    }
}

var x53 = 1

public macro X53(attr: Tokens, input: Tokens): Tokens {
    if (x53 != 0) {
        x53 = x53 - 1
        return quote(@X53[1](1))
    } else {
        return quote(@X54[1](1))
    }
}

var x54 = 1

public macro X54(attr: Tokens, input: Tokens): Tokens {
    if (x54 != 0) {
        x54 = x54 - 1
        return quote(@X54[1](1))
    } else {
        return quote(@X55[1](1))
    }
}

var x55 = 1

public macro X55(attr: Tokens, input: Tokens): Tokens {
    if (x55 != 0) {
        x55 = x55 - 1
        return quote(@X55[1](1))
    } else {
        return quote(@X56[1](1))
    }
}

var x56 = 1

public macro X56(attr: Tokens, input: Tokens): Tokens {
    if (x56 != 0) {
        x56 = x56 - 1
        return quote(@X56[1](1))
    } else {
        return quote(@X57[1](1))
    }
}

var x57 = 1

public macro X57(attr: Tokens, input: Tokens): Tokens {
    if (x57 != 0) {
        x57 = x57 - 1
        return quote(@X57[1](1))
    } else {
        return quote(@X58[1](1))
    }
}

var x58 = 1

public macro X58(attr: Tokens, input: Tokens): Tokens {
    if (x58 != 0) {
        x58 = x58 - 1
        return quote(@X58[1](1))
    } else {
        return quote(@X59[1](1))
    }
}

var x59 = 1

public macro X59(attr: Tokens, input: Tokens): Tokens {
    if (x59 != 0) {
        x59 = x59 - 1
        return quote(@X59[1](1))
    } else {
        return quote(@X60[1](1))
    }
}

var x60 = 1

public macro X60(attr: Tokens, input: Tokens): Tokens {
    if (x60 != 0) {
        x60 = x60 - 1
        return quote(@X60[1](1))
    } else {
        return quote(@X61[1](1))
    }
}

var x61 = 1

public macro X61(attr: Tokens, input: Tokens): Tokens {
    if (x61 != 0) {
        x61 = x61 - 1
        return quote(@X61[1](1))
    } else {
        return quote(@X62[1](1))
    }
}

var x62 = 1

public macro X62(attr: Tokens, input: Tokens): Tokens {
    if (x62 != 0) {
        x62 = x62 - 1
        return quote(@X62[1](1))
    } else {
        return quote(@X63[1](1))
    }
}

var x63 = 1

public macro X63(attr: Tokens, input: Tokens): Tokens {
    if (x63 != 0) {
        x63 = x63 - 1
        return quote(@X63[1](1))
    } else {
        return quote(@X64[1](1))
    }
}

var x64 = 1

public macro X64(attr: Tokens, input: Tokens): Tokens {
    if (x64 != 0) {
        x64 = x64 - 1
        return quote(@X64[1](1))
    } else {
        return quote(@X65[1](1))
    }
}

var x65 = 1

public macro X65(attr: Tokens, input: Tokens): Tokens {
    if (x65 != 0) {
        x65 = x65 - 1
        return quote(@X65[1](1))
    } else {
        return quote(@X66[1](1))
    }
}

var x66 = 1

public macro X66(attr: Tokens, input: Tokens): Tokens {
    if (x66 != 0) {
        x66 = x66 - 1
        return quote(@X66[1](1))
    } else {
        return quote(@X67[1](1))
    }
}

var x67 = 1

public macro X67(attr: Tokens, input: Tokens): Tokens {
    if (x67 != 0) {
        x67 = x67 - 1
        return quote(@X67[1](1))
    } else {
        return quote(@X68[1](1))
    }
}

var x68 = 1

public macro X68(attr: Tokens, input: Tokens): Tokens {
    if (x68 != 0) {
        x68 = x68 - 1
        return quote(@X68[1](1))
    } else {
        return quote(@X69[1](1))
    }
}

var x69 = 1

public macro X69(attr: Tokens, input: Tokens): Tokens {
    if (x69 != 0) {
        x69 = x69 - 1
        return quote(@X69[1](1))
    } else {
        return quote(@X70[1](1))
    }
}

var x70 = 1

public macro X70(attr: Tokens, input: Tokens): Tokens {
    if (x70 != 0) {
        x70 = x70 - 1
        return quote(@X70[1](1))
    } else {
        return quote(@X71[1](1))
    }
}

var x71 = 1

public macro X71(attr: Tokens, input: Tokens): Tokens {
    if (x71 != 0) {
        x71 = x71 - 1
        return quote(@X71[1](1))
    } else {
        return quote(@X72[1](1))
    }
}

var x72 = 1

public macro X72(attr: Tokens, input: Tokens): Tokens {
    if (x72 != 0) {
        x72 = x72 - 1
        return quote(@X72[1](1))
    } else {
        return quote(@X73[1](1))
    }
}

var x73 = 1

public macro X73(attr: Tokens, input: Tokens): Tokens {
    if (x73 != 0) {
        x73 = x73 - 1
        return quote(@X73[1](1))
    } else {
        return quote(@X74[1](1))
    }
}

var x74 = 1

public macro X74(attr: Tokens, input: Tokens): Tokens {
    if (x74 != 0) {
        x74 = x74 - 1
        return quote(@X74[1](1))
    } else {
        return quote(@X75[1](1))
    }
}

var x75 = 1

public macro X75(attr: Tokens, input: Tokens): Tokens {
    if (x75 != 0) {
        x75 = x75 - 1
        return quote(@X75[1](1))
    } else {
        return quote(@X76[1](1))
    }
}

var x76 = 1

public macro X76(attr: Tokens, input: Tokens): Tokens {
    if (x76 != 0) {
        x76 = x76 - 1
        return quote(@X76[1](1))
    } else {
        return quote(@X77[1](1))
    }
}

var x77 = 1

public macro X77(attr: Tokens, input: Tokens): Tokens {
    if (x77 != 0) {
        x77 = x77 - 1
        return quote(@X77[1](1))
    } else {
        return quote(@X78[1](1))
    }
}

var x78 = 1

public macro X78(attr: Tokens, input: Tokens): Tokens {
    if (x78 != 0) {
        x78 = x78 - 1
        return quote(@X78[1](1))
    } else {
        return quote(@X79[1](1))
    }
}

var x79 = 1

public macro X79(attr: Tokens, input: Tokens): Tokens {
    if (x79 != 0) {
        x79 = x79 - 1
        return quote(@X79[1](1))
    } else {
        return quote(@X80[1](1))
    }
}

var x80 = 1

public macro X80(attr: Tokens, input: Tokens): Tokens {
    if (x80 != 0) {
        x80 = x80 - 1
        return quote(@X80[1](1))
    } else {
        return quote(@X81[1](1))
    }
}

var x81 = 1

public macro X81(attr: Tokens, input: Tokens): Tokens {
    if (x81 != 0) {
        x81 = x81 - 1
        return quote(@X81[1](1))
    } else {
        return quote(@X82[1](1))
    }
}

var x82 = 1

public macro X82(attr: Tokens, input: Tokens): Tokens {
    if (x82 != 0) {
        x82 = x82 - 1
        return quote(@X82[1](1))
    } else {
        return quote(@X83[1](1))
    }
}

var x83 = 1

public macro X83(attr: Tokens, input: Tokens): Tokens {
    if (x83 != 0) {
        x83 = x83 - 1
        return quote(@X83[1](1))
    } else {
        return quote(@X84[1](1))
    }
}

var x84 = 1

public macro X84(attr: Tokens, input: Tokens): Tokens {
    if (x84 != 0) {
        x84 = x84 - 1
        return quote(@X84[1](1))
    } else {
        return quote(@X85[1](1))
    }
}

var x85 = 1

public macro X85(attr: Tokens, input: Tokens): Tokens {
    if (x85 != 0) {
        x85 = x85 - 1
        return quote(@X85[1](1))
    } else {
        return quote(@X86[1](1))
    }
}

var x86 = 1

public macro X86(attr: Tokens, input: Tokens): Tokens {
    if (x86 != 0) {
        x86 = x86 - 1
        return quote(@X86[1](1))
    } else {
        return quote(@X87[1](1))
    }
}

var x87 = 1

public macro X87(attr: Tokens, input: Tokens): Tokens {
    if (x87 != 0) {
        x87 = x87 - 1
        return quote(@X87[1](1))
    } else {
        return quote(@X88[1](1))
    }
}

var x88 = 1

public macro X88(attr: Tokens, input: Tokens): Tokens {
    if (x88 != 0) {
        x88 = x88 - 1
        return quote(@X88[1](1))
    } else {
        return quote(@X89[1](1))
    }
}

var x89 = 1

public macro X89(attr: Tokens, input: Tokens): Tokens {
    if (x89 != 0) {
        x89 = x89 - 1
        return quote(@X89[1](1))
    } else {
        return quote(@X90[1](1))
    }
}

var x90 = 1

public macro X90(attr: Tokens, input: Tokens): Tokens {
    if (x90 != 0) {
        x90 = x90 - 1
        return quote(@X90[1](1))
    } else {
        return quote(@X91[1](1))
    }
}

var x91 = 1

public macro X91(attr: Tokens, input: Tokens): Tokens {
    if (x91 != 0) {
        x91 = x91 - 1
        return quote(@X91[1](1))
    } else {
        return quote(@X92[1](1))
    }
}

var x92 = 1

public macro X92(attr: Tokens, input: Tokens): Tokens {
    if (x92 != 0) {
        x92 = x92 - 1
        return quote(@X92[1](1))
    } else {
        return quote(@X93[1](1))
    }
}

var x93 = 1

public macro X93(attr: Tokens, input: Tokens): Tokens {
    if (x93 != 0) {
        x93 = x93 - 1
        return quote(@X93[1](1))
    } else {
        return quote(@X94[1](1))
    }
}

var x94 = 1

public macro X94(attr: Tokens, input: Tokens): Tokens {
    if (x94 != 0) {
        x94 = x94 - 1
        return quote(@X94[1](1))
    } else {
        return quote(@X95[1](1))
    }
}

var x95 = 1

public macro X95(attr: Tokens, input: Tokens): Tokens {
    if (x95 != 0) {
        x95 = x95 - 1
        return quote(@X95[1](1))
    } else {
        return quote(@X96[1](1))
    }
}

var x96 = 1

public macro X96(attr: Tokens, input: Tokens): Tokens {
    if (x96 != 0) {
        x96 = x96 - 1
        return quote(@X96[1](1))
    } else {
        return quote(@X97[1](1))
    }
}

var x97 = 1

public macro X97(attr: Tokens, input: Tokens): Tokens {
    if (x97 != 0) {
        x97 = x97 - 1
        return quote(@X97[1](1))
    } else {
        return quote(@X98[1](1))
    }
}

var x98 = 1

public macro X98(attr: Tokens, input: Tokens): Tokens {
    if (x98 != 0) {
        x98 = x98 - 1
        return quote(@X98[1](1))
    } else {
        return quote(@X99[1](1))
    }
}

var x99 = 1

public macro X99(attr: Tokens, input: Tokens): Tokens {
    if (x99 != 0) {
        x99 = x99 - 1
        return quote(@X99[1](1))
    } else {
        return quote(@X100[1](1))
    }
}

var x100 = 1

public macro X100(attr: Tokens, input: Tokens): Tokens {
    if (x100 != 0) {
        x100 = x100 - 1
        return quote(@X100[1](1))
    } else {
        return quote(@X101[1](1))
    }
}

var x101 = 1

public macro X101(attr: Tokens, input: Tokens): Tokens {
    if (x101 != 0) {
        x101 = x101 - 1
        return quote(@X101[1](1))
    } else {
        return quote(@X102[1](1))
    }
}

var x102 = 1

public macro X102(attr: Tokens, input: Tokens): Tokens {
    if (x102 != 0) {
        x102 = x102 - 1
        return quote(@X102[1](1))
    } else {
        return quote(@X103[1](1))
    }
}

var x103 = 1

public macro X103(attr: Tokens, input: Tokens): Tokens {
    if (x103 != 0) {
        x103 = x103 - 1
        return quote(@X103[1](1))
    } else {
        return quote(@X104[1](1))
    }
}

var x104 = 1

public macro X104(attr: Tokens, input: Tokens): Tokens {
    if (x104 != 0) {
        x104 = x104 - 1
        return quote(@X104[1](1))
    } else {
        return quote(@X105[1](1))
    }
}

var x105 = 1

public macro X105(attr: Tokens, input: Tokens): Tokens {
    if (x105 != 0) {
        x105 = x105 - 1
        return quote(@X105[1](1))
    } else {
        return quote(@X106[1](1))
    }
}

var x106 = 1

public macro X106(attr: Tokens, input: Tokens): Tokens {
    if (x106 != 0) {
        x106 = x106 - 1
        return quote(@X106[1](1))
    } else {
        return quote(@X107[1](1))
    }
}

var x107 = 1

public macro X107(attr: Tokens, input: Tokens): Tokens {
    if (x107 != 0) {
        x107 = x107 - 1
        return quote(@X107[1](1))
    } else {
        return quote(@X108[1](1))
    }
}

var x108 = 1

public macro X108(attr: Tokens, input: Tokens): Tokens {
    if (x108 != 0) {
        x108 = x108 - 1
        return quote(@X108[1](1))
    } else {
        return quote(@X109[1](1))
    }
}

var x109 = 1

public macro X109(attr: Tokens, input: Tokens): Tokens {
    if (x109 != 0) {
        x109 = x109 - 1
        return quote(@X109[1](1))
    } else {
        return quote(@X110[1](1))
    }
}

var x110 = 1

public macro X110(attr: Tokens, input: Tokens): Tokens {
    if (x110 != 0) {
        x110 = x110 - 1
        return quote(@X110[1](1))
    } else {
        return quote(@X111[1](1))
    }
}

var x111 = 1

public macro X111(attr: Tokens, input: Tokens): Tokens {
    if (x111 != 0) {
        x111 = x111 - 1
        return quote(@X111[1](1))
    } else {
        return quote(@X112[1](1))
    }
}

var x112 = 1

public macro X112(attr: Tokens, input: Tokens): Tokens {
    if (x112 != 0) {
        x112 = x112 - 1
        return quote(@X112[1](1))
    } else {
        return quote(@X113[1](1))
    }
}

var x113 = 1

public macro X113(attr: Tokens, input: Tokens): Tokens {
    if (x113 != 0) {
        x113 = x113 - 1
        return quote(@X113[1](1))
    } else {
        return quote(@X114[1](1))
    }
}

var x114 = 1

public macro X114(attr: Tokens, input: Tokens): Tokens {
    if (x114 != 0) {
        x114 = x114 - 1
        return quote(@X114[1](1))
    } else {
        return quote(@X115[1](1))
    }
}

var x115 = 1

public macro X115(attr: Tokens, input: Tokens): Tokens {
    if (x115 != 0) {
        x115 = x115 - 1
        return quote(@X115[1](1))
    } else {
        return quote(@X116[1](1))
    }
}

var x116 = 1

public macro X116(attr: Tokens, input: Tokens): Tokens {
    if (x116 != 0) {
        x116 = x116 - 1
        return quote(@X116[1](1))
    } else {
        return quote(@X117[1](1))
    }
}

var x117 = 1

public macro X117(attr: Tokens, input: Tokens): Tokens {
    if (x117 != 0) {
        x117 = x117 - 1
        return quote(@X117[1](1))
    } else {
        return quote(@X118[1](1))
    }
}

var x118 = 1

public macro X118(attr: Tokens, input: Tokens): Tokens {
    if (x118 != 0) {
        x118 = x118 - 1
        return quote(@X118[1](1))
    } else {
        return quote(@X119[1](1))
    }
}

var x119 = 1

public macro X119(attr: Tokens, input: Tokens): Tokens {
    if (x119 != 0) {
        x119 = x119 - 1
        return quote(@X119[1](1))
    } else {
        return quote(@X120[1](1))
    }
}

var x120 = 1

public macro X120(attr: Tokens, input: Tokens): Tokens {
    if (x120 != 0) {
        x120 = x120 - 1
        return quote(@X120[1](1))
    } else {
        return quote(@X121[1](1))
    }
}

var x121 = 1

public macro X121(attr: Tokens, input: Tokens): Tokens {
    if (x121 != 0) {
        x121 = x121 - 1
        return quote(@X121[1](1))
    } else {
        return quote(@X122[1](1))
    }
}

var x122 = 1

public macro X122(attr: Tokens, input: Tokens): Tokens {
    if (x122 != 0) {
        x122 = x122 - 1
        return quote(@X122[1](1))
    } else {
        return quote(@X123[1](1))
    }
}

var x123 = 1

public macro X123(attr: Tokens, input: Tokens): Tokens {
    if (x123 != 0) {
        x123 = x123 - 1
        return quote(@X123[1](1))
    } else {
        return quote(@X124[1](1))
    }
}

var x124 = 1

public macro X124(attr: Tokens, input: Tokens): Tokens {
    if (x124 != 0) {
        x124 = x124 - 1
        return quote(@X124[1](1))
    } else {
        return quote(@X125[1](1))
    }
}

var x125 = 1

public macro X125(attr: Tokens, input: Tokens): Tokens {
    if (x125 != 0) {
        x125 = x125 - 1
        return quote(@X125[1](1))
    } else {
        return quote(@X126[1](1))
    }
}

var x126 = 1

public macro X126(attr: Tokens, input: Tokens): Tokens {
    if (x126 != 0) {
        x126 = x126 - 1
        return quote(@X126[1](1))
    } else {
        return quote(@X127[1](1))
    }
}

var x127 = 1

public macro X127(attr: Tokens, input: Tokens): Tokens {
    if (x127 != 0) {
        x127 = x127 - 1
        return quote(@X127[1](1))
    } else {
        return quote(@X128[1](1))
    }
}

var x128 = 1

public macro X128(attr: Tokens, input: Tokens): Tokens {
    if (x128 != 0) {
        x128 = x128 - 1
        return quote(@X128[1](1))
    } else {
        return quote(1)
    }
}

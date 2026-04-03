/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args


func test(a1: Int64, a2: Int64, a3: Int64, a4: Int64, a5: Int64, a6: Int64, a7: Int64, a8: Int64, a9: Int64, a10: Int64,
    a11: Int64, a12: Int64, a13: Int64, a14: Int64, a15: Int64, a16: Int64, a17: Int64, a18: Int64, a19: Int64,
    a20: Int64, a21: Int64, a22: Int64, a23: Int64, a24: Int64, a25: Int64, a26: Int64, a27: Int64, a28: Int64,
    a29: Int64, a30: Int64, a31: Int64, a32: Int64, a33: Int64, a34: Int64, a35: Int64, a36: Int64, a37: Int64,
    a38: Int64, a39: Int64, a40: Int64, a41: Int64, a42: Int64, a43: Int64, a44: Int64, a45: Int64, a46: Int64,
    a47: Int64, a48: Int64, a49: Int64, a50: Int64, a51: Int64, a52: Int64, a53: Int64, a54: Int64, a55: Int64,
    a56: Int64, a57: Int64, a58: Int64, a59: Int64, a60: Int64, a61: Int64, a62: Int64, a63: Int64, a64: Int64,
    a65: Int64, a66: Int64, a67: Int64, a68: Int64, a69: Int64, a70: Int64, a71: Int64, a72: Int64, a73: Int64,
    a74: Int64, a75: Int64, a76: Int64, a77: Int64, a78: Int64, a79: Int64, a80: Int64, a81: Int64, a82: Int64,
    a83: Int64, a84: Int64, a85: Int64, a86: Int64, a87: Int64, a88: Int64, a89: Int64, a90: Int64, a91: Int64,
    a92: Int64, a93: Int64, a94: Int64, a95: Int64, a96: Int64, a97: Int64, a98: Int64, a99: Int64, a100: Int64,
    a101: Int64, a102: Int64, a103: Int64, a104: Int64, a105: Int64, a106: Int64, a107: Int64, a108: Int64, a109: Int64,
    a110: Int64, a111: Int64, a112: Int64, a113: Int64, a114: Int64, a115: Int64, a116: Int64, a117: Int64, a118: Int64,
    a119: Int64, a120: Int64, a121: Int64, a122: Int64, a123: Int64, a124: Int64, a125: Int64, a126: Int64, a127: Int64,
    a128: Int64, a129: Int64, a130: Int64, a131: Int64, a132: Int64, a133: Int64, a134: Int64, a135: Int64, a136: Int64,
    a137: Int64, a138: Int64, a139: Int64, a140: Int64, a141: Int64, a142: Int64, a143: Int64, a144: Int64, a145: Int64,
    a146: Int64, a147: Int64, a148: Int64, a149: Int64, a150: Int64, a151: Int64, a152: Int64, a153: Int64, a154: Int64,
    a155: Int64, a156: Int64, a157: Int64, a158: Int64, a159: Int64, a160: Int64, a161: Int64, a162: Int64, a163: Int64,
    a164: Int64, a165: Int64, a166: Int64, a167: Int64, a168: Int64, a169: Int64, a170: Int64, a171: Int64, a172: Int64,
    a173: Int64, a174: Int64, a175: Int64, a176: Int64, a177: Int64, a178: Int64, a179: Int64, a180: Int64, a181: Int64,
    a182: Int64, a183: Int64, a184: Int64, a185: Int64, a186: Int64, a187: Int64, a188: Int64, a189: Int64, a190: Int64,
    a191: Int64, a192: Int64, a193: Int64, a194: Int64, a195: Int64, a196: Int64, a197: Int64, a198: Int64, a199: Int64,
    a200: Int64, a201: Int64, a202: Int64, a203: Int64, a204: Int64, a205: Int64, a206: Int64, a207: Int64, a208: Int64,
    a209: Int64, a210: Int64, a211: Int64, a212: Int64, a213: Int64, a214: Int64, a215: Int64, a216: Int64, a217: Int64,
    a218: Int64, a219: Int64, a220: Int64, a221: Int64, a222: Int64, a223: Int64, a224: Int64, a225: Int64, a226: Int64,
    a227: Int64, a228: Int64, a229: Int64, a230: Int64, a231: Int64, a232: Int64, a233: Int64, a234: Int64, a235: Int64,
    a236: Int64, a237: Int64, a238: Int64, a239: Int64, a240: Int64, a241: Int64, a242: Int64, a243: Int64, a244: Int64,
    a245: Int64, a246: Int64, a247: Int64, a248: Int64, a249: Int64, a250: Int64, a251: Int64, a252: Int64, a253: Int64,
    a254: Int64, a255: Int64, a256: Int64, a257: Int64, a258: Int64, a259: Int64, a260: Int64, a261: Int64, a262: Int64,
    a263: Int64, a264: Int64, a265: Int64, a266: Int64, a267: Int64, a268: Int64, a269: Int64, a270: Int64, a271: Int64,
    a272: Int64, a273: Int64, a274: Int64, a275: Int64, a276: Int64, a277: Int64, a278: Int64, a279: Int64, a280: Int64,
    a281: Int64, a282: Int64, a283: Int64, a284: Int64, a285: Int64, a286: Int64, a287: Int64, a288: Int64, a289: Int64,
    a290: Int64, a291: Int64, a292: Int64, a293: Int64, a294: Int64, a295: Int64, a296: Int64, a297: Int64, a298: Int64,
    a299: Int64, a300: Int64, a301: Int64, a302: Int64, a303: Int64, a304: Int64, a305: Int64, a306: Int64, a307: Int64,
    a308: Int64, a309: Int64, a310: Int64, a311: Int64, a312: Int64, a313: Int64, a314: Int64, a315: Int64, a316: Int64,
    a317: Int64, a318: Int64, a319: Int64, a320: Int64, a321: Int64, a322: Int64, a323: Int64, a324: Int64, a325: Int64,
    a326: Int64, a327: Int64, a328: Int64, a329: Int64, a330: Int64, a331: Int64, a332: Int64, a333: Int64, a334: Int64,
    a335: Int64, a336: Int64, a337: Int64, a338: Int64, a339: Int64, a340: Int64, a341: Int64, a342: Int64, a343: Int64,
    a344: Int64, a345: Int64, a346: Int64, a347: Int64, a348: Int64, a349: Int64, a350: Int64, a351: Int64, a352: Int64,
    a353: Int64, a354: Int64, a355: Int64, a356: Int64, a357: Int64, a358: Int64, a359: Int64, a360: Int64, a361: Int64,
    a362: Int64, a363: Int64, a364: Int64, a365: Int64, a366: Int64, a367: Int64, a368: Int64, a369: Int64, a370: Int64,
    a371: Int64, a372: Int64, a373: Int64, a374: Int64, a375: Int64, a376: Int64, a377: Int64, a378: Int64, a379: Int64,
    a380: Int64, a381: Int64, a382: Int64, a383: Int64, a384: Int64, a385: Int64, a386: Int64, a387: Int64, a388: Int64,
    a389: Int64, a390: Int64, a391: Int64, a392: Int64, a393: Int64, a394: Int64, a395: Int64, a396: Int64, a397: Int64,
    a398: Int64, a399: Int64, a400: Int64, a401: Int64, a402: Int64, a403: Int64, a404: Int64, a405: Int64, a406: Int64,
    a407: Int64, a408: Int64, a409: Int64, a410: Int64, a411: Int64, a412: Int64, a413: Int64, a414: Int64, a415: Int64,
    a416: Int64, a417: Int64, a418: Int64, a419: Int64, a420: Int64, a421: Int64, a422: Int64, a423: Int64, a424: Int64,
    a425: Int64, a426: Int64, a427: Int64, a428: Int64, a429: Int64, a430: Int64, a431: Int64, a432: Int64, a433: Int64,
    a434: Int64, a435: Int64, a436: Int64, a437: Int64, a438: Int64, a439: Int64, a440: Int64, a441: Int64, a442: Int64,
    a443: Int64, a444: Int64, a445: Int64, a446: Int64, a447: Int64, a448: Int64, a449: Int64, a450: Int64, a451: Int64,
    a452: Int64, a453: Int64, a454: Int64, a455: Int64, a456: Int64, a457: Int64, a458: Int64, a459: Int64, a460: Int64,
    a461: Int64, a462: Int64, a463: Int64, a464: Int64, a465: Int64, a466: Int64, a467: Int64, a468: Int64, a469: Int64,
    a470: Int64, a471: Int64, a472: Int64, a473: Int64, a474: Int64, a475: Int64, a476: Int64, a477: Int64, a478: Int64,
    a479: Int64, a480: Int64, a481: Int64, a482: Int64, a483: Int64, a484: Int64, a485: Int64, a486: Int64, a487: Int64,
    a488: Int64, a489: Int64, a490: Int64, a491: Int64, a492: Int64, a493: Int64, a494: Int64, a495: Int64, a496: Int64,
    a497: Int64, a498: Int64, a499: Int64, a500: Int64): Unit {
    if (a1 < 500) { // stackoverflow
        test(a1 + 1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1)
    } else {
        throw Exception()
    }
    return
}

main() {
    var a1 = 1
    try {
        test(a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1,
            a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1, a1)
    } catch (e: Error) {
        println(e.getStackTrace().size)
        return 0
    } catch (e: Exception) {
        println(e.getStackTrace().size)
        return 0
    }
    return 1
}

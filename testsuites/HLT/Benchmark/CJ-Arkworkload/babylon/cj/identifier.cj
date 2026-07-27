/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import std.regex.*

private let INT_VAL_2 = 2;
private let INT_VAL_10 = 10;
private let INT_VAL_13 = 13;
private let INT_VAL_48 = 48;
private let INT_VAL_58 = 58;
private let INT_VAL_65 = 65;
private let INT_VAL_36 = 36;
private let INT_VAL_91 = 91;
private let INT_VAL_97 = 97;
private let INT_VAL_95 = 95;
private let INT_VAL_123 = 123;
private let INT_VAL_0x2028 = 0x2028;
private let INT_VAL_0x2029 = 0x2029;
private let INT_VAL_0x10000 =  0x10000;
private let INT_VAL_0xFFFF = 0xffff;
private let INT_VAL_0xAA = 0xaa;

type IdentifierPredicate = (String) -> Bool

func makePredicate(words: String) : IdentifierPredicate {
    let wordArr = words.split(" ")
    return { s =>
        return wordArr.contains(s)
    }
}

public class ReservedWords {
    var enumAwait: IdentifierPredicate = makePredicate("enum await")
    var strict: IdentifierPredicate = makePredicate("implements interface let package private protected public static yield")
    var strictBind: IdentifierPredicate = makePredicate("eval arguments")
}

let reservedWords = ReservedWords()
    
var isKeywordFunc = makePredicate("break case catch continue debugger default do else finally for function if return switch throw try var while with null true false instanceof typeof void delete new in this let const class extends export import yield super")

private let nonASCIIidentifierStartChars = "\u{aa}\u{b5}\u{ba}\u{c0}-\u{d6}\u{d8}-\u{f6}\u{f8}-\u{2c1}\u{2c6}-\u{2d1}\u{2e0}-\u{2e4}\u{2ec}\u{2ee}\u{370}-\u{374}\u{376}\u{377}\u{37a}-\u{37d}\u{37f}\u{386}\u{388}-\u{38a}\u{38c}\u{38e}-\u{3a1}\u{3a3}-\u{3f5}\u{3f7}-\u{481}\u{48a}-\u{52f}\u{531}-\u{556}\u{559}\u{561}-\u{587}\u{5d0}-\u{5ea}\u{5f0}-\u{5f2}\u{620}-\u{64a}\u{66e}\u{66f}\u{671}-\u{6d3}\u{6d5}\u{6e5}\u{6e6}\u{6ee}\u{6ef}\u{6fa}-\u{6fc}\u{6ff}\u{710}\u{712}-\u{72f}\u{74d}-\u{7a5}\u{7b1}\u{7ca}-\u{7ea}\u{7f4}\u{7f5}\u{7fa}\u{800}-\u{815}\u{81a}\u{824}\u{828}\u{840}-\u{858}\u{8a0}-\u{8b4}\u{8b6}-\u{8bd}\u{904}-\u{939}\u{93d}\u{950}\u{958}-\u{961}\u{971}-\u{980}\u{985}-\u{98c}\u{98f}\u{990}\u{993}-\u{9a8}\u{9aa}-\u{9b0}\u{9b2}\u{9b6}-\u{9b9}\u{9bd}\u{9ce}\u{9dc}\u{9dd}\u{9df}-\u{9e1}\u{9f0}\u{9f1}\u{a05}-\u{a0a}\u{a0f}\u{a10}\u{a13}-\u{a28}\u{a2a}-\u{a30}\u{a32}\u{a33}\u{a35}\u{a36}\u{a38}\u{a39}\u{a59}-\u{a5c}\u{a5e}\u{a72}-\u{a74}\u{a85}-\u{a8d}\u{a8f}-\u{a91}\u{a93}-\u{aa8}\u{aaa}-\u{ab0}\u{ab2}\u{ab3}\u{ab5}-\u{ab9}\u{abd}\u{ad0}\u{ae0}\u{ae1}\u{af9}\u{b05}-\u{b0c}\u{b0f}\u{b10}\u{b13}-\u{b28}\u{b2a}-\u{b30}\u{b32}\u{b33}\u{b35}-\u{b39}\u{b3d}\u{b5c}\u{b5d}\u{b5f}-\u{b61}\u{b71}\u{b83}\u{b85}-\u{b8a}\u{b8e}-\u{b90}\u{b92}-\u{b95}\u{b99}\u{b9a}\u{b9c}\u{b9e}\u{b9f}\u{ba3}\u{ba4}\u{ba8}-\u{baa}\u{bae}-\u{bb9}\u{bd0}\u{c05}-\u{c0c}\u{c0e}-\u{c10}\u{c12}-\u{c28}\u{c2a}-\u{c39}\u{c3d}\u{c58}-\u{c5a}\u{c60}\u{c61}\u{c80}\u{c85}-\u{c8c}\u{c8e}-\u{c90}\u{c92}-\u{ca8}\u{caa}-\u{cb3}\u{cb5}-\u{cb9}\u{cbd}\u{cde}\u{ce0}\u{ce1}\u{cf1}\u{cf2}\u{d05}-\u{d0c}\u{d0e}-\u{d10}\u{d12}-\u{d3a}\u{d3d}\u{d4e}\u{d54}-\u{d56}\u{d5f}-\u{d61}\u{d7a}-\u{d7f}\u{d85}-\u{d96}\u{d9a}-\u{db1}\u{db3}-\u{dbb}\u{dbd}\u{dc0}-\u{dc6}\u{e01}-\u{e30}\u{e32}\u{e33}\u{e40}-\u{e46}\u{e81}\u{e82}\u{e84}\u{e87}\u{e88}\u{e8a}\u{e8d}\u{e94}-\u{e97}\u{e99}-\u{e9f}\u{ea1}-\u{ea3}\u{ea5}\u{ea7}\u{eaa}\u{eab}\u{ead}-\u{eb0}\u{eb2}\u{eb3}\u{ebd}\u{ec0}-\u{ec4}\u{ec6}\u{edc}-\u{edf}\u{f00}\u{f40}-\u{f47}\u{f49}-\u{f6c}\u{f88}-\u{f8c}\u{1000}-\u{102a}\u{103f}\u{1050}-\u{1055}\u{105a}-\u{105d}\u{1061}\u{1065}\u{1066}\u{106e}-\u{1070}\u{1075}-\u{1081}\u{108e}\u{10a0}-\u{10c5}\u{10c7}\u{10cd}\u{10d0}-\u{10fa}\u{10fc}-\u{1248}\u{124a}-\u{124d}\u{1250}-\u{1256}\u{1258}\u{125a}-\u{125d}\u{1260}-\u{1288}\u{128a}-\u{128d}\u{1290}-\u{12b0}\u{12b2}-\u{12b5}\u{12b8}-\u{12be}\u{12c0}\u{12c2}-\u{12c5}\u{12c8}-\u{12d6}\u{12d8}-\u{1310}\u{1312}-\u{1315}\u{1318}-\u{135a}\u{1380}-\u{138f}\u{13a0}-\u{13f5}\u{13f8}-\u{13fd}\u{1401}-\u{166c}\u{166f}-\u{167f}\u{1681}-\u{169a}\u{16a0}-\u{16ea}\u{16ee}-\u{16f8}\u{1700}-\u{170c}\u{170e}-\u{1711}\u{1720}-\u{1731}\u{1740}-\u{1751}\u{1760}-\u{176c}\u{176e}-\u{1770}\u{1780}-\u{17b3}\u{17d7}\u{17dc}\u{1820}-\u{1877}\u{1880}-\u{18a8}\u{18aa}\u{18b0}-\u{18f5}\u{1900}-\u{191e}\u{1950}-\u{196d}\u{1970}-\u{1974}\u{1980}-\u{19ab}\u{19b0}-\u{19c9}\u{1a00}-\u{1a16}\u{1a20}-\u{1a54}\u{1aa7}\u{1b05}-\u{1b33}\u{1b45}-\u{1b4b}\u{1b83}-\u{1ba0}\u{1bae}\u{1baf}\u{1bba}-\u{1be5}\u{1c00}-\u{1c23}\u{1c4d}-\u{1c4f}\u{1c5a}-\u{1c7d}\u{1c80}-\u{1c88}\u{1ce9}-\u{1cec}\u{1cee}-\u{1cf1}\u{1cf5}\u{1cf6}\u{1d00}-\u{1dbf}\u{1e00}-\u{1f15}\u{1f18}-\u{1f1d}\u{1f20}-\u{1f45}\u{1f48}-\u{1f4d}\u{1f50}-\u{1f57}\u{1f59}\u{1f5b}\u{1f5d}\u{1f5f}-\u{1f7d}\u{1f80}-\u{1fb4}\u{1fb6}-\u{1fbc}\u{1fbe}\u{1fc2}-\u{1fc4}\u{1fc6}-\u{1fcc}\u{1fd0}-\u{1fd3}\u{1fd6}-\u{1fdb}\u{1fe0}-\u{1fec}\u{1ff2}-\u{1ff4}\u{1ff6}-\u{1ffc}\u{2071}\u{207f}\u{2090}-\u{209c}\u{2102}\u{2107}\u{210a}-\u{2113}\u{2115}\u{2118}-\u{211d}\u{2124}\u{2126}\u{2128}\u{212a}-\u{2139}\u{213c}-\u{213f}\u{2145}-\u{2149}\u{214e}\u{2160}-\u{2188}\u{2c00}-\u{2c2e}\u{2c30}-\u{2c5e}\u{2c60}-\u{2ce4}\u{2ceb}-\u{2cee}\u{2cf2}\u{2cf3}\u{2d00}-\u{2d25}\u{2d27}\u{2d2d}\u{2d30}-\u{2d67}\u{2d6f}\u{2d80}-\u{2d96}\u{2da0}-\u{2da6}\u{2da8}-\u{2dae}\u{2db0}-\u{2db6}\u{2db8}-\u{2dbe}\u{2dc0}-\u{2dc6}\u{2dc8}-\u{2dce}\u{2dd0}-\u{2dd6}\u{2dd8}-\u{2dde}\u{3005}-\u{3007}\u{3021}-\u{3029}\u{3031}-\u{3035}\u{3038}-\u{303c}\u{3041}-\u{3096}\u{309b}-\u{309f}\u{30a1}-\u{30fa}\u{30fc}-\u{30ff}\u{3105}-\u{312d}\u{3131}-\u{318e}\u{31a0}-\u{31ba}\u{31f0}-\u{31ff}\u{3400}-\u{4db5}\u{4e00}-\u{9fd5}\u{a000}-\u{a48c}\u{a4d0}-\u{a4fd}\u{a500}-\u{a60c}\u{a610}-\u{a61f}\u{a62a}\u{a62b}\u{a640}-\u{a66e}\u{a67f}-\u{a69d}\u{a6a0}-\u{a6ef}\u{a717}-\u{a71f}\u{a722}-\u{a788}\u{a78b}-\u{a7ae}\u{a7b0}-\u{a7b7}\u{a7f7}-\u{a801}\u{a803}-\u{a805}\u{a807}-\u{a80a}\u{a80c}-\u{a822}\u{a840}-\u{a873}\u{a882}-\u{a8b3}\u{a8f2}-\u{a8f7}\u{a8fb}\u{a8fd}\u{a90a}-\u{a925}\u{a930}-\u{a946}\u{a960}-\u{a97c}\u{a984}-\u{a9b2}\u{a9cf}\u{a9e0}-\u{a9e4}\u{a9e6}-\u{a9ef}\u{a9fa}-\u{a9fe}\u{aa00}-\u{aa28}\u{aa40}-\u{aa42}\u{aa44}-\u{aa4b}\u{aa60}-\u{aa76}\u{aa7a}\u{aa7e}-\u{aaaf}\u{aab1}\u{aab5}\u{aab6}\u{aab9}-\u{aabd}\u{aac0}\u{aac2}\u{aadb}-\u{aadd}\u{aae0}-\u{aaea}\u{aaf2}-\u{aaf4}\u{ab01}-\u{ab06}\u{ab09}-\u{ab0e}\u{ab11}-\u{ab16}\u{ab20}-\u{ab26}\u{ab28}-\u{ab2e}\u{ab30}-\u{ab5a}\u{ab5c}-\u{ab65}\u{ab70}-\u{abe2}\u{ac00}-\u{d7a3}\u{d7b0}-\u{d7c6}\u{d7cb}-\u{d7fb}\u{f900}-\u{fa6d}\u{fa70}-\u{fad9}\u{fb00}-\u{fb06}\u{fb13}-\u{fb17}\u{fb1d}\u{fb1f}-\u{fb28}\u{fb2a}-\u{fb36}\u{fb38}-\u{fb3c}\u{fb3e}\u{fb40}\u{fb41}\u{fb43}\u{fb44}\u{fb46}-\u{fbb1}\u{fbd3}-\u{fd3d}\u{fd50}-\u{fd8f}\u{fd92}-\u{fdc7}\u{fdf0}-\u{fdfb}\u{fe70}-\u{fe74}\u{fe76}-\u{fefc}\u{ff21}-\u{ff3a}\u{ff41}-\u{ff5a}\u{ff66}-\u{ffbe}\u{ffc2}-\u{ffc7}\u{ffca}-\u{ffcf}\u{ffd2}-\u{ffd7}\u{ffda}-\u{ffdc}"

private let nonASCIIidentifierChars =  "\u{200c}\u{200d}\u{b7}\u{300}-\u{36f}\u{387}\u{483}-\u{487}\u{591}-\u{5bd}\u{5bf}\u{5c1}\u{5c2}\u{5c4}\u{5c5}\u{5c7}\u{610}-\u{61a}\u{64b}-\u{669}\u{670}\u{6d6}-\u{6dc}\u{6df}-\u{6e4}\u{6e7}\u{6e8}\u{6ea}-\u{6ed}\u{6f0}-\u{6f9}\u{711}\u{730}-\u{74a}\u{7a6}-\u{7b0}\u{7c0}-\u{7c9}\u{7eb}-\u{7f3}\u{816}-\u{819}\u{81b}-\u{823}\u{825}-\u{827}\u{829}-\u{82d}\u{859}-\u{85b}\u{8d4}-\u{8e1}\u{8e3}-\u{903}\u{93a}-\u{93c}\u{93e}-\u{94f}\u{951}-\u{957}\u{962}\u{963}\u{966}-\u{96f}\u{981}-\u{983}\u{9bc}\u{9be}-\u{9c4}\u{9c7}\u{9c8}\u{9cb}-\u{9cd}\u{9d7}\u{9e2}\u{9e3}\u{9e6}-\u{9ef}\u{a01}-\u{a03}\u{a3c}\u{a3e}-\u{a42}\u{a47}\u{a48}\u{a4b}-\u{a4d}\u{a51}\u{a66}-\u{a71}\u{a75}\u{a81}-\u{a83}\u{abc}\u{abe}-\u{ac5}\u{ac7}-\u{ac9}\u{acb}-\u{acd}\u{ae2}\u{ae3}\u{ae6}-\u{aef}\u{b01}-\u{b03}\u{b3c}\u{b3e}-\u{b44}\u{b47}\u{b48}\u{b4b}-\u{b4d}\u{b56}\u{b57}\u{b62}\u{b63}\u{b66}-\u{b6f}\u{b82}\u{bbe}-\u{bc2}\u{bc6}-\u{bc8}\u{bca}-\u{bcd}\u{bd7}\u{be6}-\u{bef}\u{c00}-\u{c03}\u{c3e}-\u{c44}\u{c46}-\u{c48}\u{c4a}-\u{c4d}\u{c55}\u{c56}\u{c62}\u{c63}\u{c66}-\u{c6f}\u{c81}-\u{c83}\u{cbc}\u{cbe}-\u{cc4}\u{cc6}-\u{cc8}\u{cca}-\u{ccd}\u{cd5}\u{cd6}\u{ce2}\u{ce3}\u{ce6}-\u{cef}\u{d01}-\u{d03}\u{d3e}-\u{d44}\u{d46}-\u{d48}\u{d4a}-\u{d4d}\u{d57}\u{d62}\u{d63}\u{d66}-\u{d6f}\u{d82}\u{d83}\u{dca}\u{dcf}-\u{dd4}\u{dd6}\u{dd8}-\u{ddf}\u{de6}-\u{def}\u{df2}\u{df3}\u{e31}\u{e34}-\u{e3a}\u{e47}-\u{e4e}\u{e50}-\u{e59}\u{eb1}\u{eb4}-\u{eb9}\u{ebb}\u{ebc}\u{ec8}-\u{ecd}\u{ed0}-\u{ed9}\u{f18}\u{f19}\u{f20}-\u{f29}\u{f35}\u{f37}\u{f39}\u{f3e}\u{f3f}\u{f71}-\u{f84}\u{f86}\u{f87}\u{f8d}-\u{f97}\u{f99}-\u{fbc}\u{fc6}\u{102b}-\u{103e}\u{1040}-\u{1049}\u{1056}-\u{1059}\u{105e}-\u{1060}\u{1062}-\u{1064}\u{1067}-\u{106d}\u{1071}-\u{1074}\u{1082}-\u{108d}\u{108f}-\u{109d}\u{135d}-\u{135f}\u{1369}-\u{1371}\u{1712}-\u{1714}\u{1732}-\u{1734}\u{1752}\u{1753}\u{1772}\u{1773}\u{17b4}-\u{17d3}\u{17dd}\u{17e0}-\u{17e9}\u{180b}-\u{180d}\u{1810}-\u{1819}\u{18a9}\u{1920}-\u{192b}\u{1930}-\u{193b}\u{1946}-\u{194f}\u{19d0}-\u{19da}\u{1a17}-\u{1a1b}\u{1a55}-\u{1a5e}\u{1a60}-\u{1a7c}\u{1a7f}-\u{1a89}\u{1a90}-\u{1a99}\u{1ab0}-\u{1abd}\u{1b00}-\u{1b04}\u{1b34}-\u{1b44}\u{1b50}-\u{1b59}\u{1b6b}-\u{1b73}\u{1b80}-\u{1b82}\u{1ba1}-\u{1bad}\u{1bb0}-\u{1bb9}\u{1be6}-\u{1bf3}\u{1c24}-\u{1c37}\u{1c40}-\u{1c49}\u{1c50}-\u{1c59}\u{1cd0}-\u{1cd2}\u{1cd4}-\u{1ce8}\u{1ced}\u{1cf2}-\u{1cf4}\u{1cf8}\u{1cf9}\u{1dc0}-\u{1df5}\u{1dfb}-\u{1dff}\u{203f}\u{2040}\u{2054}\u{20d0}-\u{20dc}\u{20e1}\u{20e5}-\u{20f0}\u{2cef}-\u{2cf1}\u{2d7f}\u{2de0}-\u{2dff}\u{302a}-\u{302f}\u{3099}\u{309a}\u{a620}-\u{a629}\u{a66f}\u{a674}-\u{a67d}\u{a69e}\u{a69f}\u{a6f0}\u{a6f1}\u{a802}\u{a806}\u{a80b}\u{a823}-\u{a827}\u{a880}\u{a881}\u{a8b4}-\u{a8c5}\u{a8d0}-\u{a8d9}\u{a8e0}-\u{a8f1}\u{a900}-\u{a909}\u{a926}-\u{a92d}\u{a947}-\u{a953}\u{a980}-\u{a983}\u{a9b3}-\u{a9c0}\u{a9d0}-\u{a9d9}\u{a9e5}\u{a9f0}-\u{a9f9}\u{aa29}-\u{aa36}\u{aa43}\u{aa4c}\u{aa4d}\u{aa50}-\u{aa59}\u{aa7b}-\u{aa7d}\u{aab0}\u{aab2}-\u{aab4}\u{aab7}\u{aab8}\u{aabe}\u{aabf}\u{aac1}\u{aaeb}-\u{aaef}\u{aaf5}\u{aaf6}\u{abe3}-\u{abea}\u{abec}\u{abed}\u{abf0}-\u{abf9}\u{fb1e}\u{fe00}-\u{fe0f}\u{fe20}-\u{fe2f}\u{fe33}\u{fe34}\u{fe4d}-\u{fe4f}\u{ff10}-\u{ff19}\u{ff3f}"

private let nonASCIIidentifierStart = Regex("[" + nonASCIIidentifierStartChars + "]")

private let nonASCIIidentifier = Regex("[" + nonASCIIidentifierStartChars + nonASCIIidentifierChars + "]")

private let astralIdentifierStartCodes = [0,11,2,25,2,18,2,1,2,14,3,13,35,122,70,52,268,28,4,48,48,31,17,26,6,37,11,29,3,35,5,7,2,4,43,157,19,35,5,35,5,39,9,51,157,310,10,21,11,7,153,5,3,0,2,43,2,1,4,0,3,22,11,22,10,30,66,18,2,1,11,21,11,25,71,55,7,1,65,0,16,3,2,2,2,26,45,28,4,28,36,7,2,27,28,53,11,21,11,18,14,17,111,72,56,50,14,50,785,52,76,44,33,24,27,35,42,34,4,0,13,47,15,3,22,0,2,0,36,17,2,24,85,6,2,0,2,3,2,14,2,9,8,46,39,7,3,1,3,21,2,6,2,1,2,4,4,0,19,0,13,4,159,52,19,3,54,47,21,1,2,0,185,46,42,3,37,47,21,0,60,42,86,25,391,63,32,0,449,56,264,8,2,36,18,0,50,29,881,921,103,110,18,195,2749,1070,4050,582,8634,568,8,30,114,29,19,47,17,3,32,20,6,18,881,68,12,0,67,12,65,0,32,6124,20,754,9486,1,3071,106,6,12,4,8,8,9,5991,84,2,70,2,1,3,0,3,1,3,3,2,11,2,0,2,6,2,64,2,3,3,7,2,6,2,27,2,3,2,4,2,0,4,6,2,339,3,24,2,24,2,30,2,24,2,30,2,24,2,30,2,24,2,30,2,24,2,7,4149,196,60,67,1213,3,2,26,2,1,2,0,3,0,2,9,2,3,2,0,2,0,7,0,5,0,2,0,2,0,2,2,2,1,2,0,3,0,2,0,2,0,2,0,2,0,2,1,2,0,3,3,2,6,2,3,2,3,2,0,2,9,2,16,6,2,2,4,2,16,4421,42710,42,4148,12,221,3,5761,10591,541]
private let astralIdentifierCodes = [509,0,227,0,150,4,294,9,1368,2,2,1,6,3,41,2,5,0,166,1,1306,2,54,14,32,9,16,3,46,10,54,9,7,2,37,13,2,9,52,0,13,2,49,13,10,2,4,9,83,11,7,0,161,11,6,9,7,3,57,0,2,6,3,1,3,2,10,0,11,1,3,6,4,4,193,17,10,9,87,19,13,9,214,6,3,8,28,1,83,16,16,9,82,12,9,9,84,14,5,9,423,9,838,7,2,7,17,9,57,21,2,13,19882,9,135,4,60,6,26,9,1016,45,17,3,19723,1,5319,4,4,5,9,7,3,6,31,3,149,2,1418,49,513,54,5,49,9,0,15,0,23,4,2,14,1361,6,2,16,3,6,2,1,2,4,2214,6,110,6,6,9,792487,239]

func isInAstralSet(code: Int64, set: Array<Int64>) : Bool {
    var pos = 0x10000
    var i = 0
    while ( i < set.size ) {
        pos += set[i]
        if ( pos > code ) {
            return false
        }
        pos += set[i + 1]
        if ( pos >= code ) {
            return true
        }
        i += INT_VAL_2
    }
    return false
}

func isIdentifierStart(code: Int64) : Bool{
    if (code < INT_VAL_65) {
        return code == INT_VAL_36
    }
    if (code < INT_VAL_91) {
        return true
    }
    if (code < INT_VAL_97) {
        return code == INT_VAL_95
    }
    if (code < INT_VAL_123) {
        return true
    }
    if (code <= INT_VAL_0xFFFF) {
        // 当前不支持 unicode 正则

        return code >= INT_VAL_0xAA && false
    }
    return isInAstralSet(code, astralIdentifierStartCodes)
}

func isIdentifierChar(code: Int64) : Bool {
    if (code < INT_VAL_48) {
        return code == INT_VAL_36
    }
    if (code < INT_VAL_58) {
        return true
    }
    if (code < INT_VAL_65) {
        return false
    }
    if (code < INT_VAL_91) {
        return true
    }
    if (code < INT_VAL_97) {
        return code == INT_VAL_95
    }
    if (code < 123) {
        return true
    }
    if (code <= INT_VAL_0xFFFF) {
        // 当前不支持 unicode 正则
        return code >= INT_VAL_0xAA && false
    }
    return isInAstralSet(code, astralIdentifierStartCodes) || isInAstralSet(code, astralIdentifierCodes);
}

func isNewLine(code: Int64) : Bool {
    return code == INT_VAL_10 || code == INT_VAL_13 || code == INT_VAL_0x2028 || code == INT_VAL_0x2029
}

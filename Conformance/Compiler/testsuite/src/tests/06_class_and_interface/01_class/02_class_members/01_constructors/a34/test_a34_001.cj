/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a34_001

  @Level:         1

  @Assertion: 6.1.2.1(34)
              A constructor has the following dedicated syntax.
              Init
                : nonSMemberModifier? 'init' '(r' InitParamLists? ')'
                '{'
                  (superCallExression | initCallExpression)?
                  ( expression
                  | variableDeclaration
                  | functionDefinition)*
                '}'
                ;
              InitParamLists
                : unnamedParameterList (r',' namedParameterList)?
                | namedParameterList
                ;

  @Description: Check various combinations of correct init constructor syntax

  @Mode: compileonly

  @Negative: no

  @Structure: single

  @CompileWarning: Yes

  @Comment: Can not avoid warnings here, 
            syntax allows an unused function definition in the constructor body.

*/

// Modifiers: Absent, Parameters: Absent, Super or this: Absent, Body content: Empty
class Sfvyk1P {
  init() {
  }
}

// Modifiers: Absent, Parameters: Absent, Super or this: Absent, Body content: Expr
class `N6b9f2aHZ9` {
  init() {
    print(-0x84644 - -0b11111110110100111)
  }
}

// Modifiers: Absent, Parameters: Absent, Super or this: Absent, Body content: VarDecl
class `OmkCM` {
  init() {
    let R = 0o651u16..173u16:41
  }
}

// Modifiers: Absent, Parameters: Absent, Super or this: Absent, Body content: FuncDef
class AyQJlx {
  init() {
    func L5NhYoo(`N55Q`: Range<Int32>, `n`: Bool, cOk4mk6: Range<UInt16>) {}
  }
}

// Modifiers: Absent, Parameters: Absent, Super or this: Absent, Body content: Full
class AN {
  init() {
    print(-0x599e6 - 0b10100100110000001001)
    func g1jFBM8d<n3HAk1X5g>() {
      return true
    }
    var GyBB9Fgr2B = ()
  }
}

// Modifiers: Absent, Parameters: Absent, Super or this: Super, Body content: Empty
open class `FTA_` {
  init(Km8g4p: () -> Bool, J: Bool, Yy47l: Unit) {}
}
class HH5ZP9wf <: `FTA_` {
  init() {
    super({ => return false}, false, ())
  }
}

// Modifiers: Absent, Parameters: Absent, Super or this: Super, Body content: Expr
open class `gdcs1Ggn_` {
  init(`a2PXcDBsR`: Rune) {}
}
class k5e4JoLjB <: `gdcs1Ggn_` {
  init() {
    super(r'1')
    print(-371900 * -0xb17e)
  }
}

// Modifiers: Absent, Parameters: Absent, Super or this: Super, Body content: VarDecl
open class MwzD8XfW {
  init(`RS`: Bool, yRp: (String, UInt8, Array<Range<Int32>>) -> String) {}
}
class YKJGtpOR <: MwzD8XfW {
  init() {
    super(false, {ZECNAGOm3J: String, kl5DuhnaL: UInt8, `PMgpNN`: Array<Range<Int32>> => return "FoI2j7I42NpD"})
    var `dg` = ()
  }
}

// Modifiers: Absent, Parameters: Absent, Super or this: Super, Body content: FuncDef
open class duSHjPnD5s {
  init() {}
}
class QP3I8hqEN <: duSHjPnD5s {
  init() {
    super()
    func kKfTGl4cTn<`ByntSPyQnW`>(`vhC3vcMM6C`: Int16, `QKF9h4hr`: ((Unit, Float64, Unit), String, Array<Array<(Range<UInt16>) -> Unit>>) -> (Range<UInt8>, Float32, (Unit, Unit)) -> Array<String>) {
      return [true, false]
    }
  }
}

// Modifiers: Absent, Parameters: Absent, Super or this: Super, Body content: Full
open class `KG9MccLtDB` {
  init(mChshCBg0q: Float16) {}
}
class x6eYFPKeB <: `KG9MccLtDB` {
  init() {
    super(76.75e-57f16)
    print(0o3264305 - -287693)
    func ZUPllSmgCB(`WEW`: Rune) {}
    let `jj` = [[{`puk`: Rune => return r'r'}], [{QuH: Rune => return r'R'}, {`v`: Rune => return r'S'}], [{jtEnvBgC: Rune => return r't'}, {`k`: Rune => return r'b'}], [{`gS8RPec8`: Rune => return r'v'}, {kNkhBUidP: Rune => return r'y'}, {ep3: Rune => return r'u'}, {JHGc: Rune => return r'B'}], [{ZQUuT: Rune => return r'R'}, {`DjErYvk`: Rune => return r'G'}, {`yRyMQm`: Rune => return r'8'}, {k0AZphnCLt: Rune => return r'x'}, {`dqO0T`: Rune => return r'Z'}]]
  }
}

// Modifiers: Absent, Parameters: Absent, Super or this: This, Body content: Empty
class `a2bg` {
  `a2bg`(`sI1xW`: String, `JjNq`: UInt32) {}
  init() {
    this("BS3wBZCwR8F", 0o2312136u32)
  }
}

// Modifiers: Absent, Parameters: Absent, Super or this: This, Body content: Expr
class `L_mrJCy6WW` {
  `L_mrJCy6WW`(qSgKw9Y: Array<Range<Int32>>, ESFJAOw6: Bool) {}
  init() {
    this([-0o1656247i32..0o121704i32:45, -471263i32..646618i32:54], false)
    print(0o2605776 * 0b11000111110101110011)
  }
}

// Modifiers: Absent, Parameters: Absent, Super or this: This, Body content: VarDecl
class `f5usv` {
  `f5usv`(`YanQo3BH0p`: Bool) {}
  init() {
    this(false)
    var A4vo2M6So = 0b110011u8..=192u8:99
  }
}

// Modifiers: Absent, Parameters: Absent, Super or this: This, Body content: FuncDef
class WIdQ_ {
  WIdQ_(`s`: Int8, `mkYtJ2b`: String, `CdZgcuWxMO`: Array<Unit>) {}
  init() {
    this(0x32i8, "", [(), (), ()])
    func `IDvRGO`() {
      return -0o1243i16..=0x2b2i16:40
    }
  }
}

// Modifiers: Absent, Parameters: Absent, Super or this: This, Body content: Full
class `EOZJ` {
  `EOZJ`(`WR`: Float32) {}
  init() {
    this(123.94f32)
    print(0x39da7 - 0o2317467)
    func E<`FDmnfzX`>(`SS`: Range<UInt8>) {}
    var IgJ8nC3Dq = 138689..-811163:34
  }
}

// Modifiers: Absent, Parameters: Unnamed, Super or this: Absent, Body content: Empty
class `hAU` {
  init(x9fx: String) {
  }
}

// Modifiers: Absent, Parameters: Unnamed, Super or this: Absent, Body content: Expr
class RnYSq0V {
  init(bomm2BssAL: Array<Bool>) {
    print(bomm2BssAL is Bool)
  }
}

// Modifiers: Absent, Parameters: Unnamed, Super or this: Absent, Body content: VarDecl
class `jhd3UFMu6` {
  init(Yf5XQvm: Int32, YIp9eZ: String) {
    let Cyjycuiv = r'u'
  }
}

// Modifiers: Absent, Parameters: Unnamed, Super or this: Absent, Body content: FuncDef
class zLPl6gS {
  init(ED8Hcr2: Bool, vwyXR: (Float16, Bool, Rune, () -> Range<UInt16>)) {
    func T77Y<`OnBVURE`>(`QySi6jCBhi`: Float32, `gPSFbTTvB`: Rune, `ghb`: Rune) {
      return {`sfdXRPaCe`: Range<UInt8>, `HfZHPKkG_`: Float32 => return r'0'}
    }
  }
}

// Modifiers: Absent, Parameters: Unnamed, Super or this: Absent, Body content: Full
class rq {
  init(pKJdS: Unit, `Fs1hB`: Array<String>) {
    print(`Fs1hB` is ((Array<Array<Range<UInt32>>>, (Float64) -> Array<(Unit, String, () -> ((Float32) -> Float32) -> Bool)>)) -> UInt32)
    func H<`YjqOLPUxCj`>(`sooB2J1aR`: Array<Array<String>>, `WiPKrxq`: Range<UInt64>) {}
    let `KcXTGz0` = {EBAZgb8R: String => return { => return r'0'}}
  }
}

// Modifiers: Absent, Parameters: Unnamed, Super or this: Super, Body content: Empty
open class ID {
  init(xoUsDMPJ: Int64, yeL0ARi_: String) {}
}
class `pxMgCcj` <: ID {
  init(spkPz_0rIR: Bool) {
    super(-653861, "6Sr")
  }
}

// Modifiers: Absent, Parameters: Unnamed, Super or this: Super, Body content: Expr
open class `Ftv0OW` {
  init(`c2Lm3Nvo46`: Int32) {}
}
class `kFRKu2E` <: `Ftv0OW` {
  init(wNa5nI_0: Unit, `w3PiylyoIT`: Bool) {
    super(0x10957i32)
    print(`w3PiylyoIT` is Rune)
  }
}

// Modifiers: Absent, Parameters: Unnamed, Super or this: Super, Body content: VarDecl
open class `aWYT5T` {
  init() {}
}
class HOu <: `aWYT5T` {
  init(r: Range<Int8>, `XHYc`: (Bool, Float64, () -> Range<Int8>)) {
    super()
    var `SUSbs` = {rgIm: UInt64, pRuk4: ((Unit, Rune, Rune) -> Unit, Array<Float16>) -> Rune, E7hT2cv4gJ: Unit => return -0xb46f5i32}
  }
}

// Modifiers: Absent, Parameters: Unnamed, Super or this: Super, Body content: FuncDef
open class TUvC4 {
  init(`QLzLsaSLuc`: Float32, `OlrCzNnfBe`: Bool, fvI: (Float64, () -> (Array<String>, Int32, Bool, String), Bool, String)) {}
}
class `njrC` <: TUvC4 {
  init(v7h3S: Array<(Rune, String, Unit)>) {
    super(14.37f32, false, (-12.201e-38, { => return (["6Z4huPmNyoz5fEN", "A4CwV", "27puQhx7wh"], 0o3275660i32, true, "6T2ZA9NZ91xRFei")}, false, "jJdo"))
    func `mO2Fo`(`cfZl`: (UInt8, Int64)) {}
  }
}

// Modifiers: Absent, Parameters: Unnamed, Super or this: Super, Body content: Full
open class `oe05YMartu` {
  init(`zywQNJeSY`: Unit, `wOaPhW5`: Int16, ExV2: String) {}
}
class Or8wL <: `oe05YMartu` {
  init(`pE`: String, spvar: String) {
    super((), -0x23fi16, "2zmbmzc51nsnNBgE")
    print(spvar is String)
    func c<qQMW9evjZ>(fbGM: Unit) {}
    let dEs = [false, false, false, true]
  }
}

// Modifiers: Absent, Parameters: Unnamed, Super or this: This, Body content: Empty
class nr0p {
  nr0p(Od9w_hEfnE: Unit, `q_`: Array<Unit>, `Y`: ((Unit, Rune, () -> Rune, Float32), Rune) -> UInt16) {}
  init(EqAtJ: Bool, `naRMigt2Qj`: Rune) {
    this((), [(), ()], {`G93WikgRJ`: (Unit, Rune, () -> Rune, Float32), `LbD7Y`: Rune => return 0xadu16})
  }
}

// Modifiers: Absent, Parameters: Unnamed, Super or this: This, Body content: Expr
class `xgsStyT` {
  `xgsStyT`(cASOP49u: Unit, PqZQ7Xwhd: Array<Rune>) {}
  init(`d`: (Bool) -> Bool) {
    this((), [r'e'])
    print(`d` is Range<UInt32>)
  }
}

// Modifiers: Absent, Parameters: Unnamed, Super or this: This, Body content: VarDecl
class Tm {
  Tm() {}
  init(`VI1m`: Range<UInt64>) {
    this()
    var zni9T_ujH = ()
  }
}

// Modifiers: Absent, Parameters: Unnamed, Super or this: This, Body content: FuncDef
class `PuUHSbeoc` {
  `PuUHSbeoc`(`je`: Range<UInt64>, `YIEKitG_Pm`: Range<UInt32>) {}
  init(Ar9o6AtZl: (String, Unit)) {
    this(0b10010010101001011110u64..0b10110110000010111010u64:45, 0xc2f08u32..=0xdf154u32:98)
    func J() {}
  }
}

// Modifiers: Absent, Parameters: Unnamed, Super or this: This, Body content: Full
class `PhtLu8` {
  `PhtLu8`(`gLHEtklQ`: Rune, d9LURQy: Unit) {}
  init(`d3rnO0`: Unit) {
    this(r'v', ())
    print(`d3rnO0` is () -> () -> String)
    func jhmb1(tDvORPT: Rune, U1rz: Float64) {}
    var `DrNNx` = ()
  }
}

// Modifiers: Absent, Parameters: Named, Super or this: Absent, Body content: Empty
class `Oyq1T` {
  init(L2l1C!: (Float16, Range<Int16>, (Int8, (Array<Array<Array<Bool>>>, Bool) -> (UInt32) -> Array<UInt16>, (String, (Unit, Bool, Rune, Unit)) -> (UInt16, Range<Int8>, Unit)) -> (Float64) -> Int32) -> Unit = {`BE6`: Float16, `f7`: Range<Int16>, `D9v952_`: (Int8, (Array<Array<Array<Bool>>>, Bool) -> (UInt32) -> Array<UInt16>, (String, (Unit, Bool, Rune, Unit)) -> (UInt16, Range<Int8>, Unit)) -> (Float64) -> Int32 => return ()}, `odCSu1q`!: Range<UInt8>) {
  }
}

// Modifiers: Absent, Parameters: Named, Super or this: Absent, Body content: Expr
class `HDh` {
  init(`NPumGKfR`!: Array<String> = ["ZXtI9KIx2cSt", "xXFf", "qsHL4IqkcwyQbdikB1Nk", "DO2zinHIdMgms"], ypkR!: String) {
    print(`NPumGKfR` is () -> (Rune, Rune, Array<Int16>))
  }
}

// Modifiers: Absent, Parameters: Named, Super or this: Absent, Body content: VarDecl
class `S3pKlrC` {
  init(`qt`!: Array<Array<Int16>> = [[-0o673i16]]) {
    var LU0Rs75GYd = -25.172f32
  }
}

// Modifiers: Absent, Parameters: Named, Super or this: Absent, Body content: FuncDef
class ya_CalYS {
  init(Da!: String = "52jNeCjy2IDfXZAbPHq1") {
    func `DpIy`<WYIz>(cyvfUS: (Unit, (((Unit, Array<Range<UInt32>>, Array<Rune>, Range<UInt64>), Rune, Range<Int32>) -> Unit, (UInt8, Range<Int8>), String))) {
      return r'h'
    }
  }
}

// Modifiers: Absent, Parameters: Named, Super or this: Absent, Body content: Full
class d {
  init(WDR8FC8Rx!: Float32, `Y5I`!: Float16) {
    if (113.132f32 >= WDR8FC8Rx) {
      0xb9caau32..0b11100100100110001011u32:54
    } else {
      28908u32..0b10000111100111110000u32:37
    }
    func ukVgOg_Q() {}
    var B4u3uxmT9 = {`XTQM8mvM`: Range<UInt8> => return -0o33177i32}
  }
}

// Modifiers: Absent, Parameters: Named, Super or this: Super, Body content: Empty
open class Ybkn {
  init(J6yG2: Float16, nqtLQ8qMU: Rune, j: Float16) {}
}
class nwG <: Ybkn {
  init(`ZW`!: ((Float64, Bool) -> Range<UInt64>, Range<Int16>, (Rune, ((Float32, Bool, Rune, Unit)) -> (UInt16, String) -> (Float32, Unit, UInt16, Int16), UInt32), String), `y`!: UInt16) {
    super(29.130e77f16, r'b', -33.206f16)
  }
}

// Modifiers: Absent, Parameters: Named, Super or this: Super, Body content: Expr
open class TxYEp {
  init(ZD: Float16, bfoOJ0gsv: Float32, `HLsP`: Float16) {}
}
class iMDve0aY7 <: TxYEp {
  init(`kAr4jzDCKQ`!: () -> Unit, NKKz!: Range<UInt64>) {
    super(110.105e-118f16, 63.17e-95f32, -106.34e-15f16)
    print(`kAr4jzDCKQ` is Rune)
  }
}

// Modifiers: Absent, Parameters: Named, Super or this: Super, Body content: VarDecl
open class NzUZAu2sT {
  init(`r2Nle`: Bool, dWYv: () -> Range<UInt8>) {}
}
class `GeymdnmafD` <: NzUZAu2sT {
  init(`i97`!: Array<Unit>, gcq!: Array<Range<Int8>> = [-118i8..0x19i8:47, -0x7i8..=-0o134i8:42, -0x4ai8..112i8:16, 119i8..48i8:74, -0x2ei8..=0b1001010i8:100]) {
    super(false, { => return 0o13u8..=0o23u8:90})
    var IMm3z = "K"
  }
}

// Modifiers: Absent, Parameters: Named, Super or this: Super, Body content: FuncDef
open class `mz` {
  init(SJUNXpHa_: Int16, Yl: Range<UInt64>, c2Z: Range<Int8>) {}
}
class mqqKxOj <: `mz` {
  init(gmsa!: UInt32 = 0o1412643u32, `rHc`!: Range<UInt64> = 30969u64..0o2152116u64:78) {
    super(-260i16, 0o1106350u64..0o1742735u64:52, 0b1011101i8..-0o76i8:12)
    func mWq9c<`OZttqt`>(`ALEp`: Float32, `ApFcf7`: String, uoF: Rune) {
      return 0b1000010110u16
    }
  }
}

// Modifiers: Absent, Parameters: Named, Super or this: Super, Body content: Full
open class zbJZ1h2 {
  init(`DtfW6un`: String) {}
}
class `SDY1` <: zbJZ1h2 {
  init(`B7i06U`!: Rune = r'A') {
    super("kkqcbZd7Ceho")
    print(`B7i06U` is UInt64)
    func `IdfbFBMgN`<`GwIj`>(`vLY`: Unit, `quxSuHt`: Array<Array<Range<Int16>>>, `zGmRGl`: Unit) {
      return true
    }
    var D = [r'A', r'h', r'x', r'0', r'Y']
  }
}

// Modifiers: Absent, Parameters: Named, Super or this: This, Body content: Empty
class odfNYTUhoB {
  odfNYTUhoB(t7Lv8skXNo: Unit, `LmU6wE1WE_`: Range<Int16>) {}
  init(rYNaJj!: ((Range<Int32>, Unit), Int64, Unit)) {
    this((), -0o1214i16..-0o1656i16:69)
  }
}

// Modifiers: Absent, Parameters: Named, Super or this: This, Body content: Expr
class `YvokRiekA` {
  `YvokRiekA`() {}
  init(`mZnv`!: (Bool, (UInt16, ((Rune, Float64) -> Rune, Rune, Unit), ((Range<Int8>, Bool), String) -> Float64)), `yeYwoR7`!: Bool) {
    this()
    print(`mZnv` is Bool)
  }
}

// Modifiers: Absent, Parameters: Named, Super or this: This, Body content: VarDecl
class YeR {
  YeR(A2Zi69Nd: Unit, `h5LyPLrsR`: String, `yTk1zZRthL`: Rune) {}
  init(lj!: Int8 = 0x34i8) {
    this((), "", r'I')
    var p7 = -10.186
  }
}

// Modifiers: Absent, Parameters: Named, Super or this: This, Body content: FuncDef
class Rvcy {
  Rvcy(`Mr8it1J`: (Range<UInt32>, Int64, (() -> (Float32) -> (Unit, String, Bool, Bool), Unit, Range<Int32>, Rune)), my97Avf4: Unit, ZcX9pzh: UInt64) {}
  init(BrJ2K!: Array<Float64> = [-2.148e-48, 68.107e94, 116.80e-25], `OAqLyXzHs`!: Unit) {
    this((0b10101100100010010u32..0o1047451u32:32, 0o1002411, ({ => return {`gYh`: Float32 => return ((), "qy2", true, false)}}, (), -0o3343023i32..0x87608i32:92, r'R')), (), 0x48155u64)
    func RmpXrm5QrK<CqA8o2kk89>(`IKa5Y`: String, PExV: Unit) {
      return 0x16183u64
    }
  }
}

// Modifiers: Absent, Parameters: Named, Super or this: This, Body content: Full
class `FKaFCDNGpD` {
  `FKaFCDNGpD`() {}
  init(`KPNzFXU7`!: Float64 = -60.74, `zpIhJpeiA`!: Int32) {
    this()
    print(`zpIhJpeiA` is Rune)
    func `uggLQtEf`<EqX5ni9Dlg>(Abfy: Rune, kx: Array<((Range<UInt32>, (Array<Rune>) -> Array<Bool>) -> Range<Int32>, String, Int8, Bool)>, `ON5ZGL2`: Int32) {
      return ([true], [-10.149e-120f16, 91.89f16, -85.124e64f16], "VwAeVfBZVDyNdu875R", -112.181)
    }
    let Jw8dd8F_ = [()]
  }
}

// Modifiers: Absent, Parameters: Full, Super or this: Absent, Body content: Empty
class `khmpSAxgbb` {
  init(sJOmEoNx: (Range<UInt64>) -> Array<Unit>, `Kor9gu`: Range<UInt32>, `qsZC`!: Rune = r'n', `MuUZ5q`!: Int64 = -0b11111001100111110) {
  }
}

// Modifiers: Absent, Parameters: Full, Super or this: Absent, Body content: Expr
class QjFuLm {
  init(N: String, kkqtRAr2n: Bool, ja!: Bool = true, `bSTSCZ3`!: Bool = false) {
    print(kkqtRAr2n is ((Unit, Bool, String) -> Array<Range<Int8>>) -> Array<UInt64>)
  }
}

// Modifiers: Absent, Parameters: Full, Super or this: Absent, Body content: VarDecl
class Fx6ZpADOw {
  init(RnILlAY1: (Bool, Rune), `J8JAhd1P4`!: Range<Int16>) {
    let D = -117.141f16
  }
}

// Modifiers: Absent, Parameters: Full, Super or this: Absent, Body content: FuncDef
class `v0W` {
  init(`rxm`: Float64, RfKa: String, `vV`!: Unit = (), `zmA1rv994`!: String) {
    func `ewQZKZ7igx`<`fGIWHoLpG`>() {
      return "GKv57ZS7jeA6XQ"
    }
  }
}

// Modifiers: Absent, Parameters: Full, Super or this: Absent, Body content: Full
class `QBHluLhkKN` {
  init(`NOGNHz`: Array<Range<Int64>>, K8JH: Rune, whzMG7rT!: UInt32) {
    if (whzMG7rT > 0o761700u32) {
      "r9gZR7g0r"
    } else {
      "eqixuEi1LvPIvP"
    }
    func cqU(`Xwnhv9CfY`: Float64, Mur: Unit, beCAY9TJ: Bool) {
      return 0o136u8
    }
    var `r1` = ()
  }
}

// Modifiers: Absent, Parameters: Full, Super or this: Super, Body content: Empty
open class YPjPyRPrqx {
  init(WJtTo: Rune, WKkiaPx: Range<Int8>) {}
}
class oV <: YPjPyRPrqx {
  init(DTjZZXA: Int32, `VFcLW1oJ`: UInt64, eQiIv5Nu!: Unit = ()) {
    super(r'I', 16i8..-0o122i8:17)
  }
}

// Modifiers: Absent, Parameters: Full, Super or this: Super, Body content: Expr
open class `oKT7EjZOk7` {
  init(RmG8PK9v_: Unit, mjpfDpT: String) {}
}
class AXIomFR <: `oKT7EjZOk7` {
  init(`m5`: Unit, BtjXHO!: Array<Bool> = [false, false, true, false, true], aQqskb!: Array<Array<Int8>>) {
    super((), "DOhKgrbG")
    print(`m5` is Bool)
  }
}

// Modifiers: Absent, Parameters: Full, Super or this: Super, Body content: VarDecl
open class `rKK5v` {
  init(`lIy1mh3`: Range<UInt32>, `YJ_6`: Range<Int8>, `qcS`: Unit) {}
}
class L9zm <: `rKK5v` {
  init(j: Int8, rpnPtKMMj: Array<Unit>, `jWfFafEdpM`!: String = "ZIZ8CVn6MwYA") {
    super(0b1010001101101110u32..=969338u32:6, 99i8..=0o46i8:2, ())
    var `aN` = -0o3350217
  }
}

// Modifiers: Absent, Parameters: Full, Super or this: Super, Body content: FuncDef
open class `mY` {
  init(`o5atYGwN`: Array<Rune>, `PJZcVqMLj`: Range<Int32>) {}
}
class lYKX26g5 <: `mY` {
  init(t_o16rer: Bool, vxj: Int8, `ip9aI0SEY`!: (Range<UInt32>, String, Array<UInt64>) -> ((() -> String, (Float64, UInt64, Unit)) -> () -> Array<Range<Int16>>, UInt16) = {`TS`: Range<UInt32>, `e`: String, `RP6LwVC`: Array<UInt64> => return ({gtXVOn: () -> String, `W0cochG5Y`: (Float64, UInt64, Unit) => return { => return [-0b1011101110i16..=-0o212i16:59, -0b1010100110i16..=0b100111111i16:7, 105i16..-370i16:72, 548i16..=0x241i16:77]}}, 0b10000000u16)}) {
    super([r'y', r'7', r'V'], -0b11011000000100010100i32..-120033i32:30)
    func D9MD(y0e: Array<Unit>, sXiWnamyU5: String, `MoUeZ4ma38`: Bool) {
      return -19.207f32
    }
  }
}

// Modifiers: Absent, Parameters: Full, Super or this: Super, Body content: Full
open class RxL {
  init(BlG: Int64, zPz: Unit, `GS4x`: (Bool, Range<UInt16>) -> Float16) {}
}
class ThgSFayEW <: RxL {
  init(wsfk: String, oX5JAs: Range<UInt64>, Hg!: (String) -> ((String, Range<UInt32>, (((Unit, Range<Int16>, Rune, Int32), UInt64, Rune) -> Bool, String)) -> ((Bool, Float64, Unit, Int32), Array<Rune>), Unit) = {`qmxQjnm`: String => return ({`VokHorC`: String, `ZaVy`: Range<UInt32>, `p`: (((Unit, Range<Int16>, Rune, Int32), UInt64, Rune) -> Bool, String) => return ((true, -3.142, (), 0xa78c0i32), [r'B', r'm', r'S'])}, ())}) {
    super(166213, (), {`RPMK87`: Bool, `l`: Range<UInt16> => return -45.185e32f16})
    print(wsfk is Bool)
    func MrTLTqUVDD() {
      return "qy"
    }
    var nTQkakHs = r'T'
  }
}

// Modifiers: Absent, Parameters: Full, Super or this: This, Body content: Empty
class `x` {
  `x`() {}
  init(`Gu5z`: String, `tK`: Rune, PKku1gi2!: UInt16 = 0o1555u16, `VKzA`!: (((Float64, Array<String>), (Bool, (Rune, Unit) -> UInt16) -> Rune), Rune, (Array<Float16>, Range<Int32>)) = (((121.64, ["iMabgi7UjpLrL"]), {`a1`: Bool, dG_Hqw: (Rune, Unit) -> UInt16 => return r'P'}), r'w', ([18.66f16, 107.142f16, -84.251f16], 0b100010001111111010i32..-0b1010110111111001001i32:71))) {
    this()
  }
}

// Modifiers: Absent, Parameters: Full, Super or this: This, Body content: Expr
class `yhZvlbC9pR` {
  `yhZvlbC9pR`(`sruApP6hP`: Int32) {}
  init(`LcwrS1LUgq`: Bool, `a43akU8Fc`: (UInt64, Rune, (Array<Float16>, Float16, Unit) -> Int8) -> Range<Int32>, `Mc`!: (Rune, String, Range<Int16>, Rune), e00ZxRx7WV!: Range<UInt16> = 794u16..0o1541u16:20) {
    this(-0b1101111111111010001i32)
    print(`a43akU8Fc` is UInt8)
  }
}

// Modifiers: Absent, Parameters: Full, Super or this: This, Body content: VarDecl
class p {
  p(`FtzvvB7OWS`: (String, Bool, Range<UInt32>) -> UInt32, q: Bool) {}
  init(hXxjQU: Rune, `gdb`!: Int32, VT0Gj49T!: Int32) {
    this({ob: String, `QGAyL79Or`: Bool, aKoBi: Range<UInt32> => return 0o3303527u32}, true)
    let MdqboTluvG = { => return (928137i32, {skrF3: Int8, `JZ5CIY`: Array<UInt32> => return -82.97e44})}
  }
}

// Modifiers: Absent, Parameters: Full, Super or this: This, Body content: FuncDef
class `Gkd` {
  `Gkd`() {}
  init(`AZfi9aeY`: Range<Int16>, `HmscXXGzk`!: Int8 = -0o117i8, FDd!: UInt8) {
    this()
    func `Bx1`<`W37wZJ`>() {}
  }
}

// Modifiers: Absent, Parameters: Full, Super or this: This, Body content: Full
class `WYodc5K7tk` {
  `WYodc5K7tk`(I: Rune, `pBrN1NwXpq`: Range<UInt8>, `yUaO`: Array<(Bool, String, Unit, Rune)>) {}
  init(K: (Bool) -> (Int16, Int64, Float16) -> Bool, z!: Bool = true) {
    this(r'y', 0o314u8..0x2u8:35, [(true, "a", (), r'C'), (true, "qUrJ0pZIiJGeO6Ls", (), r'S'), (true, "n9NLzeRvKpvaY", (), r'k')])
    print(K is Range<UInt8>)
    func qYP7sx_tz() {}
    let `P` = false
  }
}

// Modifiers: Present, Parameters: Absent, Super or this: Absent, Body content: Empty
class cPib0x3T {
  protected init() {
  }
}

// Modifiers: Present, Parameters: Absent, Super or this: Absent, Body content: Expr
class ZnyxRPndPa {
  public init() {
    print(-0b110100001101011011 / -0o314343)
  }
}

// Modifiers: Present, Parameters: Absent, Super or this: Absent, Body content: VarDecl
class `HN_a` {
  protected init() {
    let `sKHdI4oX` = r'Q'
  }
}

// Modifiers: Present, Parameters: Absent, Super or this: Absent, Body content: FuncDef
class `myrjs` {
  protected init() {
    func w<iIFdP>() {
      return false
    }
  }
}

// Modifiers: Present, Parameters: Absent, Super or this: Absent, Body content: Full
class DAUflEXnz {
  public init() {
    print(-0x3459c * 337616)
    func `J9B2Ze7v`(`X80O`: (Unit, ((Bool, String, Float32, String), Float32, Float16), UInt32)) {}
    var YW = ()
  }
}

// Modifiers: Present, Parameters: Absent, Super or this: Super, Body content: Empty
open class `H74w7aOB4g` {
  init(`zvR5`: Rune) {}
}
class `t` <: `H74w7aOB4g` {
  protected init() {
    super(r'r')
  }
}

// Modifiers: Present, Parameters: Absent, Super or this: Super, Body content: Expr
open class `QwA0Dqj` {
  init(qTOOFt: Bool) {}
}
class `xe` <: `QwA0Dqj` {
  private init() {
    super(true)
    print(0x24ebc - 0b10100010001110100101)
  }
}

// Modifiers: Present, Parameters: Absent, Super or this: Super, Body content: VarDecl
open class GY3_sPAdf {
  init() {}
}
class `ohV` <: GY3_sPAdf {
  private init() {
    super()
    var `fmWDwrHa` = false
  }
}

// Modifiers: Present, Parameters: Absent, Super or this: Super, Body content: FuncDef
open class `WP4gNo36` {
  init() {}
}
class `W_65s9W` <: `WP4gNo36` {
  protected init() {
    super()
    func `GYo`<V9>() {}
  }
}

// Modifiers: Present, Parameters: Absent, Super or this: Super, Body content: Full
open class iWku {
  init(`jmNPuwTyX`: Unit) {}
}
class `TgAS` <: iWku {
  private init() {
    super(())
    print(-827783 - 0b11011101111100000100)
    func `akb_eGC`<`E9ruS6bxi`>() {
      return ("IREARA0mB", r'm')
    }
    let a = ()
  }
}

// Modifiers: Present, Parameters: Absent, Super or this: This, Body content: Empty
class pE1dSkil {
  pE1dSkil(`VB`: String) {}
  public init() {
    this("vv5")
  }
}

// Modifiers: Present, Parameters: Absent, Super or this: This, Body content: Expr
class `iQ` {
  `iQ`(vKYEs8nva7: Float64, Y: UInt32, L: ((((UInt64, Array<Float32>, Unit) -> Unit, Unit) -> Array<Float16>) -> (Array<String>) -> Int16, (Float32, ((Bool) -> Range<Int32>, (String, (Rune, Rune) -> Range<Int64>) -> Unit, String) -> Unit, Array<String>), Bool)) {}
  protected init() {
    this(-72.33, 925554u32, ({`cR3`: ((UInt64, Array<Float32>, Unit) -> Unit, Unit) -> Array<Float16> => return {vuLFskb: Array<String> => return 0b11111i16}}, (-112.224e84f32, {`fACauh`: (Bool) -> Range<Int32>, `kGH`: (String, (Rune, Rune) -> Range<Int64>) -> Unit, Nf0V701Y4: String => return ()}, ["YiNm", "ftsp7", "5gh", "4TBBroW2KGGnS"]), true))
    print(-0b11101100110001011100 - -0o1553515)
  }
}

// Modifiers: Present, Parameters: Absent, Super or this: This, Body content: VarDecl
class Voxky6n5w7 {
  Voxky6n5w7(t7Jg9M: Float16, `grQl6`: Bool) {}
  private init() {
    this(2.84e-120f16, true)
    var xDcj4 = ((), "s", false)
  }
}

// Modifiers: Present, Parameters: Absent, Super or this: This, Body content: FuncDef
class wcZ14qeoii {
  wcZ14qeoii(`rr4hFLrf`: Rune, fd: Bool, bsDU8sA: Unit) {}
  protected init() {
    this(r'c', false, ())
    func fVaskp() {
      return false
    }
  }
}

// Modifiers: Present, Parameters: Absent, Super or this: This, Body content: Full
class `M` {
  `M`(`T9`: Float64, d4d6hpRW: UInt64) {}
  protected init() {
    this(75.52, 0b1111001001000110u64)
    print(783618 / 110279)
    func ZxfQA<`S1`>(`A`: Float32, iHD: Int32, `SXHWe5Tb7`: (Array<String>, () -> Float32, Unit, Unit)) {}
    let SVaYMZ_n7c = {l: UInt32, D8KF: (Rune, Unit) => return (56.76f32, false, true)}
  }
}

// Modifiers: Present, Parameters: Unnamed, Super or this: Absent, Body content: Empty
class `biBx` {
  protected init(`HSbh`: Array<Rune>) {
  }
}

// Modifiers: Present, Parameters: Unnamed, Super or this: Absent, Body content: Expr
class `E8tHgcfU` {
  private init(fc4W8: Rune, `dXvgwfOtD`: Array<Int32>) {
    print(`dXvgwfOtD` is String)
  }
}

// Modifiers: Present, Parameters: Unnamed, Super or this: Absent, Body content: VarDecl
class Gkpzms1QyV {
  private init(phrR: Rune) {
    let xBO2 = -60.139f16
  }
}

// Modifiers: Present, Parameters: Unnamed, Super or this: Absent, Body content: FuncDef
class UqUTke {
  private init(h: Rune) {
    func M1htYdt<`uTmYL8D`>(Pu0Aw: Int64) {}
  }
}

// Modifiers: Present, Parameters: Unnamed, Super or this: Absent, Body content: Full
class `wY9pGLjEr` {
  private init(`vkW7ApYp`: Int8, vumXJh: Int8) {
    print(`vkW7ApYp` is Bool)
    func `lW`<`je`>(sOV1F: Array<(Bool, String, Bool, UInt8)>, PevFNUq: (String, Rune, String, Bool)) {
      return false
    }
    var `nDobgd3gc_` = -98.110
  }
}

// Modifiers: Present, Parameters: Unnamed, Super or this: Super, Body content: Empty
open class `av50M06M` {
  init() {}
}
class suq9O <: `av50M06M` {
  public init(LOSry: Float32, f3e8hhK95G: Array<((String, String), Unit, Unit) -> Int16>) {
    super()
  }
}

// Modifiers: Present, Parameters: Unnamed, Super or this: Super, Body content: Expr
open class `sfsfYav_x` {
  init(`pqQtYoYB`: Range<Int32>, K3h6eQrKUe: Array<Bool>, `pv0k`: UInt32) {}
}
class V57ZmzbVj <: `sfsfYav_x` {
  private init(XQPb7d: Unit) {
    super(0b10101011111001100i32..0b10111111100011001i32:78, [true, true, true, false, true], 0o245375u32)
    print(XQPb7d is Unit)
  }
}

// Modifiers: Present, Parameters: Unnamed, Super or this: Super, Body content: VarDecl
open class `S` {
  init(`ymo1`: String, `mt`: () -> Range<Int16>) {}
}
class `cHZmOr` <: `S` {
  protected init(`BkdAuv4c`: Array<String>) {
    super("AlbIq9j35FsY", { => return 244i16..=0b1010010101i16:34})
    let XOeTIC6S = {MRR8cs: (Bool, Bool, (Rune, Float64, Rune)) -> String, ZZXy: Unit, HDp6IDY: Float32 => return {Whu3hkMoGP: Float32, j: Unit => return 0xdfbe0u32..0b1011100001000011001u32:71}}
  }
}

// Modifiers: Present, Parameters: Unnamed, Super or this: Super, Body content: FuncDef
open class t3jJg4 {
  init(fchJ_eZda: Array<(Array<(String) -> Array<Bool>>) -> UInt32>) {}
}
class `zF` <: t3jJg4 {
  private init(pVlz5oO: Float32) {
    super([{uAfTW9E: Array<(String) -> Array<Bool>> => return 0o122402u32}, {FmRUu9uaIS: Array<(String) -> Array<Bool>> => return 0o2663434u32}])
    func `Cz99X`<WgsHSj0D>(T5dmJ: Rune, `y`: Rune) {}
  }
}

// Modifiers: Present, Parameters: Unnamed, Super or this: Super, Body content: Full
open class hgIL4lV5C {
  init(`IPV05_`: Float16, `a`: Unit, `GSyzPupAHY`: Rune) {}
}
class `CzcrfFmAzG` <: hgIL4lV5C {
  public init(`Z`: Int8) {
    super(37.103f16, (), r'3')
    print(`Z` is () -> Array<(String, Range<UInt8>, Array<(Range<Int32>, Unit, Range<UInt64>)>)>)
    func `LH`(`yjQ5NwdTrH`: String) {
      return 0x6fi8
    }
    var `x2Kg7` = false
  }
}

// Modifiers: Present, Parameters: Unnamed, Super or this: This, Body content: Empty
class `yvNhZ8T7uy` {
  `yvNhZ8T7uy`() {}
  protected init(`rbYD0l9l`: Bool, eJNY: Range<UInt64>) {
    this()
  }
}

// Modifiers: Present, Parameters: Unnamed, Super or this: This, Body content: Expr
class Q {
  Q(`lFyU`: ((Float64, ((Float32, String), Float64, Rune)), Float64, (Array<Unit>) -> Unit), B2XRS2J2: Float64, Fg: Unit) {}
  protected init(Nf1f3DC2in: Float16, `tb7T`: String) {
    this(((-113.74e-119, ((-7.109e-108f32, "KZbd6EbuX4wCVPrQ4H"), -111.223e-24, r'd')), -117.119, {`pyHDd_V`: Array<Unit> => return ()}), 54.147e52, ())
    print(-74.24e119f16 / Nf1f3DC2in)
  }
}

// Modifiers: Present, Parameters: Unnamed, Super or this: This, Body content: VarDecl
class `GgWCbLSHIK` {
  `GgWCbLSHIK`(Fb7IhixR: (Bool, Range<Int8>, Array<UInt16>), `GcXs8R`: Rune) {}
  protected init(Cio: Array<Float16>) {
    this((true, 69i8..=1i8:33, [377u16]), r'E')
    var `y` = ({`l`: Float16, JLFBvip: Array<Range<UInt64>>, `UY6jsk`: Unit => return {`G9uGkoGTjx`: Bool => return ((), 77.89e81f16)}}, 119u16, 0x5f8d5u64)
  }
}

// Modifiers: Present, Parameters: Unnamed, Super or this: This, Body content: FuncDef
class DjONC {
  DjONC(qNV5JI: Rune, ylmfhMTm5d: (Float32, UInt8, Rune), AogW3S5yZ: (Rune, Unit)) {}
  public init(OiVvwA: (Int16, (String, Float16, (Array<Bool>, Unit, (Range<Int32>, Rune), (Range<UInt64>, () -> String, Rune, UInt8))))) {
    this(r'u', (-68.51f32, 0b100110u8, r'y'), (r'F', ()))
    func d03xzfLIUl() {
      return r'n'
    }
  }
}

// Modifiers: Present, Parameters: Unnamed, Super or this: This, Body content: Full
class `vQir81BRmo` {
  `vQir81BRmo`(HLFgos: Int8) {}
  public init(gi7j: Array<(Bool, (UInt16, Int8, () -> Array<String>))>, `b_4ybHk9`: Rune) {
    this(-0o130i8)
    print(gi7j is Bool)
    func `i6`(jsYS6r: (Array<UInt8>) -> Bool) {}
    let `G_Hbze` = false
  }
}

// Modifiers: Present, Parameters: Named, Super or this: Absent, Body content: Empty
class F7AuFdyU {
  public init(`SjlD245`!: Range<UInt32> = 0x5d142u32..=526261u32:9) {
  }
}

// Modifiers: Present, Parameters: Named, Super or this: Absent, Body content: Expr
class W2PUwhPsl4 {
  public init(`yYWmJPRVW`!: String = "L", Sdzxf!: UInt32) {
    print(0b1110011110001010011u32 ^ Sdzxf)
  }
}

// Modifiers: Present, Parameters: Named, Super or this: Absent, Body content: VarDecl
class lge {
  public init(`IJG`!: Range<UInt8>) {
    let aVhvWUc = r'F'
  }
}

// Modifiers: Present, Parameters: Named, Super or this: Absent, Body content: FuncDef
class `dN9Gr` {
  private init(`yKuKUt`!: Array<(Float64, String, Float16, Float32)>) {
    func WQEGEuuGYy(saXUC: Bool, ivRBl: (Array<Bool>, ((Int16, String, (Bool) -> Unit) -> Float16, Unit, Unit) -> Array<Rune>, Rune) -> Int64, qhUAO: String) {
      return 0xb6604u64
    }
  }
}

// Modifiers: Present, Parameters: Named, Super or this: Absent, Body content: Full
class GH2x {
  protected init(yGiHzv!: Rune) {
    print(yGiHzv is Range<Int8>)
    func zB7FBm4(LUMriIkuSj: Bool) {
      return r'X'
    }
    var cZFMF8_ps5 = -3.249f32
  }
}

// Modifiers: Present, Parameters: Named, Super or this: Super, Body content: Empty
open class `rzdeDKY3BT` {
  init(jN__r0WE7Q: String) {}
}
class `ixytr` <: `rzdeDKY3BT` {
  private init(Y!: Bool = false) {
    super("5n75")
  }
}

// Modifiers: Present, Parameters: Named, Super or this: Super, Body content: Expr
open class `bneZ` {
  init(TuGS: Float64) {}
}
class `YW0r` <: `bneZ` {
  private init(`PVz1c`!: Bool) {
    super(-77.229e-122)
    print(`PVz1c` is Unit)
  }
}

// Modifiers: Present, Parameters: Named, Super or this: Super, Body content: VarDecl
open class Tc9F {
  init(`K4jwrg1S`: (String, String), `Imo4xiU9`: Array<Float32>, `uFQSXs`: Unit) {}
}
class `xYGFi` <: Tc9F {
  public init(`qj17v3tZ`!: Bool, uI_lGZCv7!: (Array<Array<Bool>>, Bool, Bool, (Unit) -> Unit)) {
    super(("dCad5ih6yy0AL7JieuK", "jrk6"), [70.210e114f32, 62.202e-72f32, -33.148e95f32], ())
    var `S` = r'D'
  }
}

// Modifiers: Present, Parameters: Named, Super or this: Super, Body content: FuncDef
open class `tYyi5W95` {
  init(`Mk`: () -> Array<Bool>, `c`: (Bool, (Unit, Float32, Float64, Unit), Unit, Rune), Ks: Range<UInt8>) {}
}
class `N1e30IdaRk` <: `tYyi5W95` {
  protected init(Vi_S!: Range<Int16>) {
    super({ => return [false, true, true]}, (true, ((), -56.158f32, -2.189e-36, ()), (), r'M'), 0x39u8..=253u8:91)
    func `XHWX`(`sR9p4`: Float16, U4kOCxXm: String) {}
  }
}

// Modifiers: Present, Parameters: Named, Super or this: Super, Body content: Full
open class O {
  init(`urs`: Rune, `HaIgp6`: () -> Bool, `X9s`: Range<UInt16>) {}
}
class `P` <: O {
  private init(j!: Bool) {
    super(r'L', { => return false}, 874u16..=528u16:37)
    print(j is (Rune, ((Array<Rune>, Bool), Range<UInt32>, Rune, String), String) -> String)
    func pfho(`JVtbzj`: (Bool, Float32, Bool) -> Int64, `RvwsxNhI`: () -> String, `fbXHylP`: Float32) {
      return r'k'
    }
    var `z` = true
  }
}

// Modifiers: Present, Parameters: Named, Super or this: This, Body content: Empty
class rth {
  rth() {}
  private init(WZ1uO!: (Array<Array<Bool>>) -> Bool, `ym`!: (Unit) -> Array<Unit>) {
    this()
  }
}

// Modifiers: Present, Parameters: Named, Super or this: This, Body content: Expr
class `F0JAn5` {
  `F0JAn5`(`VlZO_b50PJ`: Int32, `FeA7`: Range<Int8>, `jno`: Array<Unit>) {}
  public init(`e7gqz_77o`!: Range<UInt32> = 0o1312637u32..0xb6a0du32:77) {
    this(-0b101000011101100000i32, -0x9i8..0x3i8:95, [(), ()])
    print(`e7gqz_77o` is Range<Int64>)
  }
}

// Modifiers: Present, Parameters: Named, Super or this: This, Body content: VarDecl
class NhNZ_2iYS {
  NhNZ_2iYS(O9yNGB7v: Bool, `rQXTVJH8vA`: (Float64, Rune, Bool)) {}
  protected init(`x8Sji`!: ((Int8, Range<UInt64>)) -> UInt64) {
    this(true, (-35.30e79, r'l', false))
    let v2_ = ()
  }
}

// Modifiers: Present, Parameters: Named, Super or this: This, Body content: FuncDef
class LljIrpz3r {
  LljIrpz3r(j: String, `E4l`: Bool, jBtGxhjOuK: Range<UInt16>) {}
  protected init(NLGu8KnUh!: Unit = (), Omqy!: UInt32 = 269755u32) {
    this("ptrwYC8BfB2HjIPNXbBJ", false, 0x22u16..0x243u16:59)
    func i4T<`Fx2fBuF`>(`nYp5a4u`: Bool, `FiBuJVc6Z`: Array<Float64>) {
      return -95.60e-73f32
    }
  }
}

// Modifiers: Present, Parameters: Named, Super or this: This, Body content: Full
class dIYT {
  dIYT(`tWt`: (Unit) -> Array<Rune>, nhoy: Rune) {}
  public init(sEL!: Array<Unit> = [()]) {
    this({hv: Unit => return [r'5', r'5', r'N', r'b']}, r'L')
    print(sEL is Range<Int32>)
    func `L9XO_`<`UDR`>(`W_bhcSNU`: Unit) {}
    let H = {`uAx5DW`: Float64, `aIH`: UInt16 => return 0o2065513u32}
  }
}

// Modifiers: Present, Parameters: Full, Super or this: Absent, Body content: Empty
class `Zc` {
  public init(sY: String, `GTmL`!: (Float32, Range<Int8>)) {
  }
}

// Modifiers: Present, Parameters: Full, Super or this: Absent, Body content: Expr
class `vTmlel` {
  public init(`ztI0VVjZbW`: Range<Int8>, lUerFZ_Y7_: (Rune, Array<Float64>, String), u4Z1etin7b!: Unit = ()) {
    print(u4Z1etin7b is String)
  }
}

// Modifiers: Present, Parameters: Full, Super or this: Absent, Body content: VarDecl
class `n` {
  private init(`Ytyldp05`: Range<UInt8>, Ljg_uH!: Array<Bool>) {
    var Z3K = 25.47e61f32
  }
}

// Modifiers: Present, Parameters: Full, Super or this: Absent, Body content: FuncDef
class uht {
  public init(`jFIyT`: Bool, RA3LGzeFG: Float32, `X`!: Array<Unit> = [(), (), (), (), ()]) {
    func OLN_H<`hQ`>(`AB`: String, `lA3cht5Ap`: Unit) {}
  }
}

// Modifiers: Present, Parameters: Full, Super or this: Absent, Body content: Full
class `FOGP` {
  protected init(`J`: Range<UInt8>, B!: Unit = (), I!: Rune) {
    print(I is Range<Int32>)
    func vfjVngrShD() {
      return true
    }
    var `TPb4C` = -0b101000001i16..0b11000011i16:16
  }
}

// Modifiers: Present, Parameters: Full, Super or this: Super, Body content: Empty
open class cGhy6h {
  init(`ZW6jnC7fA`: Bool, ef: Rune, e: (Float64, Bool, (String) -> Range<Int16>, (Range<Int8>, UInt64, Float32, Unit))) {}
}
class GNXsklJ <: cGhy6h {
  public init(tOfyKX5rsI: Range<Int8>, f!: Rune = r'S', qL5K1!: Array<Rune>) {
    super(true, r'1', (9.75e-36, true, {`kDNviGgVS`: String => return 478i16..0x1di16:92}, (-0x5bi8..=34i8:48, 0x6f8cau64, 24.132f32, ())))
  }
}

// Modifiers: Present, Parameters: Full, Super or this: Super, Body content: Expr
open class NxfcRS {
  init(`d7BtdbBe6i`: Bool, yQ: String) {}
}
class `yliJR` <: NxfcRS {
  protected init(a: Array<Array<Array<Float64>>>, iPYx0_: String, cOb!: Array<((Rune, Bool) -> UInt64, Range<Int16>, Array<(String, Array<(((UInt64, (Range<Int64>, (UInt16, Bool, Unit)), Unit), Float64) -> Rune, (Range<UInt64>, Bool, Unit, UInt32), Range<UInt8>)>, Rune)>, Unit)>, `s1mGz`!: Array<Float32>) {
    super(false, "UZF6qDo3YN")
    print(iPYx0_ is Rune)
  }
}

// Modifiers: Present, Parameters: Full, Super or this: Super, Body content: VarDecl
open class xP18zE6aAK {
  init(PB3O: Unit, `m2E8cQ5TnI`: (Range<UInt8>, Int32, Unit), PAUS0IWBK7: Range<UInt64>) {}
}
class fJ6piAr <: xP18zE6aAK {
  protected init(LA5SU: Float64, `Dvdo4q`: Range<Int16>, EEndOgO1Z!: String) {
    super((), (0x8cu8..0o312u8:63, -0o503544i32, ()), 0b10111101010000011u64..26134u64:39)
    var Bv = (true, "7JR", { => return true})
  }
}

// Modifiers: Present, Parameters: Full, Super or this: Super, Body content: FuncDef
open class `IJn` {
  init(Ir3CU: Rune, lHf: String, `LMhaMYiA`: Array<Float64>) {}
}
class `cJNLkv8X` <: `IJn` {
  private init(UiBRI8_: Float32, zV: Range<Int16>, `TLWyBlJa`!: Int16 = 985i16) {
    super(r'9', "r4EwcDoCpvLh9giUz", [-38.120, -52.16e56, 11.43])
    func `Hp`<EiFt>(A: Array<Unit>, `JXRtN826`: Array<Rune>) {}
  }
}

// Modifiers: Present, Parameters: Full, Super or this: Super, Body content: Full
open class `F62XNnV` {
  init() {}
}
class RPy4DEYNM6 <: `F62XNnV` {
  protected init(Sa7sAHgYIN: Unit, cxPNBYPv: (Bool) -> (Array<(String, (String, UInt32) -> (Float32, Range<UInt8>, Unit, Float32))>, UInt8, Float64), Yq!: Unit, op02wV4ah!: String) {
    super()
    print(op02wV4ah is String)
    func `h8ZwZ9`<W>(`V39oBl7I9p`: Rune, `nQHLXOu0Gs`: String, dBi: UInt32) {
      return {cdP6_N: String, `Feacrn`: String, XWcYVy: Rune => return "mkM5Et57QChOkahb1"}
    }
    var `NFC9` = r'K'
  }
}

// Modifiers: Present, Parameters: Full, Super or this: This, Body content: Empty
class `uqf` {
  `uqf`(`EOCNSAYGcr`: Rune) {}
  public init(cdv: Rune, cvwu!: ((String, Rune) -> Bool, Bool) -> Rune) {
    this(r'Z')
  }
}

// Modifiers: Present, Parameters: Full, Super or this: This, Body content: Expr
class `oL` {
  `oL`(`cW8XGj`: Unit) {}
  public init(`x`: Float32, w1G!: (Float32, Bool, Rune), EcLS!: (Range<Int8>, Unit, Rune) -> Range<UInt64>) {
    this(())
    print(`x` * -67.128e124f32)
  }
}

// Modifiers: Present, Parameters: Full, Super or this: This, Body content: VarDecl
class `lJl` {
  `lJl`(`Ox`: ((Unit) -> Bool) -> Array<Bool>, fMT: Unit) {}
  public init(Xcfh: String, rjAO8UIH3i: Array<Range<UInt32>>, `qCKFXUjL0`!: Range<Int64>, YNobbq!: String) {
    this({`Dj`: (Unit) -> Bool => return [true, true]}, ())
    var B = "PYip58o16VOEtHhKjbW"
  }
}

// Modifiers: Present, Parameters: Full, Super or this: This, Body content: FuncDef
class b_d0 {
  b_d0(`HoUke`: Int8, kG9: (Float64, Array<String>, Int16)) {}
  public init(`EkZsZJvWGf`: String, `AsV5infX`: String, fy!: Array<(Array<String>, Array<UInt8>) -> (Bool, Unit) -> Rune>, `aj7F`!: Bool) {
    this(-0x51i8, (-110.248, ["", "g5bXQhv39h8hWeq", "WFXztXiyB", "C6Rno4OAOwqs", "9bJFR"], -0o604i16))
    func STSq<wWu9npj0l>(yZu: ((Rune, Bool, Array<((Bool, Array<String>) -> Range<UInt32>, Rune) -> Range<UInt16>>), Unit) -> Float32, `MLi`: Range<UInt64>, nqznC: Range<UInt8>) {
      return false
    }
  }
}

// Modifiers: Present, Parameters: Full, Super or this: This, Body content: Full
class k9y0 {
  k9y0() {}
  private init(bf: UInt16, Tfxg89fX!: (Range<UInt16>, String) -> Range<UInt32> = {sPTUi0L: Range<UInt16>, `BuZdR09`: String => return 0b1111000010010110011u32..=0b1000101000111000110u32:65}) {
    this()
    if (bf < 0x145u16) {
      ()
    }
    func `UA`(Fc60uH: Float16, `pXj`: String, `LVFP`: Array<Float64>) {
      return r'e'
    }
    var `zHL5` = ()
  }
}

main(){
}
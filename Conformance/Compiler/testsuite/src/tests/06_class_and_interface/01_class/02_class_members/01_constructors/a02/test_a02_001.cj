/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a02_001

  @Level:         1

  @Assertion: 6.1.2.1(2)
              The syntax of the primary constructor is as follows:
              classPrimaryInit
                : classNonStaticMemberModifier? className '(' classPrimaryInitParamLists? ')'
                  '{'
                    superCallExression?
                    ( expression
                    | variableDeclaration
                    | functionDefinition)*
                  '}'
                ;
              className
                : identifier
                ;
              classPrimaryInitParamLists
                : unnamedParameterList (',' namedParameterList)? (',' classNamedInitParamList)?
                | unnamedParameterList (',' classUnnamedInitParamList)?
                  (',' classNamedInitParamList)?
                | classUnnamedInitParamList (',' classNamedInitParamList)?
                | namedParameterList (',' classNamedInitParamList)?
                | classNamedInitParamList
                ;
              classUnnamedInitParamList
                : classUnnamedInitParam (',' classUnnamedInitParam)*
                ;
              classNamedInitParamList
                : classNamedInitParam (',' classNamedInitParam)*
                ;
              classUnnamedInitParam
                : classNonStaticMemberModifier? ('let'|'var') identifier ':' type
                ;
              classNamedInitParam
                : classNonStaticMemberModifier? ('let'|'var') identifier'!' ':' type ('=' expression)?
                ;
              classNonStaticMemberModifier
                : 'public'
                | 'protected'
                | 'private'
                ;

  @Description: Check various combinations of correct primary constructor syntax

  @Mode: compileonly

  @Negative: no

  @CompileWarning: ignore

  @Structure: single

  @Comment: Can not avoid warnings here, 
            syntax allows an unused function definition in the constructor body.
*/

// The test iterates over the following variants:
// 1. Presence or abscence of modifiers on the primary constructor
// 2. The parameter configuration:
//    a. No parameters
//    b. Ou: Ordinary unnamed parameters
//    c. OuOn: Ordinary unnamed and ordinary named parameters
//    d. On: Ordinary named parameters
//    e. OuCu: Ordinary unnamed and class unnamed parameters
//    f. OuCn: Ordinary unnamed and class named parameters
//    g. OnCn: Ordinary named and class named parameters
//    h. CuCn: Class unnamed and class named parameters
//    i. Cu: Class unnamed parameters
//    j. Cn: Class named parameters
//    k. OuCuCn: Ordinary unnamed, class unnamed and class named parameters
//    l. OuOnCn: Ordinary unnamed, ordinary named and class named parameters
// 3. Presence or abscence of super call
// 4. The constructor body configuration:
//    a. Empty body
//    b. Only an expression
//    c. Only a variable declaration
//    d. Only a function definition
//    f. Everything
// Everything else is randomized

// Modifiers: Absent, Parameters: Absent, Super call: Absent, Body content: Empty
class qcuazUVP2_ {
  qcuazUVP2_() {
  }
}

// Modifiers: Absent, Parameters: Absent, Super call: Absent, Body content: Expr
class adn {
  adn() {
    print(913423 * 0b10100011000101000100)
  }
}

// Modifiers: Absent, Parameters: Absent, Super call: Absent, Body content: VarDecl
class `gFTbnKy` {
  `gFTbnKy`() {
    var `N6bB7kv4l` = ["uG", "neRohhyLox", "nkhE"]
  }
}

// Modifiers: Absent, Parameters: Absent, Super call: Absent, Body content: FuncDef
class zqjWo1a {
  zqjWo1a() {
    func `YTeFdUuQ9`<`EO39A`>(y156y_zdI: String, `jRFZvl`: Int16) {}
  }
}

// Modifiers: Absent, Parameters: Absent, Super call: Absent, Body content: Full
class `E9KhmW4Sf` {
  `E9KhmW4Sf`() {
    print(-0o1251153 * 0o47063)
    func zr0(`p`: Unit) {}
    let p12Q = r'n'
  }
}

// Modifiers: Absent, Parameters: Absent, Super call: Present, Body content: Empty
open class `Z0Sil` {
  init(`dy9g`: Array<Bool>) {}
}
class RSDD3YTzDq <: `Z0Sil` {
  RSDD3YTzDq() {
    super([false])
  }
}

// Modifiers: Absent, Parameters: Absent, Super call: Present, Body content: Expr
open class Hsn4VUN_s {
  init(`b`: Unit, `CL`: String) {}
}
class `QnP1DBz` <: Hsn4VUN_s {
  `QnP1DBz`() {
    super((), "UaM5AU1ZAOiUcl")
    print(-447035 + 0o1634236)
  }
}

// Modifiers: Absent, Parameters: Absent, Super call: Present, Body content: VarDecl
open class `Lp6CC` {
  init() {}
}
class FuxM <: `Lp6CC` {
  FuxM() {
    super()
    var Y_9q92W = ()
  }
}

// Modifiers: Absent, Parameters: Absent, Super call: Present, Body content: FuncDef
open class `g` {
  init(`nB`: (Range<Int16>, Rune, UInt16) -> Array<Int8>) {}
}
class `ma4ZR` <: `g` {
  `ma4ZR`() {
    super({`btpxM`:Range<Int16>, vB7Sam:Rune, `tztNP`:UInt16 => return [0b100110i8, 0x74i8]})
    func `GP`<`M8`>(`XVw2VSSE3`: Bool, PZZMITiRj: Int16) {}
  }
}

// Modifiers: Absent, Parameters: Absent, Super call: Present, Body content: Full
open class `SCroav7T` {
  init(wJoN: UInt8, `RnBZ75`: Range<Int8>) {}
}
class tLAjrh <: `SCroav7T` {
  tLAjrh() {
    super(0b1010110u8, 121i8..98i8:59)
    print(0o1512473 * 0b10101110100101000)
    func `erj`<fvB0Sp>(`NKocsH`: Unit) {
      return "gisY2TNGSQNTMcqbm1sR"
    }
    let `JU5e7tK8Uu` = "o8SrXA3bwwwW6L"
  }
}

// Modifiers: Absent, Parameters: Ou, Super call: Absent, Body content: Empty
class `xSEZ_` {
  `xSEZ_`(HXT: Range<Int8>, `oADx67`: Rune) {
  }
}

// Modifiers: Absent, Parameters: Ou, Super call: Absent, Body content: Expr
class FVTInR {
  FVTInR(`r8G`: String, RAGuLU: Int32) {
    print(RAGuLU is Array<Float32>)
  }
}

// Modifiers: Absent, Parameters: Ou, Super call: Absent, Body content: VarDecl
class `nfDX` {
  `nfDX`(`ZnF7YN5rz`: Range<Int8>) {
    let ZgKI = 0b11110001u8
  }
}

// Modifiers: Absent, Parameters: Ou, Super call: Absent, Body content: FuncDef
class z40Um1 {
  z40Um1(Fyj4k: String) {
    func `UVg`(`DYN`: Range<Int8>, mp2c: String) {}
  }
}

// Modifiers: Absent, Parameters: Ou, Super call: Absent, Body content: Full
class `DpJor` {
  `DpJor`(Hi0: UInt8) {
    print(Hi0 | 0o370u8)
    func wgn(`GzhX`: Int32) {}
    let PG9Y = { => return 0o3535015i32}
  }
}

// Modifiers: Absent, Parameters: Ou, Super call: Present, Body content: Empty
open class i7 {
  init(Ixsb: Range<Int32>, `g0hJw7`: String, `mWyZUmSA`: () -> Rune) {}
}
class Rh38C7RuTM <: i7 {
  Rh38C7RuTM(`oy9`: Rune, `iu6Od8`: Rune) {
    super(-649723i32..-987132i32:20, "qSG0I01GTdRY71PipwxE", { => return r'W'})
  }
}

// Modifiers: Absent, Parameters: Ou, Super call: Present, Body content: Expr
open class VsvbuGwYb {
  init(`vkNnpi`: Int32, Bd8l4: String) {}
}
class `Rr6QvV69` <: VsvbuGwYb {
  `Rr6QvV69`(`hOpMMGj`: Array<(Int64, String, String) -> Range<Int8>>) {
    super(0x4a6bbi32, "XHHqXlhd6ro7cRHUxR0Q")
    print(`hOpMMGj` is Float64)
  }
}

// Modifiers: Absent, Parameters: Ou, Super call: Present, Body content: VarDecl
open class `DSJ6` {
  init(y: Rune) {}
}
class `DCsCnC3` <: `DSJ6` {
  `DCsCnC3`(`n_`: Float32) {
    super(r'O')
    let `p2mHpr` = true
  }
}

// Modifiers: Absent, Parameters: Ou, Super call: Present, Body content: FuncDef
open class oFC5t4Z {
  init(`K`: String) {}
}
class eg6M <: oFC5t4Z {
  eg6M(e11Q8c: Range<UInt64>, `nDWmMLNt`: Rune) {
    super("AmAj2DiE39")
    func lXNnfKtV(`vgi`: Bool) {
      return true
    }
  }
}

// Modifiers: Absent, Parameters: Ou, Super call: Present, Body content: Full
open class vMgXib0yZ {
  init(vgImTOpyE: (Unit, String, Rune), `dq3Wf3jTv`: Unit) {}
}
class `Jfcd` <: vMgXib0yZ {
  `Jfcd`(`RAte`: (Rune, String) -> (Rune) -> Rune, `FNMThykzi`: String) {
    super(((), "ppNtpeCPbPQYllt", r'g'), ())
    print(`FNMThykzi` is UInt16)
    func gXnW5FOw() {
      return r'9'
    }
    var `Kn0lCV` = 0o241u16
  }
}

// Modifiers: Absent, Parameters: OuOn, Super call: Absent, Body content: Empty
class hC8ZX3w1 {
  hC8ZX3w1(Skx: (Bool, (Int64, String, Range<UInt16>)) -> UInt32, `DEjxmlO8O`: Unit, dgLae!: Float64) {
  }
}

// Modifiers: Absent, Parameters: OuOn, Super call: Absent, Body content: Expr
class `nFw5G` {
  `nFw5G`(`vyA3U`: (String, Unit), RIdxC: () -> (Range<Int64>, Float16, String) -> Int64, D1!: Range<Int64> = 0o760406..-0x290b7:3) {
    print(RIdxC is Range<UInt64>)
  }
}

// Modifiers: Absent, Parameters: OuOn, Super call: Absent, Body content: VarDecl
class lYO {
  lYO(`dLf`: Array<(Unit, Range<Int32>)>, `UIEr_S`: ((Array<Array<Float64>>, Array<(Range<UInt16>, UInt8, Array<Float16>, String)>)) -> Float64, N_!: Array<(Array<Float64>, Range<Int16>)> = [([116.251e-88, -24.73, -109.123e-121, 107.215], 57i16..367i16:33), ([-40.125, -6.160e-85, -7.151e36], 0o1266i16..-0o1462i16:54), ([26.121e46, -56.118e-35], 957i16..0x7ai16:66), ([76.225, -23.230e-62, -99.171], 0o165i16..=-0o77i16:48)], `kFc4v3`!: Array<(Range<UInt16>, Int64, Bool) -> Int64> = [{`Va`: Range<UInt16>, qmGjPc: Int64, CcrU: Bool => return 0xdd4e5}, {`zRIh6v6W8m`: Range<UInt16>, nKjk: Int64, AW: Bool => return -0o2106574}, {n: Range<UInt16>, `U`: Int64, nWZm2e8E: Bool => return 0b111011100010000111}, {`qqOgP`: Range<UInt16>, `SOk_12TwKq`: Int64, b0NGJR: Bool => return -0o3440605}]) {
    var `CDAaMI3Jp` = [r'E', r'G', r'H']
  }
}

// Modifiers: Absent, Parameters: OuOn, Super call: Absent, Body content: FuncDef
class Je {
  Je(eNMPUrQ: Unit, Vy_D7T!: Float32, `jhoqy8m6lG`!: Array<Rune> = [r'd', r'R', r'q', r'5']) {
    func `SpOCn`<`ygaLt`>() {
      return 0x2c0u16
    }
  }
}

// Modifiers: Absent, Parameters: OuOn, Super call: Absent, Body content: Full
class `d4a5yF` {
  `d4a5yF`(bvVAI4: Int32, `ka`: Array<Bool>, `shw`!: (Unit, Unit) -> (Int64, String, Int64, Bool) = {`cIP7clK`:Unit, `Fjx8HqiuW`:Unit => return (0, "mogefruwbZJkJ", 0o0, false)}, `ZlsNO`!: UInt8 = 175u8) {
    print(0b11011001u8 * `ZlsNO`)
    func `OGHhsLGF`(sshS1: Range<Int64>, `qHCjbqcrjF`: () -> Unit) {}
    let `LV` = ()
  }
}

// Modifiers: Absent, Parameters: OuOn, Super call: Present, Body content: Empty
open class `jXAJ` {
  init(wA4Y: Unit, `qAmtmnvdpB`: Unit) {}
}
class `EZnh_` <: `jXAJ` {
  `EZnh_`(`H6QM`: (Rune, Range<UInt8>) -> (String, Float16, Rune, Unit), `gHg6gk`!: Int64, `WvyxxlK`!: (String, Bool, Range<UInt16>) = ("TjgZropq0tlU4r", true, 0o1600u16..0b100110000u16:100)) {
    super((), ())
  }
}

// Modifiers: Absent, Parameters: OuOn, Super call: Present, Body content: Expr
open class `hCj5OuYpW` {
  init(`ElB1`: Rune, `bkzwRTrddZ`: () -> Range<UInt16>, NejdB: String) {}
}
class elCQRCRkLG <: `hCj5OuYpW` {
  elCQRCRkLG(`CdMbCOnl`: Bool, lu: Range<Int16>, Q!: Array<Rune>, HPgP7hX!: Rune) {
    super(r'0', { => return 619u16..616u16:14}, "6Qaf")
    print(HPgP7hX is String)
  }
}

// Modifiers: Absent, Parameters: OuOn, Super call: Present, Body content: VarDecl
open class `aMA` {
  init() {}
}
class A <: `aMA` {
  A(`daVZAHHgG4`: Array<Range<UInt32>>, `nYjd3`!: (Rune, Bool)) {
    super()
    var `Hcnw` = [r'c', r'Y', r't', r't']
  }
}

// Modifiers: Absent, Parameters: OuOn, Super call: Present, Body content: FuncDef
open class `bKUZX` {
  init(`hDJhNr`: (Range<Int32>, Unit, Bool) -> Range<UInt16>) {}
}
class Up <: `bKUZX` {
  Up(buzsk: Float32, Ccz3FRBY!: Range<UInt64>) {
    super({`EGKMw1O`:Range<Int32>, `EXtFW87`:Unit, `XM`:Bool => return 0x55u16..0b1001111010u16:41})
    func `TaPWl5u`<`npxfEYxmn`>(`F2Z0o`: ((Int32, Int64, Float16, Array<Array<Unit>>), Bool, Array<Array<Array<Int16>>>) -> Float64, `GV`: Array<(Unit, Array<Array<(Range<UInt32>, Bool)>>) -> Int64>) {
      return r'1'
    }
  }
}

// Modifiers: Absent, Parameters: OuOn, Super call: Present, Body content: Full
open class `CX3a6CkKqf` {
  init() {}
}
class `IEXlv6h_` <: `CX3a6CkKqf` {
  `IEXlv6h_`(sEgPZePEP: String, MI9f6V: Range<Int16>, L4Oj5Xv!: Unit, `BgmK`!: Array<Unit> = [(), (), (), ()]) {
    super()
    print(L4Oj5Xv is Bool)
    func WtyLhsOH() {
      return ()
    }
    let oGH0idyLcY = ((), -0b100111100i16, "tlsZ", [(), (), ()])
  }
}

// Modifiers: Absent, Parameters: On, Super call: Absent, Body content: Empty
class JG {
  JG(`o2tK0`!: Range<UInt8> = 0o273u8..235u8:44) {
  }
}

// Modifiers: Absent, Parameters: On, Super call: Absent, Body content: Expr
class `KWyrhSyRU` {
  `KWyrhSyRU`(`bv`!: Int8, R0bv!: Array<Float32>) {
    print(-63i8 * `bv`)
  }
}

// Modifiers: Absent, Parameters: On, Super call: Absent, Body content: VarDecl
class PBi69BaS {
  PBi69BaS(`TU_QLzkUi`!: Bool) {
    let `ae2YVVKXGY` = ("XYe3SCNGvsMNUu", 84.64e76f16)
  }
}

// Modifiers: Absent, Parameters: On, Super call: Absent, Body content: FuncDef
class b {
  b(`Z_DQ`!: Array<Rune> = [r'w']) {
    func VtKTgJJ<zu>() {}
  }
}

// Modifiers: Absent, Parameters: On, Super call: Absent, Body content: Full
class `fZIArJSRVT` {
  `fZIArJSRVT`(`qL`!: (Unit, (String, Unit) -> Int64, () -> Rune, Rune) = ((), {C:String, RrGo:Unit => return 0x0}, { => return r'M'}, r'd')) {
    print(`qL` is Int32)
    func `jYi4e878`<HSz8>() {}
    var `K` = [(), (), (), ()]
  }
}

// Modifiers: Absent, Parameters: On, Super call: Present, Body content: Empty
open class Xby3W3KyI {
  init(st: Range<UInt16>, `djz7b7O`: Rune) {}
}
class zFefzpwX <: Xby3W3KyI {
  zFefzpwX(P6Qr8UPsW!: Unit = ()) {
    super(0x362u16..0b1101100011u16:10, r'Z')
  }
}

// Modifiers: Absent, Parameters: On, Super call: Present, Body content: Expr
open class `MBI2Dsg6` {
  init(`a2NeII_`: Array<Range<Int64>>) {}
}
class `W4GkT3` <: `MBI2Dsg6` {
  `W4GkT3`(RMF!: Range<Int32>) {
    super([-0x83c91..=0o3470601:5, -0b10011000001101101..=-0o1407035:74])
    print(RMF is Rune)
  }
}

// Modifiers: Absent, Parameters: On, Super call: Present, Body content: VarDecl
open class `C1d6Du` {
  init() {}
}
class T0xeklZ <: `C1d6Du` {
  T0xeklZ(m_B!: String, j!: Int64 = 886536) {
    super()
    var `foz` = 470u16
  }
}

// Modifiers: Absent, Parameters: On, Super call: Present, Body content: FuncDef
open class `y0` {
  init(L: Array<UInt16>) {}
}
class xtv6Z <: `y0` {
  xtv6Z(yLMi2ezTES!: () -> Float64 = { => return 6.70}) {
    super([0o1057u16, 0b1110101010u16, 0xacu16])
    func sBEKAIi(`KV4qyV`: () -> Unit) {}
  }
}

// Modifiers: Absent, Parameters: On, Super call: Present, Body content: Full
open class `InmXUXGZ` {
  init(jTx8zN: () -> (Unit, UInt16, Array<Array<Range<Int64>>>, Int64), i: ((Int64, Int32, Array<Float16>, Float64), Float64), `yBrk`: Unit) {}
}
class uKm <: `InmXUXGZ` {
  uKm(`Smes0O`!: (Float16, Unit) -> (String, Int64, Rune) -> Range<UInt64>) {
    super({ => return ((), 0o767u16, [[-0o3516126..=-0o1531137:28, -880148..-0o2114642:30, -0x1a5d4..=0x7027b:49, -170898..=0x51eb0:81], [-781448..=-0b111000111010011001:33, -0x366df..=-0xd2521:86, -0o1073733..-753209:68], [0b101001000001101000..=0o3543777:99, 0b110110010011101010..344429:77, -412756..=903857:45, 868380..237972:29], [-0o1621066..=-0x5e21f:68, 563394..=-186106:18, 35913..=0b1101100100010101000:54, -771994..=0o2705416:6, 0b11010011011110011..=470293:35], [0x71b69..=-0b11000001110011110000:68, -351312..=-0b11101001010010:26, 0b100011101010100100..-0o2662370:63]], 572616)}, ((0x0, 0x15f42i32, [-112.114f16], -29.111), -37.86), ())
    print(`Smes0O` is ((Int64, Array<Array<Array<((Array<Unit>, UInt32) -> Array<UInt16>, Array<Float32>, String)>>>), Range<Int16>, (String, Int64, Int8) -> Bool))
    func kQ<`k3tIJ`>() {
      return false
    }
    let PCtKge63VN = ()
  }
}

// Modifiers: Absent, Parameters: OuCu, Super call: Absent, Body content: Empty
class dgDKGRqg {
  dgDKGRqg(`Gaz`: Rune, private var `ZSN`: (Bool, (Array<Rune>, UInt64), Array<String>) -> (Array<(Range<Int32>, Float64, (Unit, (UInt8, Array<Rune>, String) -> Int64, Int64))>, Int64, Bool) -> Range<UInt32>, private let El0: Rune) {
  }
}

// Modifiers: Absent, Parameters: OuCu, Super call: Absent, Body content: Expr
class qTEQvp4y {
  qTEQvp4y(`Xnll`: Unit, private var `l`: Array<Range<UInt32>>, private let IW93uBHb: () -> Float64) {
    print(`l` is (String, Float32))
  }
}

// Modifiers: Absent, Parameters: OuCu, Super call: Absent, Body content: VarDecl
class `QsN85FwJ_` {
  `QsN85FwJ_`(tcq: Int32, sqXBSvZ: Bool, private var HCiTJE: (Range<UInt16>, String, Range<UInt8>, Int8)) {
    var q2 = ()
  }
}

// Modifiers: Absent, Parameters: OuCu, Super call: Absent, Body content: FuncDef
class `k` {
  `k`(OW1zGOo2: Rune, protected let `bM3X`: (Range<UInt8>, () -> Int64) -> () -> String) {
    func PIm<WIUMi>() {
      return {cXBAITLAe:(Rune) -> Unit => return ()}
    }
  }
}

// Modifiers: Absent, Parameters: OuCu, Super call: Absent, Body content: Full
class `OwIP` {
  `OwIP`(`IX4PVu`: String, `d0IfG7gll`: Rune, public var e: Array<Bool>) {
    print(`d0IfG7gll` is Unit)
    func `YJI`() {}
    let `H7` = [0o3117455u32..=0x1fd24u32:41, 0x69308u32..0o2413402u32:30, 0o146277u32..0xc7ef8u32:1, 611816u32..=0o1433365u32:58]
  }
}

// Modifiers: Absent, Parameters: OuCu, Super call: Present, Body content: Empty
open class `bc` {
  init() {}
}
class tM4ka <: `bc` {
  tM4ka(`ERf7te_CH`: (String) -> Array<String>, let `tOouuAa`: Rune, let `PNAddaQc`: Range<UInt64>) {
    super()
  }
}

// Modifiers: Absent, Parameters: OuCu, Super call: Present, Body content: Expr
open class `A1UtT_cdsU` {
  init(sO8Su: Int16, D9: Unit, ScK6E9n: Rune) {}
}
class XEdpG0Lopn <: `A1UtT_cdsU` {
  XEdpG0Lopn(`rhe`: Unit, protected var nRE: Array<String>) {
    super(0o26i16, (), r'q')
    print(nRE is Bool)
  }
}

// Modifiers: Absent, Parameters: OuCu, Super call: Present, Body content: VarDecl
open class b6 {
  init() {}
}
class `HNzJnzMdV` <: b6 {
  `HNzJnzMdV`(`ITdqZt`: (String, Unit, Unit), e: Bool, private var AaYWRc: Rune) {
    super()
    let kOTrKdb1oN = 0x5e608i32..-0o1313551i32:31
  }
}

// Modifiers: Absent, Parameters: OuCu, Super call: Present, Body content: FuncDef
open class JiNwt {
  init() {}
}
class `XZe` <: JiNwt {
  `XZe`(`DRGVfIMst`: Float32, `y0Qy7mcRRW`: Int64, protected let Lf: UInt8, public var iGhRdnr: Int8) {
    super()
    func `pyEJaBAesf`() {
      return {`seu`:Rune, `GwGxLriB`:Int64, `DY0`:(Int64) -> Range<UInt8> => return 0x8726cu64}
    }
  }
}

// Modifiers: Absent, Parameters: OuCu, Super call: Present, Body content: Full
open class `dX2lO` {
  init(`Wek5Abzmr`: Unit, MkFI7GcP0: ((Range<UInt32>, Bool, Int16), String, Array<Unit>) -> (Float32, Range<Int32>), `r`: Bool) {}
}
class `Gl2V` <: `dX2lO` {
  `Gl2V`(wUEGL: (Range<UInt16>, Range<UInt16>, Array<Bool>), HSrX: String, protected let A1njN: Rune) {
    super((), {e7TU1Trv:(Range<UInt32>, Bool, Int16), `PbQzr`:String, `TykSV`:Array<Unit> => return (-28.115f32, 663911i32..0b100011000001000110i32:24)}, false)
    print(A1njN is Range<Int64>)
    func `li4bor`() {}
    var Nb = 0o352u16..128u16:57
  }
}

// Modifiers: Absent, Parameters: OuCn, Super call: Absent, Body content: Empty
class Drn {
  Drn(A: Array<Rune>, let wcirvfm!: Array<(Bool, Float32, Int64, Rune)> = [(true, -31.152f32, -0x5c88d, r'C'), (true, 75.37e47f32, 422648, r'e'), (false, -38.71f32, -370363, r'k')], let Pj!: (Float32, Bool) -> UInt64) {
  }
}

// Modifiers: Absent, Parameters: OuCn, Super call: Absent, Body content: Expr
class `av5mRVV4v` {
  `av5mRVV4v`(UvnN: Array<Float32>, private var `UtqT1CTRVh`!: Array<Range<UInt32>>, private var `GiDfcqnRM`!: Bool = true) {
    print(`GiDfcqnRM` is UInt16)
  }
}

// Modifiers: Absent, Parameters: OuCn, Super call: Absent, Body content: VarDecl
class G_ {
  G_(`MCF1`: Unit, public var eLAbiti!: Unit) {
    var `KURoDNV` = [r'3', r'u', r'8', r'8']
  }
}

// Modifiers: Absent, Parameters: OuCn, Super call: Absent, Body content: FuncDef
class F_ {
  F_(X: Float16, private let `O9mPHx`!: String = "JgxrJ3DNADNns1") {
    func U97FNap<`Ym`>() {
      return 80.161f32
    }
  }
}

// Modifiers: Absent, Parameters: OuCn, Super call: Absent, Body content: Full
class `w8Fwbk` {
  `w8Fwbk`(GFy: Array<String>, public var `xUegZXh0`!: String = "3JMOlrHtGRnD0kxYa") {
    this.`xUegZXh0` = "rFH2B1gF"
    func `ldcIB8Rl5p`(`h__YslWOo`: Float64, clubTFW: Range<UInt16>) {
      return 0xc2u8..0x22u8:36
    }
    var `Pj8z1KNg` = 0o3526146u64
  }
}

// Modifiers: Absent, Parameters: OuCn, Super call: Present, Body content: Empty
open class lnWs {
  init(`niSAWgDo`: Rune) {}
}
class `fRXEqNm` <: lnWs {
  `fRXEqNm`(ZFiphOC: Array<(String, Bool, Range<Int32>) -> Int64>, Adj: Bool, protected var vjghEa!: ((Array<String>, Bool, Range<UInt64>) -> Array<Range<UInt16>>) -> Array<Bool> = {`nZ`:(Array<String>, Bool, Range<UInt64>) -> Array<Range<UInt16>> => return [true, false, true, false]}, let HOJiTrtZ!: Range<Int32> = -0xfcddi32..-0x56b91i32:32) {
    super(r'9')
  }
}

// Modifiers: Absent, Parameters: OuCn, Super call: Present, Body content: Expr
open class fYTbASmJ {
  init(AyWqL: Int16, GIWhQe3ru6: Int16, `hhOOgtK`: Bool) {}
}
class peZbIOL <: fYTbASmJ {
  peZbIOL(Blszl: Rune, `VqCvg0iMW`: Int64, var `oy3YiglXb`!: Rune = r'K') {
    super(0b1001011100i16, -0x1c9i16, false)
    print(`oy3YiglXb` is String)
  }
}

// Modifiers: Absent, Parameters: OuCn, Super call: Present, Body content: VarDecl
open class K {
  init(VsEcO: (Array<Int8>, Array<Float32>, Bool), `xomT9F0wEB`: Rune, `GInu`: (Array<Bool>) -> Range<UInt8>) {}
}
class ugIKGQl80 <: K {
  ugIKGQl80(`SE`: Unit, `f4NmMT`: Int8, private let BZd!: Float16) {
    super(([-0o200i8], [14.146e-54f32], false), r'w', {QBJvEPjfCd:Array<Bool> => return 0o250u8..0o225u8:41})
    let GRG0a2IC = 761191u32..0b11010110101011u32:38
  }
}

// Modifiers: Absent, Parameters: OuCn, Super call: Present, Body content: FuncDef
open class xo {
  init() {}
}
class Z0qJIFyUo <: xo {
  Z0qJIFyUo(`Q15`: Float16, private let `iPEzs9rmKV`!: String = "") {
    super()
    func hGK<`U`>(`p51idbRC`: String) {}
  }
}

// Modifiers: Absent, Parameters: OuCn, Super call: Present, Body content: Full
open class Va0IDb {
  init(O1ZLOFD: Array<Range<Int64>>, `Pc`: Range<UInt16>, xvPkl9U: Array<Float32>) {}
}
class V_ <: Va0IDb {
  V_(`tP0_hSWVM`: Unit, private var h!: (Array<Unit>, Bool) -> (Int64, Range<Int32>, Range<UInt32>) -> Rune = {`mBr`:Array<Unit>, Knx41f5sV:Bool => return {`iZ`:Int64, g42l:Range<Int32>, qWwh:Range<UInt32> => return r'l'}}) {
    super([0b11000100001011001010..110545:82, 0b11001000100100000..0b1101000101001000100:7, -796414..=-0o3505103:95, -346860..=-639370:7, 301143..0b10000000011011000001:27], 0x96u16..0o1520u16:71, [-20.191e119f32, -10.239e-65f32, 126.126f32, -90.222e55f32, -72.100e-10f32])
    this.h = {cjrGsY3: Array<Unit>, `O7JmbjxsC`: Bool => return {`shQy2pNDVS`: Int64, d0mj: Range<Int32>, p: Range<UInt32> => return r'E'}}
    func `OFbyT6piEG`<`cWhby7BwZh`>() {
      return {FVJt:Unit, iA6q:Float16 => return false}
    }
    var M2OIZWyV = ()
  }
}

// Modifiers: Absent, Parameters: OnCn, Super call: Absent, Body content: Empty
class `zndqreggh` {
  `zndqreggh`(`WpFzz_V`!: String = "MM3LJ5em5Yq", o!: Unit = (), var `DGyI_`!: Rune = r'K', protected var F9B20T!: (Range<Int8>, Int8, Bool, String) = (0b1101101i8..-0b11010i8:74, -0x4bi8, true, "8SsZOVf5UVXde8Bx")) {
  }
}

// Modifiers: Absent, Parameters: OnCn, Super call: Absent, Body content: Expr
class `YmCnI` {
  `YmCnI`(`TBI`!: Int16 = 486i16, `Y`!: (() -> Float64) -> String = {`fkB8ehFjI`:() -> Float64 => return "Z"}, protected var EEWEw0Gn!: Range<Int32> = 0b11001110111101101101i32..-0o1420564i32:89) {
    print(0x232i16 / `TBI`)
  }
}

// Modifiers: Absent, Parameters: OnCn, Super call: Absent, Body content: VarDecl
class Rxv {
  Rxv(tjdrjKox9I!: Range<Int64> = 0b11110010111101100111..0xecd78:61, protected let dbE02L!: Rune = r'n', public let `TSOgC`!: (Rune, (Int64, String, Unit), Unit) -> UInt16 = {`SRAJ3cjH`:Rune, N_:(Int64, String, Unit), `qdtOh`:Unit => return 0b1001100000u16}) {
    var `bs9J` = false
  }
}

// Modifiers: Absent, Parameters: OnCn, Super call: Absent, Body content: FuncDef
class `YDNcC` {
  `YDNcC`(`A`!: Bool = true, `MkaDq`!: (Unit, (Int64, String, Rune) -> Range<UInt8>) -> (Int32, Rune), let ltbmG!: Int8 = -24i8) {
    func bwN2<rH>(`fLKsA`: String) {
      return [(), (), ()]
    }
  }
}

// Modifiers: Absent, Parameters: OnCn, Super call: Absent, Body content: Full
class oeP {
  oeP(tJQq!: ((Int64, UInt32), (Int64, Range<UInt32>) -> Rune), `fuZFad`!: Float16, public let UIwf!: Range<UInt16>, protected let `YOgQbK2h3`!: Bool) {
    print(`fuZFad` * -128.50f16)
    func wJRDNe<OMe1DzK>(k782XOeNI: (Float32, () -> Int64, Array<Unit>, Rune), `B`: () -> String, pyX: Float16) {
      return ()
    }
    let DRqeU = -3.87e-55f32
  }
}

// Modifiers: Absent, Parameters: OnCn, Super call: Present, Body content: Empty
open class Ce7g {
  init(`vNN`: Rune) {}
}
class Pa <: Ce7g {
  Pa(`F5U53S`!: String = "jexLv", protected let `F62wEIip`!: Bool, let `NC2MIpseX`!: (Array<Float32>, Range<Int16>)) {
    super(r'R')
  }
}

// Modifiers: Absent, Parameters: OnCn, Super call: Present, Body content: Expr
open class ABYh {
  init(iTuWWe: (Unit, Float32) -> Range<UInt8>) {}
}
class HKdE <: ABYh {
  HKdE(RwKH7L!: () -> () -> Array<Array<(Bool, Rune, Range<UInt64>)>> = { => return { => return [[(false, r'k', 0b11001100001111111011u64..=0x9956u64:48), (false, r'l', 0x7cb67u64..0xdc9e4u64:31), (true, r'A', 0o136102u64..0o2701335u64:27), (false, r'W', 0o3132437u64..=318913u64:85), (false, r'L', 0b101000101110110000u64..0b10100001001000110100u64:34)], [(true, r'o', 0o2432725u64..0o713135u64:55), (false, r'h', 960961u64..0o550713u64:65), (true, r'0', 0b10000111100100011100u64..0b1011101010010001111u64:64), (false, r'O', 401643u64..=0x6273bu64:53)], [(true, r'4', 0xe1a1fu64..0b1011100101101011001u64:26), (true, r'C', 350242u64..0b10110101100100011010u64:33), (false, r'z', 0o1504655u64..0x4b40fu64:6)], [(true, r'4', 980274u64..=329498u64:3)], [(false, r'y', 0o2366733u64..531612u64:91), (true, r'E', 962868u64..=34840u64:88)]]}}, public var `dacxVPt`!: Float32, public var `drHwZG`!: (String, Range<UInt64>, Unit) -> Range<Int8>) {
    super({N_:Unit, `WdUrS12ckf`:Float32 => return 0xb6u8..146u8:24})
    print(this.`drHwZG` is String)
  }
}

// Modifiers: Absent, Parameters: OnCn, Super call: Present, Body content: VarDecl
open class `dy` {
  init(g: Array<Range<UInt16>>) {}
}
class `bS5ye` <: `dy` {
  `bS5ye`(`qfI`!: ((Int64, Int64), (Range<Int64>, Unit)) -> String, `pCld`!: Array<Rune> = [r'B', r'2'], let `YOw1`!: Float16, var ikUQHHJ7HJ!: Rune = r'c') {
    super([0x207u16..=0x237u16:53, 0o152u16..0b10101111u16:99])
    var `ziLXLm0` = 144987u32..332398u32:4
  }
}

// Modifiers: Absent, Parameters: OnCn, Super call: Present, Body content: FuncDef
open class `t9iv` {
  init(`Ft`: String) {}
}
class EhLi8UJG <: `t9iv` {
  EhLi8UJG(`fV`!: String = "MenCklwMQNspWkU", `Y4zrupO_Pt`!: Int16 = 0x3aei16, protected var `SnWR1oV_`!: UInt64) {
    super("5")
    func `CEuot`<`jI`>(`c0Du5`: Rune, EriH: Float32) {}
  }
}

// Modifiers: Absent, Parameters: OnCn, Super call: Present, Body content: Full
open class lo89bB {
  init() {}
}
class j <: lo89bB {
  j(`RmUG`!: Int16 = -1i16, i!: (String, Bool, Rune) = ("fkTiRRNGJ", false, r't'), private var obWZe1FqQp!: UInt16 = 0b1100000111u16) {
    super()
    print(0b110110111u16 & this.obWZe1FqQp)
    func wXrtM43VzZ<`caKx`>(ggL_usTph9: (Float32, Float32, Rune), `mpmB`: Array<Float32>, Fax: (UInt16, Rune, Unit)) {}
    var `cjep` = {`n8Oj81TF87`:Int16, `i0m3Mf`:Unit => return ()}
  }
}

// Modifiers: Absent, Parameters: CuCn, Super call: Absent, Body content: Empty
class `nYBFc` {
  `nYBFc`(private let `NNMI0sK`: String, public var FKKnMOm: Bool, private let `knfn`!: Int64 = -0x9e561, protected var f!: Float32 = -35.244e-113f32) {
  }
}

// Modifiers: Absent, Parameters: CuCn, Super call: Absent, Body content: Expr
class lH {
  lH(private let `f`: Array<Bool>, public let `yxjRYK`!: String = "qObA8fkFFCoV8KwjaJr") {
    print(`f` is Bool)
  }
}

// Modifiers: Absent, Parameters: CuCn, Super call: Absent, Body content: VarDecl
class `TC` {
  `TC`(private let `UHWmwyVNnP`: String, protected var `OpLI15A8`!: Rune) {
    let CwU8TRB = [(), (), ()]
  }
}

// Modifiers: Absent, Parameters: CuCn, Super call: Absent, Body content: FuncDef
class Go {
  Go(private var `XAtTqKwOXt`: (Float32, () -> Bool, Rune) -> Rune, public let UVxTT7eCNQ: (Array<Unit>, (Array<(Float64, String, Unit, Bool)>, Bool, Rune)), var `L4`!: Bool = true) {
    func `hC5bftAg`<q0>(`LhiP`: String, `lTEb6XQBt`: Float32) {}
  }
}

// Modifiers: Absent, Parameters: CuCn, Super call: Absent, Body content: Full
class EqQsO5tc {
  EqQsO5tc(private var tG_3sEbibE: UInt8, var `MIhLWaQS1`: Array<Bool>, var `r`!: Bool = true, protected let Mh!: Unit = ()) {
    if (tG_3sEbibE < 0b10100000u8) {
      (-101.2, (true, 0b11100001000101000000i32), 0b1001110100i16)
    } else {
      (13.221e-120, (false, 0o433352i32), 0x339i16)
    }
    func `kqnP`<`EDl`>() {
      return -55.206e-50
    }
    var A = (-110.35e-88f16, 109.52f16, r'l', 0o615u16)
  }
}

// Modifiers: Absent, Parameters: CuCn, Super call: Present, Body content: Empty
open class `iOBowQ` {
  init(`Atl8Xk`: (String) -> String) {}
}
class V7E <: `iOBowQ` {
  V7E(protected var wXVnjIYMpK: Int8, var `M`!: Float32) {
    super({`cRpGtg`:String => return "HoFG"})
  }
}

// Modifiers: Absent, Parameters: CuCn, Super call: Present, Body content: Expr
open class AwtEcDK {
  init(`ATx`: Unit) {}
}
class vYCsRvY <: AwtEcDK {
  vYCsRvY(private var W: (String, Float64, Int64) -> Range<Int32>, private let Gq!: ((Range<UInt16>, Rune), Array<String>, UInt8)) {
    super(())
    print(Gq is String)
  }
}

// Modifiers: Absent, Parameters: CuCn, Super call: Present, Body content: VarDecl
open class dW3 {
  init(xWGKuIguM: Range<Int32>, xfht_Hk: Array<String>, BUgq4: String) {}
}
class RS0Y <: dW3 {
  RS0Y(var `wHMhsJQVx`: Unit, private var `leLL0fU83a`: String, private let h04QcE99qv!: Bool, private let `U5Fh_c0ID`!: Rune) {
    super(542471i32..-598293i32:27, ["TrjUtogKxQOTILzpi", "30AGSfz5LGAOwm", "2tIFtLZL4sqH1Tt"], "vXnKAggQvDKYgq8cZ")
    var `KF` = -21.169f16
  }
}

// Modifiers: Absent, Parameters: CuCn, Super call: Present, Body content: FuncDef
open class Fvb2gmMdP {
  init(aSWZqQV: Rune, WwVGYuwxH: String) {}
}
class `TBysw3T` <: Fvb2gmMdP {
  `TBysw3T`(public var `tMm`: Array<String>, protected let `HfFvis6y`: Rune, var ryw6Ri!: Array<(Array<Range<Int8>>, String) -> Bool>, protected let D5Oqbj!: Float32 = -104.4f32) {
    super(r'r', "uiuBS6Kh6veBNjBqdWc")
    func `Hs`<IZwlKGAV>(B: UInt16, a: (String, Unit, Float16, Bool)) {}
  }
}

// Modifiers: Absent, Parameters: CuCn, Super call: Present, Body content: Full
open class `C_Jrm` {
  init(`oNp3_dRsR`: Rune, `aQ`: Range<UInt8>, `GPHj0siG`: ((Range<Int64>) -> Int64, String, Bool, String)) {}
}
class U6l7M8XG_ <: `C_Jrm` {
  U6l7M8XG_(public let `BOo`: Int32, protected let `qn`!: Array<String> = ["Xrslyvf53"]) {
    super(r'S', 0b100101u8..0b11100111u8:73, ({`fctigTRn3g`:Range<Int64> => return 0x0}, "eNiYXGA3lq4", true, "fLcRTUl"))
    print(-427178i32 * `BOo`)
    func VVXP<JvcuM>(`E2I5Wqy`: Float32, `E8`: Rune) {
      return -86.33f16
    }
    let wRic4VPxCk = true
  }
}

// Modifiers: Absent, Parameters: Cu, Super call: Absent, Body content: Empty
class `nqn47zCA` {
  `nqn47zCA`(private let hk: (Bool, Array<Int64>, Float16)) {
  }
}

// Modifiers: Absent, Parameters: Cu, Super call: Absent, Body content: Expr
class `na` {
  `na`(public var `lr3n`: Float32, let isuoHHB8T: Bool) {
    print(`lr3n` is Bool)
  }
}

// Modifiers: Absent, Parameters: Cu, Super call: Absent, Body content: VarDecl
class `dE6dj` {
  `dE6dj`(let `DqiGv`: String) {
    let `Uu` = [r'r']
  }
}

// Modifiers: Absent, Parameters: Cu, Super call: Absent, Body content: FuncDef
class RQMA_ZPaF {
  RQMA_ZPaF(protected var `OQDyO0Sg`: Bool) {
    func UT3jXAIQ_(VzINzYdg8b: Array<(Array<Range<Int32>>, Bool, Int64)>, `ExvC8x0`: Array<UInt8>, B: (Range<UInt16>) -> Bool) {
      return "2NOr5fiz4cZ"
    }
  }
}

// Modifiers: Absent, Parameters: Cu, Super call: Absent, Body content: Full
class `e_` {
  `e_`(private var iDmln4: UInt16, protected var `SC`: Unit) {
    if (iDmln4 == 0b111011101u16) {
      -0x4ci16..-560i16:46
    } else {
      0x343i16..=0b1100001101i16:35
    }
    func `qzvSSY`(j0uDFk: Bool) {}
    var `pj9` = 0b10010101100110100000u64
  }
}

// Modifiers: Absent, Parameters: Cu, Super call: Present, Body content: Empty
open class `uFyYteH` {
  init(`bK2`: String) {}
}
class `T0` <: `uFyYteH` {
  `T0`(var q: Range<UInt16>) {
    super("2UgXW2gV5UhPQTM")
  }
}

// Modifiers: Absent, Parameters: Cu, Super call: Present, Body content: Expr
open class DrMp {
  init(aExv: (Unit, Array<Rune>, (Range<Int32>, Float64) -> Int64) -> Bool) {}
}
class `JtzRInE` <: DrMp {
  `JtzRInE`(private var Fv: Unit, private let `aI`: Unit) {
    super({`ZsWwkz`:Unit, bgFnYT:Array<Rune>, jH5:(Range<Int32>, Float64) -> Int64 => return false})
    print(`aI` is (String, Bool))
  }
}

// Modifiers: Absent, Parameters: Cu, Super call: Present, Body content: VarDecl
open class ghD6GxwFT {
  init(`aZSH`: Rune, `G7jTI`: Rune) {}
}
class WM1kwY1bp <: ghD6GxwFT {
  WM1kwY1bp(let O: Array<(String, UInt32)>, let u: Range<Int64>) {
    super(r'O', r'L')
    var qtiGzFQxj6 = 0o31i8..-0b1110001i8:99
  }
}

// Modifiers: Absent, Parameters: Cu, Super call: Present, Body content: FuncDef
open class `Jmt0ADAGha` {
  init() {}
}
class MgLtIjk0Yp <: `Jmt0ADAGha` {
  MgLtIjk0Yp(protected let VKvKW7Zy: Float16, protected var `BYRW2LkK`: Rune) {
    super()
    func P<dFV>(Ml6tQ49b9q: Rune) {}
  }
}

// Modifiers: Absent, Parameters: Cu, Super call: Present, Body content: Full
open class cezncAv {
  init(vxIkUhk6: Bool, eFqn: (Int32) -> Float64) {}
}
class `jxyI` <: cezncAv {
  `jxyI`(let b: Bool, protected var `sSOyH`: Rune) {
    super(true, {C7_:Int32 => return -16.207})
    print(b is Unit)
    func `RHIl2A6`<`brc`>(kP: Array<(Bool, Bool, Unit, String)>, `RYuD93e_m`: (Bool, (String, Array<Range<Int64>>, Unit) -> Bool, String, Rune), lLaof6mqgk: Unit) {}
    let kMy = ()
  }
}

// Modifiers: Absent, Parameters: Cn, Super call: Absent, Body content: Empty
class Pnfs25 {
  Pnfs25(let fvT!: Float32 = 68.233f32, protected var `fkDj`!: UInt32 = 560310u32) {
  }
}

// Modifiers: Absent, Parameters: Cn, Super call: Absent, Body content: Expr
class `eZIZJ8g` {
  `eZIZJ8g`(private var `iX`!: Array<Float64> = [12.150e62, 90.6, 56.38], protected let DsuKU!: String = "rd9l3ze7M") {
    print(DsuKU is (String, () -> Array<(Bool, String, ((Array<String>) -> Unit, Unit, Bool, Range<UInt64>), Bool)>))
  }
}

// Modifiers: Absent, Parameters: Cn, Super call: Absent, Body content: VarDecl
class JQhghuc9 {
  JQhghuc9(public var YUwtZwj4!: Array<Rune> = [r'h', r'k', r'I', r'e'], public var gVQP2E!: Unit) {
    var `F5zH` = -0x312i16..-0b111111101i16:43
  }
}

// Modifiers: Absent, Parameters: Cn, Super call: Absent, Body content: FuncDef
class CldM6t {
  CldM6t(protected var `QxH1IiN`!: Unit = (), var `u6AQR0oNb`!: Range<Int8>) {
    func SEI<PHQDNokgz>(`s11cfClcR5`: Float16, P9: Bool, `n6`: Bool) {
      return false
    }
  }
}

// Modifiers: Absent, Parameters: Cn, Super call: Absent, Body content: Full
class `XGMzfXOSM` {
  `XGMzfXOSM`(private var AwG6!: Unit) {
    print(AwG6 is (Unit, Range<Int32>, Unit) -> Int8)
    func oJ2603c_Q<`ULWVoW2c5q`>(`iwcnXW4scU`: Rune, lT: Bool, iY3Eh: () -> Array<Float32>) {}
    var `yF3iFL` = "fZUQ5KppMqucW98J"
  }
}

// Modifiers: Absent, Parameters: Cn, Super call: Present, Body content: Empty
open class p7T9C11IJ {
  init() {}
}
class `Om7zG4SJ` <: p7T9C11IJ {
  `Om7zG4SJ`(public var G!: (UInt8, String, () -> Rune), public let IV5W!: String = "2G8jhQgGAO") {
    super()
  }
}

// Modifiers: Absent, Parameters: Cn, Super call: Present, Body content: Expr
open class mxyXW {
  init(`jWrmJb`: Rune, `M_nY07Tv`: String) {}
}
class eTI <: mxyXW {
  eTI(protected var `DXCRSsLKt`!: Int64 = -0b10110001001101011, protected var I_!: Range<Int32>) {
    super(r'z', "gkGRZR1MAaevcUprg")
    this.`DXCRSsLKt` = 0b1100001100000100100
  }
}

// Modifiers: Absent, Parameters: Cn, Super call: Present, Body content: VarDecl
open class L8HPfnedL {
  init(`Nn1tgwkut`: Float64, `y87bZ`: Unit, LdS: String) {}
}
class VXuA <: L8HPfnedL {
  VXuA(public let eSRu!: Rune, protected var `t9VW4`!: Array<(Int8, UInt16) -> String>) {
    super(-76.85e-33, (), "aJFteQtIWw")
    let `EP5Jh` = "IVbsujwYbLnPxD5le2"
  }
}

// Modifiers: Absent, Parameters: Cn, Super call: Present, Body content: FuncDef
open class `W` {
  init(`Q`: Bool, CI4U: String) {}
}
class Me_4 <: `W` {
  Me_4(public var `eAYHfRjuD`!: Rune, protected var x!: ((Int64, Bool, String), Bool, Array<UInt16>) -> Int16 = {`VQIN8BhKH`:(Int64, Bool, String), `EHG8JNp8`:Bool, `st2fD2qTu`:Array<UInt16> => return -0x3d8i16}) {
    super(true, "0ZUqMT")
    func D81urqw() {}
  }
}

// Modifiers: Absent, Parameters: Cn, Super call: Present, Body content: Full
open class c1vOdL3heh {
  init(`m83`: Int64, K: Unit, `eKAz_m7`: String) {}
}
class `E78YUfg5rO` <: c1vOdL3heh {
  `E78YUfg5rO`(protected var `vkmy97dyk`!: (Unit) -> Float16 = {`M7DePzlCFv`:Unit => return -93.183e-102f16}) {
    super(-0b11010001010010111100, (), "fo8q4dQJuB")
    this.`vkmy97dyk` = {`a2`: Unit => return 54.13e8f16}
    func `KmTYaH9`(`q`: (Unit, (Bool, String)) -> Bool) {}
    var R = [("o4GAA0i15JqEIqtLG", -0o1326701i32..=0x4ad90i32:47, r'a'), ("SkxvHlGk", 0b1011010101100110000i32..960324i32:88, r'4')]
  }
}

// Modifiers: Absent, Parameters: OuCuCn, Super call: Absent, Body content: Empty
class H4WAUUf {
  H4WAUUf(FQ: (Rune, Float32) -> Unit, zts: (Bool) -> Unit, private var `B1qRoGC3Ba`: Unit, let `VUUaee59`!: Float16) {
  }
}

// Modifiers: Absent, Parameters: OuCuCn, Super call: Absent, Body content: Expr
class yUeHlsBp {
  yUeHlsBp(RrO9xs4: Unit, protected let U5F0g2: ((Int64, Array<(Float16, (Range<Int32>, (Unit) -> Unit, Int64), Array<Rune>)>, UInt32), Rune), protected var JJWHZrGxv: Bool, protected let s!: () -> () -> Rune) {
    print(s is Float16)
  }
}

// Modifiers: Absent, Parameters: OuCuCn, Super call: Absent, Body content: VarDecl
class `IC5ZuapV1` {
  `IC5ZuapV1`(`zSUfTP1kQo`: Unit, `p3`: Unit, let Sd: Unit, let `eOo`: (Int32) -> (Int64, Float32) -> Int64, private let `qDNGBrZ`!: Int8 = 55i8, let FSmu32c!: Rune) {
    var y8R9A = false
  }
}

// Modifiers: Absent, Parameters: OuCuCn, Super call: Absent, Body content: FuncDef
class F {
  F(`gEhilh_hwE`: String, `q`: Bool, private let PWmUltw: Array<Float16>, private let `aZjOf`: Range<UInt16>, let `v8RxKHp`!: (Bool, Unit, Float64, Range<Int8>) = (true, (), -14.2e-14, -0b110001i8..19i8:43)) {
    func `iShkcImSY6`<`wL8AEbtr`>(oo: Range<Int64>, qR: Bool, `UN`: (Array<Int64>) -> Float32) {}
  }
}

// Modifiers: Absent, Parameters: OuCuCn, Super call: Absent, Body content: Full
class `z9` {
  `z9`(`GdU`: UInt64, protected let gRVxOq: UInt8, protected var `FuzxmJpJ`!: String, let `alf`!: Range<UInt8>) {
    print(`GdU` ^ 0o110175u64)
    func `Q`<`G7ds4`>() {}
    let `NN608f3Zn` = true
  }
}

// Modifiers: Absent, Parameters: OuCuCn, Super call: Present, Body content: Empty
open class B17 {
  init(`dF`: Unit, `HBiqU`: (String, (UInt16, String, Range<Int32>) -> Int32, Bool)) {}
}
class yBBjty58tC <: B17 {
  yBBjty58tC(`OWr`: String, `wZd52Ne`: (String, Array<Bool>, (UInt8) -> Unit, Array<Array<Array<(Rune, (Unit, UInt64, Range<Int8>) -> ((Unit, Array<Array<Range<Int32>>>, Unit), Array<Int16>), Range<UInt16>) -> (Array<Rune>, String, String)>>>), var VsGuP: Range<UInt8>, public var `mtZCQLPq`: Bool, var kU!: Rune = r'X') {
    super((), ("u", {`W`:UInt16, `A3hwTpWLlo`:String, `cNe`:Range<Int32> => return 0b11000000011001101111i32}, false))
  }
}

// Modifiers: Absent, Parameters: OuCuCn, Super call: Present, Body content: Expr
open class Rztc {
  init(VZaHsYc0: String) {}
}
class W49SvPx6m <: Rztc {
  W49SvPx6m(`G9P64`: Int16, public let A73U9831: String, public let `NzF`: Unit, protected var RFCH6X!: String = "vJpLqPFZIUIe7NT5hi", protected var aCxv!: Float32 = 33.242f32) {
    super("r3VvcoPOz52QBSqe8s")
    if (aCxv < 36.240f32) {
      0xa25dcu32..=44522u32:77
    } else {
      0b10101001111010101010u32..0x5bf3eu32:79
    }
  }
}

// Modifiers: Absent, Parameters: OuCuCn, Super call: Present, Body content: VarDecl
open class `q6cY06NT3` {
  init() {}
}
class ZSRg5 <: `q6cY06NT3` {
  ZSRg5(PMv9jDAK: (() -> Range<Int64>, Bool, (Int64) -> Range<UInt32>), Rlxs_jeHoE: Array<Rune>, protected let APsUa: Float64, protected let y2efb7tN!: Float32) {
    super()
    var P005b = 0o714u16..0x24du16:77
  }
}

// Modifiers: Absent, Parameters: OuCuCn, Super call: Present, Body content: FuncDef
open class N {
  init(`JaGQ4RqS`: Int8, DQk8sRwmMT: UInt8) {}
}
class BkTX9t6 <: N {
  BkTX9t6(QFnfceV: UInt16, `dj`: String, protected let `LZAYEXx`: (Unit, (Rune, Bool, Rune, String), Array<Int64>) -> UInt64, public var `qc7K1qhQZ`: (Rune, UInt8, Int16), protected let PT!: Rune) {
    super(0b1100000i8, 0o161u8)
    func `b7W3_yv5`<IEeLDl9_iC>(A1FrRU: Unit, `gRfkR5`: (String, Rune), G: Range<UInt64>) {}
  }
}

// Modifiers: Absent, Parameters: OuCuCn, Super call: Present, Body content: Full
open class JBRt8WZhv {
  init(QnCNDCS: String) {}
}
class `SCtEtM` <: JBRt8WZhv {
  `SCtEtM`(`NQb6H`: Array<(Array<Rune>, Int16, Range<UInt32>)>, private var wl0e: Rune, let `v7`!: Rune = r'O', public let `LZYjeSE`!: Unit = ()) {
    super("Dl")
    print(`LZYjeSE` is String)
    func `GRgU`(`xh`: Unit, `D`: Range<UInt16>, `aZ4`: Float32) {}
    let J1w9ml = "PT"
  }
}

// Modifiers: Absent, Parameters: OuOnCn, Super call: Absent, Body content: Empty
class `CYZ` {
  `CYZ`(`XlyS`: Unit, M9NAwge: () -> Range<UInt32>, mn7vpI!: Array<Int16>, let `Dfq`!: Float64) {
  }
}

// Modifiers: Absent, Parameters: OuOnCn, Super call: Absent, Body content: Expr
class `cepNPN` {
  `cepNPN`(`Zrw416w`: UInt32, `C`!: String, ZRnUEUvAu!: (String, Array<Range<Int32>>) = ("HFyPHNy92kx", [0b11011001111011010110i32..0o2234110i32:31, 0o326372i32..=-0x9e349i32:21]), var `uJoRYMNDAH`!: ((String, Int64, Array<String>) -> Bool, Unit) -> Array<Bool>, public var Ij!: (Unit, Float32) -> Unit = {BofVgw:Unit, cK2aBtas7W:Float32 => return ()}) {
    print(`uJoRYMNDAH` is Bool)
  }
}

// Modifiers: Absent, Parameters: OuOnCn, Super call: Absent, Body content: VarDecl
class `KuWiu` {
  `KuWiu`(mM3ANjTC: Unit, `XIb_JEq`!: (() -> Bool, Int64) -> Array<Array<Rune>> = {jMQRj:() -> Bool, V_vlu:Int64 => return [[r'3', r'F'], [r'C'], [r'p']]}, `dCQut`!: Unit, public let ySLX!: Bool = false) {
    var `w_9Rr_xu` = true
  }
}

// Modifiers: Absent, Parameters: OuOnCn, Super call: Absent, Body content: FuncDef
class `bxejLLKc4F` {
  `bxejLLKc4F`(CT: (Bool, Array<Rune>, (String, Int64, Range<Int64>) -> Bool) -> Unit, vpcBp: UInt16, sQoA0gG3v!: Float16, protected var `UChW5`!: Int8 = -0o43i8, var gYro!: Int8 = 78i8) {
    func `H7xSCsu`<`oY4f4bOEEk`>(`Hl3coqO`: Array<String>, `EMJ`: UInt8, `XDAp`: (Bool, Bool, Rune, UInt8)) {}
  }
}

// Modifiers: Absent, Parameters: OuOnCn, Super call: Absent, Body content: Full
class `p8kl0B9O` {
  `p8kl0B9O`(`D`: String, Uc!: ((Range<Int64>, String, Float32, Range<Int8>), Unit, String, Float16) = ((0b100011000110111110..0x6c3df:1, "L7BLrmyjyA", -67.31e59f32, -0o162i8..-0b11100i8:73), (), "LfWKAuTFB9gqiIK", 79.108f16), public var `blZE`!: (Array<Float32>) -> (Bool, String, Int64)) {
    print(`D` is Unit)
    func tM2WHA4b5C<HaNX>(`pf8DJ`: Array<Float64>, `hf9dA2d`: Range<UInt64>, D0mutzqWU: Bool) {}
    var `dCbu_` = (true, {IIO8kMOUr:Range<UInt8>, YWZncedV:Array<Int16> => return -98879..0x5afec:86}, 0b10011101001100010011i32..0b1101000110101001000i32:31, -66.56)
  }
}

// Modifiers: Absent, Parameters: OuOnCn, Super call: Present, Body content: Empty
open class iS {
  init(`bfBg`: Rune, uG: UInt8) {}
}
class O9 <: iS {
  O9(g49au0e: Unit, `hF`: (Float64, Array<Range<UInt8>>, (Float32) -> Int64) -> Bool, `Qq2OP`!: Unit, private let kS0r56!: (Array<Int64>) -> Bool = {`ybsfRLwSU4`:Array<Int64> => return true}, private let W!: Array<String> = ["DdsHlVLWPgTGoF9ega", "fYUkKXuSxvpKG1TSiTPU", "Inlsgefh57JXtRN"]) {
    super(r'h', 0b10000100u8)
  }
}

// Modifiers: Absent, Parameters: OuOnCn, Super call: Present, Body content: Expr
open class `P076Q` {
  init(`wENSb_iG`: Float64, inAdzHaV: Array<String>) {}
}
class `itIC8` <: `P076Q` {
  `itIC8`(Mu_XW: Bool, IjSrNXPBx!: Range<Int64> = -0x6212f..-0x3bc33:68, protected let `aJx4d9wyX`!: Int32, protected var gZb!: () -> Array<Float64>) {
    super(-53.164, ["LanNYzbeYjqb", "4kYz9", "wL5", "2yEsypjaUNrGtzAt"])
    print(0o2741133i32 - `aJx4d9wyX`)
  }
}

// Modifiers: Absent, Parameters: OuOnCn, Super call: Present, Body content: VarDecl
open class `JhuInLmI` {
  init(`n14qkZooTf`: Float16) {}
}
class `qp_` <: `JhuInLmI` {
  `qp_`(yrea3y: (Range<Int64>, (Range<Int64>, String, Range<UInt16>, Rune), Array<String>), `SAzEO7Sr`!: Float16 = -16.32e-104f16, `ovHdnu`!: Float64, var W_of6!: Unit, private var R!: (UInt32, String)) {
    super(66.44f16)
    let Ga6vH3 = 12.127f16
  }
}

// Modifiers: Absent, Parameters: OuOnCn, Super call: Present, Body content: FuncDef
open class `a1` {
  init() {}
}
class jVahVJ <: `a1` {
  jVahVJ(`izEWdD`: Float32, `gkeauWly`: Array<() -> Range<Int8>>, `iE6oOsW`!: Rune, protected let `faL93fYzK0`!: Array<Range<Int64>>) {
    super()
    func zL(A: Int16, `HhvcT`: UInt32) {}
  }
}

// Modifiers: Absent, Parameters: OuOnCn, Super call: Present, Body content: Full
open class `N6` {
  init(`jd`: (Array<Int64>, Range<Int32>, Float64, Range<UInt64>)) {}
}
class V <: `N6` {
  V(Zc: Bool, `pHGU7F`!: Unit = (), U9jdSWZyE!: Range<UInt32>, private let `SAWPVaAQX`!: Int32) {
    super(([-0x2980, -0b1100101100111110111, 845411, 0xb4c20], -0b1010111010000010110i32..0x8dd26i32:95, 102.83, 387635u64..0o1105613u64:4))
    if (`SAWPVaAQX` != -0b1100011001001011001i32) {
      [["M8LhX6HGEqXuwxsUK6H", "fvBfaRLh4v4wYYMtLg"], ["B4u0IAFHLHI49Y", ""], ["SHDpLvQhGAw", "SRdNj", "Oo7"], ["S0a", "FEwG7Z", "c4lQw1AA", "cNeDVr", ""], ["R", "wV8ui2nas", "bXFj4sSfJwkN5Z"]]
    } else {
      [["UofKdWH", "gEOO0qw7eMq", "", "UmMLMlkG3wty7xUp", ""], ["F82", "3VcA", "1Rz048OI8p6iqMn0LFPJ", "MnupXFTXU", "ao7qEMgE1q4K2tpH"]]
    }
    func `n`<`IkeM03poW2`>(VpOeXfQ: UInt8) {}
    let J3iI = -0b110001000i16..-0o272i16:2
  }
}

// Modifiers: Present, Parameters: Absent, Super call: Absent, Body content: Empty
class `a` {
  public `a`() {
  }
}

// Modifiers: Present, Parameters: Absent, Super call: Absent, Body content: Expr
class `dq` {
  private `dq`() {
    print(-0x5332b / -0xec688)
  }
}

// Modifiers: Present, Parameters: Absent, Super call: Absent, Body content: VarDecl
class `gdSd` {
  protected `gdSd`() {
    let YpAOz8 = true
  }
}

// Modifiers: Present, Parameters: Absent, Super call: Absent, Body content: FuncDef
class `qlGUL_` {
  protected `qlGUL_`() {
    func rb<`UJ`>(zZv79RiD: Array<Rune>) {}
  }
}

// Modifiers: Present, Parameters: Absent, Super call: Absent, Body content: Full
class aduRh {
  public aduRh() {
    print(-930709 * 0xbf432)
    func `Po7NPt8P`() {
      return {`n1`:(Int64, Rune, Int64) => return ()}
    }
    var `D5kcAH81` = -0x77i8
  }
}

// Modifiers: Present, Parameters: Absent, Super call: Present, Body content: Empty
open class `KSVvyZjNQ` {
  init(nWQ0Xw6: Rune, `bvz`: Unit) {}
}
class `DcwPS` <: `KSVvyZjNQ` {
  public `DcwPS`() {
    super(r'J', ())
  }
}

// Modifiers: Present, Parameters: Absent, Super call: Present, Body content: Expr
open class HQyD {
  init(hH_4gkdA4: Unit, `lpjGV3`: Range<Int16>) {}
}
class `NF` <: HQyD {
  private `NF`() {
    super((), -633i16..0b101010010i16:93)
    print(-0o575473 / 185373)
  }
}

// Modifiers: Present, Parameters: Absent, Super call: Present, Body content: VarDecl
open class TG53 {
  init(f: Rune, gGOumZ: Unit, `kLqt2A`: UInt8) {}
}
class gRO <: TG53 {
  private gRO() {
    super(r'l', (), 0o24u8)
    let `kbKI43Nj` = ((0b0, 0, r'K', "bQkt20Dzrb7VlA"), "g")
  }
}

// Modifiers: Present, Parameters: Absent, Super call: Present, Body content: FuncDef
open class kaSXT {
  init(HCQ3: (Float16, (Unit, Float32, Float16), String, (Bool, Unit, Bool, Rune)), `rGu895106`: Array<Rune>, JTpeXzqz9O: Float16) {}
}
class `dGnAVHwee` <: kaSXT {
  public `dGnAVHwee`() {
    super((7.234f16, ((), 56.211f32, -126.104e-66f16), "", (false, (), false, r'e')), [r'b', r'D', r'd', r'g'], 116.125f16)
    func P5U3Zo<`wsB5W`>(acs: Range<UInt8>, `nsg`: Rune, MeOp: Array<Range<UInt32>>) {}
  }
}

// Modifiers: Present, Parameters: Absent, Super call: Present, Body content: Full
open class `orqvHBN` {
  init(`gHht`: String, qsnX7: Bool) {}
}
class AfD <: `orqvHBN` {
  public AfD() {
    super("bWCm", false)
    print(0b1010111011011001000 * 426681)
    func g<`h`>(ZPYRFpQ: Rune) {
      return ()
    }
    let nPYX = -286i16
  }
}

// Modifiers: Present, Parameters: Ou, Super call: Absent, Body content: Empty
class Qg {
  private Qg(`PfxdG`: Bool) {
  }
}

// Modifiers: Present, Parameters: Ou, Super call: Absent, Body content: Expr
class `dK3azCRC` {
  public `dK3azCRC`(`c`: String, `hpZI_goh`: () -> Float32) {
    print(`c` is Range<Int64>)
  }
}

// Modifiers: Present, Parameters: Ou, Super call: Absent, Body content: VarDecl
class `p` {
  public `p`(`gAJV4x`: UInt16, `idu7gmMtXK`: String) {
    let `kikYMlOjoi` = r'A'
  }
}

// Modifiers: Present, Parameters: Ou, Super call: Absent, Body content: FuncDef
class QmxlL6 {
  private QmxlL6(`LD_8k`: Unit, `IS_wcAot`: (Rune, (Int32) -> Bool, Unit)) {
    func Ce<ZtN>(`AwvP6CO15g`: UInt32) {}
  }
}

// Modifiers: Present, Parameters: Ou, Super call: Absent, Body content: Full
class LdW {
  protected LdW(`cv3YaMVC`: Rune) {
    print(`cv3YaMVC` is Range<UInt32>)
    func `pZES4w`<mZz9>(pcL_KbD: Float16, `tj740H`: Int16, `PEshsMXi1I`: (Float32) -> Array<Float16>) {
      return (-0x2b1i16, [348785..-0b1100111100100110001:44, 0x703a3..0o1075150:51, -204384..-0o1617714:29], {`owN9`:String, fh7ddqDz_I:Int64 => return 0xa4fc2u64..0o2406132u64:99})
    }
    let FqEHo1 = false
  }
}

// Modifiers: Present, Parameters: Ou, Super call: Present, Body content: Empty
open class qDqoyVECnj {
  init(`M`: Bool) {}
}
class djgUrb <: qDqoyVECnj {
  protected djgUrb(u: Range<Int32>) {
    super(false)
  }
}

// Modifiers: Present, Parameters: Ou, Super call: Present, Body content: Expr
open class zO92KUC1tx {
  init(`m_MLPO_`: (Bool, Rune) -> Unit, jd: Array<String>, mu8hfll_Z: Range<UInt16>) {}
}
class natVGD15jV <: zO92KUC1tx {
  protected natVGD15jV(L_: String) {
    super({Fr9OjXPaJ:Bool, `oQqnA4pgj3`:Rune => return ()}, ["l28GLGvt", "or9ZT"], 0x1b0u16..364u16:100)
    print(L_ is Array<Rune>)
  }
}

// Modifiers: Present, Parameters: Ou, Super call: Present, Body content: VarDecl
open class XzAIhq73W {
  init(`J`: Unit, YDTlcC: Range<Int8>) {}
}
class m <: XzAIhq73W {
  public m(B: Rune, du4eyA: Array<Range<UInt64>>) {
    super((), 0b1111000i8..0o137i8:60)
    var Bzx1D3T = 0b110101111101101101u64
  }
}

// Modifiers: Present, Parameters: Ou, Super call: Present, Body content: FuncDef
open class GTU1p {
  init(`r`: Rune) {}
}
class `eTCR` <: GTU1p {
  public `eTCR`(`ISJaYfc`: Bool, `x60JX4`: Unit) {
    super(r'b')
    func nVrGPdQJj6<E>(`q7WlfFS3`: (Array<Int64>, Float64, Unit, (Rune, Int64))) {}
  }
}

// Modifiers: Present, Parameters: Ou, Super call: Present, Body content: Full
open class ycaUbJeMpO {
  init(`OTl3kSoN`: String, `gqpF`: Unit, `KrVr6a17`: Unit) {}
}
class EtzZ <: ycaUbJeMpO {
  protected EtzZ(v7D9I5TU: (Array<Array<Rune>>, (Int8, Int64, Int64), Array<String>), rtHDhDb4CP: (Bool, Float32, UInt64)) {
    super("TzD4t7kUAGq0UYb", (), ())
    print(v7D9I5TU is (Rune, Range<UInt64>, Unit, String))
    func `dI`() {
      return [true]
    }
    let `KOkJ1s` = ("5Jr2EPW", [false], (false, -15.239f32))
  }
}

// Modifiers: Present, Parameters: OuOn, Super call: Absent, Body content: Empty
class `LhSOVmD4` {
  public `LhSOVmD4`(`gE`: Float64, `hFuVG`!: Range<Int8>, `adF`!: (Rune, Float32, Unit)) {
  }
}

// Modifiers: Present, Parameters: OuOn, Super call: Absent, Body content: Expr
class tNiyHGd {
  public tNiyHGd(k3T08GA3P: Array<Bool>, `vRz_0M5p`!: (Unit, Rune, Bool, (Rune, String)) = ((), r'o', false, (r'n', "WC6kb")), `bxF74DvN`!: (Array<Bool>, Unit, Unit, Array<Int64>)) {
    print(`bxF74DvN` is Unit)
  }
}

// Modifiers: Present, Parameters: OuOn, Super call: Absent, Body content: VarDecl
class `C` {
  public `C`(`E3gdAh5n`: ((Unit, Float64, Range<UInt32>, String)) -> Array<Int16>, NUukGsy!: (Float64, String) = (113.147e89, "ti97oqIphFmqNtu93"), `GW`!: Bool = true) {
    let oywlopJA = -0o103i16
  }
}

// Modifiers: Present, Parameters: OuOn, Super call: Absent, Body content: FuncDef
class `o95` {
  public `o95`(`U9`: Array<Bool>, `CVoJZLwYCr`!: Array<Unit> = [(), ()], V_E!: Array<(Rune, Float32) -> Int64>) {
    func NTJB_c<FvpXrfS>(D1nfg: UInt8, KH7SOzSn9y: (Float32, UInt32) -> UInt16, A: Rune) {
      return "Xu2jSD"
    }
  }
}

// Modifiers: Present, Parameters: OuOn, Super call: Absent, Body content: Full
class IG {
  private IG(TlS8gFBpKc: String, DhR1_mKHuK: (Unit, Unit), Xr1!: String, cuuB!: () -> (Int64, Rune) -> Int8) {
    print(TlS8gFBpKc is (Rune, (Rune, Int64), (Bool, Array<Rune>, Unit)))
    func Q9LNv_kbHV() {
      return -73.147f16
    }
    let `NP7M7nkpS9` = false
  }
}

// Modifiers: Present, Parameters: OuOn, Super call: Present, Body content: Empty
open class `WUZn` {
  init(UNwl4jM4w: Range<Int8>, x: Float64, `bfCA2B2k`: Float16) {}
}
class pbj_Ruu <: `WUZn` {
  public pbj_Ruu(`iS`: Array<Range<UInt16>>, w: Range<Int16>, WQ!: (Rune, Bool, UInt8), q!: Float64 = 117.52) {
    super(-0x31i8..89i8:66, 15.108, 127.53e46f16)
  }
}

// Modifiers: Present, Parameters: OuOn, Super call: Present, Body content: Expr
open class S {
  init() {}
}
class `cqd1wTMXZ` <: S {
  private `cqd1wTMXZ`(iu: () -> () -> Int64, WjHXRJANtF: Float64, Q8!: String) {
    super()
    if (106.34e23 == WjHXRJANtF) {
      ("", -18.172e2f32, 0b1101011111001000011i32..0b10110010010101011010i32:10, ())
    } else {
      ("z37YZrrh4QPX27pIMuxo", -48.3e51f32, 0x827b8i32..=0xefb33i32:32, ())
    }
  }
}

// Modifiers: Present, Parameters: OuOn, Super call: Present, Body content: VarDecl
open class BLgnuf {
  init(`CZ_biF`: (() -> Range<Int16>) -> Bool, M: Range<UInt64>, NpsP6N: Rune) {}
}
class cGtFf <: BLgnuf {
  public cGtFf(`Tib`: (Int8, () -> Int64), `aH7MH`: Bool, Je!: Range<Int32>) {
    super({LN0Hv:() -> Range<Int16> => return false}, 0x9ecbeu64..0xa6600u64:83, r'n')
    let `oRtFft` = ()
  }
}

// Modifiers: Present, Parameters: OuOn, Super call: Present, Body content: FuncDef
open class `chC8pP2DmL` {
  init(`s`: Float64) {}
}
class `BxC` <: `chC8pP2DmL` {
  private `BxC`(`p3Er`: Rune, `LTk`: Array<String>, `N8NoVty6gu`!: String = "oxIUQjllWQtawdf", `i`!: Rune = r'y') {
    super(-128.126)
    func oqbvWA6<bL5CHdP_e>(`hUNcZc6_TG`: (Int64, Float16, String)) {
      return ()
    }
  }
}

// Modifiers: Present, Parameters: OuOn, Super call: Present, Body content: Full
open class `fuEBk43TV` {
  init(SmKwxnL: Range<Int8>) {}
}
class `iz_Oa` <: `fuEBk43TV` {
  private `iz_Oa`(E: ((Bool) -> Unit, Float32), `SGZ_qnSXvZ`!: Int32 = 979621i32, `C`!: Array<Unit>) {
    super(0x33i8..-24i8:67)
    if (-0b11010000010111000111i32 < `SGZ_qnSXvZ`) {
      'Y'
    } else {
      'w'
    }
    func `Z6NHyRe`<JQFFb5iAPk>() {
      return true
    }
    var `WK` = "Ss2Rq"
  }
}

// Modifiers: Present, Parameters: On, Super call: Absent, Body content: Empty
class `w` {
  private `w`(`c29nzuDauA`!: (Rune, String, UInt8) -> (Unit, Range<UInt32>)) {
  }
}

// Modifiers: Present, Parameters: On, Super call: Absent, Body content: Expr
class E {
  private E(y8NT!: String = "H", `y1kSruqQ`!: Unit = ()) {
    print(`y1kSruqQ` is Unit)
  }
}

// Modifiers: Present, Parameters: On, Super call: Absent, Body content: VarDecl
class `avOdMSZPHo` {
  private `avOdMSZPHo`(cjQBjn7GPO!: (Bool, String, Range<Int32>, (String, Float32) -> Unit) = (false, "97mWlz", 0x274e3i32..351813i32:83, {mcca:String, `dubq6WUB`:Float32 => return ()}), G4!: String = "") {
    var fkyt_u8 = r'E'
  }
}

// Modifiers: Present, Parameters: On, Super call: Absent, Body content: FuncDef
class `oapk51Dv5l` {
  protected `oapk51Dv5l`(`DyiQm`!: Bool = true, Ai6F!: Unit = ()) {
    func I_<`KjOUG`>(`znHg`: Array<String>) {}
  }
}

// Modifiers: Present, Parameters: On, Super call: Absent, Body content: Full
class `Sm` {
  private `Sm`(`kv`!: ((Int64, Int64) -> Range<UInt16>, Rune, Float64, Range<Int16>)) {
    print(`kv` is Float16)
    func btzCl(WfB: (UInt16, String, Unit, Unit), `ehE0_`: Array<(String, Array<Range<UInt32>>, Int64, Bool)>) {}
    let `XSYGyl7ki` = 0o152i8..-37i8:9
  }
}

// Modifiers: Present, Parameters: On, Super call: Present, Body content: Empty
open class `t3xjI` {
  init(`m`: (Float16, UInt64, Rune, UInt64)) {}
}
class `EIt4` <: `t3xjI` {
  private `EIt4`(`qoPsBspu`!: String = "fZoiYNAQX7JV1", i8!: (Unit) -> Float32) {
    super((-38.161e7f16, 0o662540u64, r'A', 0b1100001111100101100u64))
  }
}

// Modifiers: Present, Parameters: On, Super call: Present, Body content: Expr
open class Uv9moXl_3t {
  init(`Gp9VMjU`: String, xY: Rune) {}
}
class Wzy <: Uv9moXl_3t {
  private Wzy(TJLyo9S91!: Rune, oYJaO!: (String, Float32) -> Array<Int64> = {`MtbPtUE`:String, zCb29eGV:Float32 => return [-569257, 0xdb6c4]}) {
    super("nm5EC7yEd", r'P')
    print(oYJaO is Float64)
  }
}

// Modifiers: Present, Parameters: On, Super call: Present, Body content: VarDecl
open class uYY5DgJkM {
  init(`WBbhZ_`: ((UInt64) -> Unit, String, Array<Int64>), `EX`: Float32) {}
}
class DDYeFn <: uYY5DgJkM {
  protected DDYeFn(`F6p`!: Unit, `e_O7z`!: Unit) {
    super(({nHWiRVPP:UInt64 => return ()}, "Ur1qxGV9xGVxuAzT", [-0b10010101001100000001, -0b1100111110011001100, 413575, 0x74ea9, -0b10111110100001011010]), 110.35e-40f32)
    var e6iXYP = -0x173i16..-0x1fi16:85
  }
}

// Modifiers: Present, Parameters: On, Super call: Present, Body content: FuncDef
open class `LtK` {
  init() {}
}
class Q <: `LtK` {
  protected Q(Idi!: String) {
    super()
    func `fwCsi`() {}
  }
}

// Modifiers: Present, Parameters: On, Super call: Present, Body content: Full
open class uWGdpF8E {
  init(sQjrKbGCE: String, WBm5wpvG: UInt32, `vlcjkk`: String) {}
}
class b6S <: uWGdpF8E {
  protected b6S(`DtOPw`!: Range<Int32>, oxz6aki!: Unit = ()) {
    super("tgDBMO5VwreJpHSL", 0x46a5au32, "fk922zY")
    print(`DtOPw` is String)
    func `VRxXYQf7`<zDtDWURMc>(M7: Range<Int32>, `HNurE`: Bool, `FwJsk`: Rune) {
      return false
    }
    let `pMNnk5Vlov` = "E7huX8EQ4XcCQ7"
  }
}

// Modifiers: Present, Parameters: OuCu, Super call: Absent, Body content: Empty
class ywo {
  private ywo(`y`: (Range<Int16>, (Int64, Int64, String) -> Unit, String, UInt64), var `Wztkxp`: Unit) {
  }
}

// Modifiers: Present, Parameters: OuCu, Super call: Absent, Body content: Expr
class uZmsZXkX {
  private uZmsZXkX(bVM3HNu9kw: (UInt16, Range<UInt64>, Rune), `RTI`: Bool, let `CF4fzHe`: Float64) {
    print(`RTI` is Unit)
  }
}

// Modifiers: Present, Parameters: OuCu, Super call: Absent, Body content: VarDecl
class cr {
  protected cr(`sL`: Array<Bool>, TRDxK40: Rune, private let `JVNIvtGpfg`: UInt64) {
    var `h9Mx8G56R` = { => return r'o'}
  }
}

// Modifiers: Present, Parameters: OuCu, Super call: Absent, Body content: FuncDef
class `H0Sz` {
  protected `H0Sz`(eqVO: (Range<Int8>, Float32) -> Range<Int8>, private let PwoLze: Range<Int8>, private let `GhC5rO`: Range<UInt64>) {
    func `Sf`<PMZT1>() {
      return true
    }
  }
}

// Modifiers: Present, Parameters: OuCu, Super call: Absent, Body content: Full
class ipekktzm {
  protected ipekktzm(`tJnl`: Range<Int64>, q7k82lwCoq: Range<Int64>, let fib6uPPa: () -> Range<Int64>) {
    print(fib6uPPa is (Float64, String, Float32) -> Int16)
    func VmZW<`HEU`>() {}
    var StD = [()]
  }
}

// Modifiers: Present, Parameters: OuCu, Super call: Present, Body content: Empty
open class `vIHl3` {
  init(`dZsNfcijdY`: Unit, `P`: Bool, gK8A: Range<Int32>) {}
}
class `IENz` <: `vIHl3` {
  private `IENz`(`Sar2c`: (String, Unit, Unit), public let CGfEiL2e: Rune, public let Gdn: Range<UInt16>) {
    super((), true, 0x3ffa9i32..-362718i32:65)
  }
}

// Modifiers: Present, Parameters: OuCu, Super call: Present, Body content: Expr
open class R {
  init() {}
}
class `M` <: R {
  public `M`(x: ((Range<Int64>, Bool, Int64), Range<Int32>, Array<String>, Rune), let EzhKB: Unit) {
    super()
    print(EzhKB is Rune)
  }
}

// Modifiers: Present, Parameters: OuCu, Super call: Present, Body content: VarDecl
open class `fR` {
  init(`mwBUNP5jv`: UInt16, `nDDbNo`: Range<Int8>, `I00L`: Float16) {}
}
class y <: `fR` {
  private y(`EVxANnlJC`: Rune, BdVWx5: Rune, protected let `qxn`: Float16, var s5: (String, (String, Int64, Int64, Rune), Array<Int64>, Float16)) {
    super(0b1010111010u16, -0x23i8..0o142i8:77, 28.251f16)
    let JKvrO_4wOV = "UqIsKNXQBi2vaITBx2"
  }
}

// Modifiers: Present, Parameters: OuCu, Super call: Present, Body content: FuncDef
open class `BBXkSJ` {
  init(`XG01oRK`: Unit) {}
}
class `ipeRckH` <: `BBXkSJ` {
  public `ipeRckH`(Owb3j: Unit, `T`: Array<Int8>, let `DDinI`: Range<UInt16>) {
    super(())
    func `RBkhNK1CH`<lJwJXm9U>() {
      return "FKtcrnrxzmN"
    }
  }
}

// Modifiers: Present, Parameters: OuCu, Super call: Present, Body content: Full
open class zZWJPn {
  init(ytuihVJBz: (Unit, Rune), `H5aMW6gfB`: Rune) {}
}
class GGN4e2L9I0 <: zZWJPn {
  protected GGN4e2L9I0(GQ0o: Float64, `q`: Array<(Array<Float32>, Array<Float32>, Unit)>, private let n1bBi_F: Range<UInt8>) {
    super(((), r'K'), r'X')
    print(GQ0o * -11.31e11)
    func `O1m7cNNm`() {
      return (0b10000111011011101101i32..6538i32:45, ())
    }
    var `o1MrFP` = ()
  }
}

// Modifiers: Present, Parameters: OuCn, Super call: Absent, Body content: Empty
class JkHdtZd7IQ {
  private JkHdtZd7IQ(mEU7Pka8: Bool, protected var fIB!: Unit = (), private let GmIToHv_KB!: Float16) {
  }
}

// Modifiers: Present, Parameters: OuCn, Super call: Absent, Body content: Expr
class `aKwu6PA` {
  public `aKwu6PA`(a: Bool, `k1A`: Float16, private let EREAyRMVEq!: Int64) {
    if (EREAyRMVEq == 0b111010110100111000) {
      0b1000111110001101010..=-0x5c078:97
    }
  }
}

// Modifiers: Present, Parameters: OuCn, Super call: Absent, Body content: VarDecl
class `P5Hu` {
  private `P5Hu`(e7E0N0uHX: Unit, oMEv: Rune, protected var qt!: Rune = r'z') {
    let `AH` = (0xef79f, true)
  }
}

// Modifiers: Present, Parameters: OuCn, Super call: Absent, Body content: FuncDef
class `hh7U` {
  private `hh7U`(`GfWrY`: String, IC450: Bool, protected let `P9kPqAE`!: String = "4sgjt1x2qjdgcF22T") {
    func `YEE`<TL>(`i7skgD`: Bool, vXtUH2Z: ((Bool, Unit) -> String, Float32)) {
      return "3Q6YmNBz3iSsVobSpD1"
    }
  }
}

// Modifiers: Present, Parameters: OuCn, Super call: Absent, Body content: Full
class `JIWPgQwEj` {
  protected `JIWPgQwEj`(H: Rune, private let `F3ecrxk`!: (Array<Rune>, () -> Float64, (Int64, Range<UInt32>, Float32))) {
    print(H is Array<(Int64) -> Int64>)
    func au2ue(YQ: (Array<Int8>, Rune, (String, Unit)) -> Range<Int8>) {}
    let `jsc63mK` = 495372u32
  }
}

// Modifiers: Present, Parameters: OuCn, Super call: Present, Body content: Empty
open class nXJucP2 {
  init(rG35TVvw: Int32) {}
}
class `qoVAL` <: nXJucP2 {
  public `qoVAL`(QcsAFV9: String, let HfX7C!: Range<UInt32> = 610493u32..0b10101100010011001101u32:39, protected let `mTRQxrG`!: String = "zjfEwJXlEVCun46rb8") {
    super(-416922i32)
  }
}

// Modifiers: Present, Parameters: OuCn, Super call: Present, Body content: Expr
open class lI {
  init(zX: Bool, S4euslTH: String, `q9nwOwJRk`: Rune) {}
}
class fEZ76 <: lI {
  protected fEZ76(fcyJ: (String, Float16), V_: String, public var `V2eJk`!: Bool) {
    super(false, "EdH4co", r'y')
    print(V_ is Unit)
  }
}

// Modifiers: Present, Parameters: OuCn, Super call: Present, Body content: VarDecl
open class `F_Wq0y` {
  init() {}
}
class LLfycMqtz6 <: `F_Wq0y` {
  private LLfycMqtz6(aji: Array<Range<UInt8>>, `C_ZFa`: ((Int64, Rune), Array<UInt16>, Unit), let `wcrp`!: Range<Int32> = 0b10000011000101011101i32..-0o1652257i32:99) {
    super()
    let `T8D` = 0u8
  }
}

// Modifiers: Present, Parameters: OuCn, Super call: Present, Body content: FuncDef
open class `dJW5` {
  init(VC9NiA: Range<UInt16>, `xeJr0zz`: Float16) {}
}
class `XDjT9ecZ` <: `dJW5` {
  private `XDjT9ecZ`(MzSG: Rune, cuA3PMK1: Float64, private var r!: Bool) {
    super(0b1101010000u16..0b1011000u16:96, 122.207e-84f16)
    func `e1210CeKxY`<`mGUKZiO`>(`ZFlPPu`: (Array<String>, Int8) -> Array<Int64>, G: Range<Int32>) {}
  }
}

// Modifiers: Present, Parameters: OuCn, Super call: Present, Body content: Full
open class `ao` {
  init(`L3J`: String, GG: UInt64) {}
}
class jql <: `ao` {
  public jql(`cyl2P31`: Unit, r_Doh6z: Range<UInt64>, let Nmh!: Unit) {
    super("8M6rdS7lwaJ0q1XSCB", 322771u64)
    print(Nmh is Float16)
    func `YBpbg4`() {
      return ()
    }
    let `Pke4l_ch` = ((true, 0xecu16..398u16:28, r'C'), 0xa0489i32..0o642016i32:56, r'e')
  }
}

// Modifiers: Present, Parameters: OnCn, Super call: Absent, Body content: Empty
class dF {
  private dF(dU!: Unit, protected let ZBdgN!: (Bool, () -> Int8, Range<UInt32>, Array<Bool>) = (false, { => return 0x75i8}, 0o105123u32..0o3622277u32:57, [false]), private var ERrnwV5YpQ!: Unit = ()) {
  }
}

// Modifiers: Present, Parameters: OnCn, Super call: Absent, Body content: Expr
class `r` {
  protected `r`(Q!: UInt64 = 0x6c801u64, `lP8ey`!: Range<Int8>, let `VKrT5jQO`!: Range<UInt16> = 0x2a8u16..546u16:16) {
    print(0b1100011011011001110u64 + Q)
  }
}

// Modifiers: Present, Parameters: OnCn, Super call: Absent, Body content: VarDecl
class Kdfr {
  private Kdfr(`DJiilnu`!: Rune = r'8', protected var Hc6HS!: Array<Array<Array<Float32>>>, protected var `WtlG2`!: Rune) {
    var IfjzYk = ""
  }
}

// Modifiers: Present, Parameters: OnCn, Super call: Absent, Body content: FuncDef
class `T` {
  private `T`(`uZ9IgOT`!: ((Int64) -> Array<(Unit, UInt16, Array<UInt32>)>) -> Unit = {`G7fMMn`:(Int64) -> Array<(Unit, UInt16, Array<UInt32>)> => return ()}, `u0DP_k8MJ`!: (Unit, Array<Float32>, Array<UInt64>) = ((), [38.70e-90f32, -48.18f32, -126.91f32, 26.1e-112f32, -71.141e-85f32], [463077u64, 0xd6c7eu64, 0xf288u64]), protected let `nX2bXeRvb`!: String = "WmYZzSvU65LnzWzn4x") {
    func Dd5F(`Kq`: Array<Float32>) {}
  }
}

// Modifiers: Present, Parameters: OnCn, Super call: Absent, Body content: Full
class oS0U4xYgJ {
  public oS0U4xYgJ(pRfUAyE!: UInt64 = 0b11100111101010101001u64, GU3d22eri!: (Rune, Bool), let nZNpT4!: String = "FSw", private let `C7wywH`!: Bool) {
    print(pRfUAyE * 0x5421bu64)
    func QOZbhgcp<J>(`cW1g`: Array<Range<Int64>>, tgraV5rQ3h: (Rune, String, Float64)) {
      return r'g'
    }
    var Hm = [[229415u64..0o3160527u64:81]]
  }
}

// Modifiers: Present, Parameters: OnCn, Super call: Present, Body content: Empty
open class `HF` {
  init(`NozLZoKNBX`: String, r: String, `jyGY6W`: Unit) {}
}
class EfRa <: `HF` {
  public EfRa(rsJ!: Bool, let akkqM!: Float64 = 23.1e101) {
    super("q0VLKGvWiSMVo", "t7u5FOeUI9qHezzOQ", ())
  }
}

// Modifiers: Present, Parameters: OnCn, Super call: Present, Body content: Expr
open class `zG8CTCuWk` {
  init(GDxpaI8: Bool, `EBLAQ`: Unit, Iq5glFkGsd: Rune) {}
}
class `G0r_gA` <: `zG8CTCuWk` {
  protected `G0r_gA`(`DtUfB`!: Range<Int32> = -0o2665554i32..0b1000000101010000100i32:52, public let V!: Int32 = -0xca69ai32, public let cI5ZhVO!: Range<UInt8> = 0o352u8..110u8:92) {
    super(false, (), r'e')
    print(0b1101011100000001i32 / V)
  }
}

// Modifiers: Present, Parameters: OnCn, Super call: Present, Body content: VarDecl
open class Fg4iE {
  init() {}
}
class `bh1FBUQ3A` <: Fg4iE {
  public `bh1FBUQ3A`(`zY`!: Float32, protected let B3SYeOg!: UInt32) {
    super()
    var `i` = false
  }
}

// Modifiers: Present, Parameters: OnCn, Super call: Present, Body content: FuncDef
open class `cW7` {
  init(`Yb18CdL`: UInt32, i: Rune) {}
}
class `EIE` <: `cW7` {
  protected `EIE`(RX5Mh7!: String = "GQp7tIRPS", iU!: Rune = r'f', private var Bta!: () -> Array<Int64> = { => return [0x95408, -50474, 0xcdfee, -664704]}, var `SM9wlP1Bu1`!: Bool) {
    super(719680u32, r'B')
    func FAC(`SI5j`: ((Bool, Rune, Bool)) -> Float32, `liB`: String, `GZCX5hL5`: Rune) {
      return [-0o1157701i32..=-0o666162i32:40, -0b1110001011010111111i32..=-514059i32:86, -0x25c9di32..-772949i32:20]
    }
  }
}

// Modifiers: Present, Parameters: OnCn, Super call: Present, Body content: Full
open class `Tjs7wguRz` {
  init(`cs`: ((Int64, Range<Int16>, Int64, Int64), Bool, Range<UInt16>, UInt16), `ZmERNU`: Range<Int64>, `aSQ9`: Rune) {}
}
class byhS <: `Tjs7wguRz` {
  public byhS(`IMh`!: UInt16, protected let KD1jFwx!: ((Rune, Int8), String) -> Rune = {`l_l45yLoh`:(Rune, Int8), `Z`:String => return r'8'}) {
    super(((0, -580i16..0x390i16:41, 0b0, 0x0), false, 0o502u16..0xc4u16:81, 249u16), -0b10101110011011101101..0o2427550:55, r'G')
    print(`IMh` is Float64)
    func swzgVwxsxo<GPbZBPW>(cWXNwY: Rune, `F0`: (Range<Int8>) -> (String, Unit), `SuUZPTQtAY`: UInt64) {}
    let `uE3sWha` = 7.6e-68
  }
}

// Modifiers: Present, Parameters: CuCn, Super call: Absent, Body content: Empty
class xQhKCeKi27 {
  protected xQhKCeKi27(private var c5yiC: Float64, public let UU!: Unit = ()) {
  }
}

// Modifiers: Present, Parameters: CuCn, Super call: Absent, Body content: Expr
class `eTo5` {
  public `eTo5`(private var IFFDYEh: (Unit, Array<Bool>, Unit) -> Unit, public let y2hjwoJvfd: Rune, private let D8PQ!: Range<UInt64> = 0b10011010011010101101u64..0b111011000111100100u64:74, var oZZB!: String = "jZUUIprUPMdjOo9eUX") {
    print(this.oZZB is Rune)
  }
}

// Modifiers: Present, Parameters: CuCn, Super call: Absent, Body content: VarDecl
class z0X {
  private z0X(public var `dqHsOKr`: String, public let `t`: Bool, var SDsvTmfgZX!: Range<Int32> = -0b1111110011011000101i32..824876i32:93) {
    var irlDhvX = false
  }
}

// Modifiers: Present, Parameters: CuCn, Super call: Absent, Body content: FuncDef
class `o` {
  protected `o`(private var yn: Bool, private var `qjFfIM9a2`!: Int64) {
    func mks<pe5>(Z: Rune) {}
  }
}

// Modifiers: Present, Parameters: CuCn, Super call: Absent, Body content: Full
class `pATRU1R4` {
  protected `pATRU1R4`(private var `oUNGPLTlac`: UInt8, var g2B: Array<Rune>, public let `I7yh3wr`!: Unit) {
    print(0b1101001u8 + `oUNGPLTlac`)
    func tj4hTnBRJB(TQRzSD0: Int8) {
      return [true, false, false, false]
    }
    var `ZEE` = 99.151e69f16
  }
}

// Modifiers: Present, Parameters: CuCn, Super call: Present, Body content: Empty
open class kVFwuVGB {
  init() {}
}
class `f` <: kVFwuVGB {
  private `f`(protected let tQ65wHDPS: Float64, protected let `GY`: Bool, public let yxS!: String = "lG4VlV3ritiVE", protected var `cNH8ehobk`!: Bool = true) {
    super()
  }
}

// Modifiers: Present, Parameters: CuCn, Super call: Present, Body content: Expr
open class `CgQ4T6` {
  init(nckW8Sg2: UInt64, df7EVGW: ((Int64, Unit) -> Int64, String) -> Bool, CUY4eKRVX: Int32) {}
}
class YKXhH9O <: `CgQ4T6` {
  protected YKXhH9O(var `rzS3TTK`: String, protected let `p`!: Array<String>, private var ZEsi!: Array<Bool>) {
    super(0xe2383u64, {`uwaR`:(Int64, Unit) -> Int64, `jy`:String => return false}, 0b11000011010000101000i32)
    print(`rzS3TTK` is String)
  }
}

// Modifiers: Present, Parameters: CuCn, Super call: Present, Body content: VarDecl
open class `NOt` {
  init(`nR4Px`: (Float32) -> Array<Rune>, `mx71yUv`: (Float64, String) -> Range<UInt64>, z34bxNN_: Array<Unit>) {}
}
class `Fcf` <: `NOt` {
  private `Fcf`(protected let `MlhWh4Hoy`: Float32, protected let TqKx5dj!: Range<UInt16> = 0xc1u16..0o1047u16:51, protected var `eGGvncC`!: Float16) {
    super({`CFe6tu645u`:Float32 => return [r'T', r'B']}, {`xuhqs`:Float64, EYkYgIuZGz:String => return 0b10100111011010011010u64..0o3601212u64:20}, [(), (), (), ()])
    let `S` = 4.146e112
  }
}

// Modifiers: Present, Parameters: CuCn, Super call: Present, Body content: FuncDef
open class nY61Bu9wi0 {
  init() {}
}
class `hGDo_nBiaQ` <: nY61Bu9wi0 {
  protected `hGDo_nBiaQ`(private let `ZCBkJ`: String, var `v`!: Array<Bool> = [true, true, true, false]) {
    super()
    func s<IgE3xz5ypU>(`qmJ9cs`: String, pGM: Float64) {
      return -0b101101i8..-20i8:42
    }
  }
}

// Modifiers: Present, Parameters: CuCn, Super call: Present, Body content: Full
open class pH {
  init(`lvhmM8Bru`: Float32, aQR28f: Range<Int16>) {}
}
class `wiXkoZ` <: pH {
  private `wiXkoZ`(private let `FoyS`: String, protected let `WArhXrb`: Array<(Int64) -> Int64>, private var `fm2XZA`!: (Int64, UInt16) = (-0o441165, 0o264u16)) {
    super(-24.2f32, 0o71i16..-0o1674i16:43)
    print(`WArhXrb` is Array<(Int64, Int64) -> String>)
    func `Ayx1g`<p>(`SHsqY6z`: Range<UInt32>, HanT2u: Float64, Wq: Bool) {
      return ((), ())
    }
    var `iXAv` = ["4pTW9wlbYVJujfj", "N"]
  }
}

// Modifiers: Present, Parameters: Cu, Super call: Absent, Body content: Empty
class `vydenso8q` {
  private `vydenso8q`(private let scdKr0: Range<UInt32>) {
  }
}

// Modifiers: Present, Parameters: Cu, Super call: Absent, Body content: Expr
class `WAz_Blk6` {
  public `WAz_Blk6`(var `E0`: Rune) {
    print(`E0` is (String, UInt8, Float64))
  }
}

// Modifiers: Present, Parameters: Cu, Super call: Absent, Body content: VarDecl
class `f3h2e5Yx` {
  protected `f3h2e5Yx`(private var `OTwmBKlc5`: Range<UInt64>) {
    let `N4gn37ie` = "n0"
  }
}

// Modifiers: Present, Parameters: Cu, Super call: Absent, Body content: FuncDef
class WIKvkplc {
  private WIKvkplc(public var NpAZSG_sR: Range<UInt64>, protected let oLu: Int64) {
    func vpusQNeX<`n`>(`WyC`: (Bool, String, Range<Int16>) -> (Array<((Array<Range<Int64>>) -> Float16, Range<UInt8>, Unit)>) -> Unit) {
      return false
    }
  }
}

// Modifiers: Present, Parameters: Cu, Super call: Absent, Body content: Full
class `R5Hwcf` {
  protected `R5Hwcf`(public var `vDWt7AG`: (Bool) -> Float32) {
    print(`vDWt7AG` is Float64)
    func JVX<`F9zD`>(o35Ei: () -> Unit, `ujH8QZLZFO`: String, OI75h3P: Bool) {
      return [543699i32..-28079i32:7, 0b10001001110100011000i32..=-916958i32:56]
    }
    let Sd = ()
  }
}

// Modifiers: Present, Parameters: Cu, Super call: Present, Body content: Empty
open class I_ {
  init() {}
}
class kVA1 <: I_ {
  private kVA1(protected var hrZ6CzhDSd: Array<Array<Bool>>, public var `B7vCAj`: Range<Int8>) {
    super()
  }
}

// Modifiers: Present, Parameters: Cu, Super call: Present, Body content: Expr
open class L_ {
  init(`Uz`: Bool) {}
}
class N_ <: L_ {
  public N_(var muEYIqKP: Range<UInt16>, protected let `QK6FRWRh`: Float32) {
    super(true)
    if (`QK6FRWRh` > 24.146f32) {
      true
    } else {
      true
    }
  }
}

// Modifiers: Present, Parameters: Cu, Super call: Present, Body content: VarDecl
open class LVC2LBB4S3 {
  init() {}
}
class `nUQrb` <: LVC2LBB4S3 {
  private `nUQrb`(protected let Vz: Float32, private var bj: Range<Int16>) {
    super()
    var h9TpC = ()
  }
}

// Modifiers: Present, Parameters: Cu, Super call: Present, Body content: FuncDef
open class `o0Gfj` {
  init(gAjnd: Bool, iCDqb_: (Unit, Float64, Rune)) {}
}
class fr3h <: `o0Gfj` {
  protected fr3h(public var vMnsC: (Array<Rune>, String, (String, Bool, Rune, Int64), Unit)) {
    super(false, ((), -46.22, r'a'))
    func R() {
      return true
    }
  }
}

// Modifiers: Present, Parameters: Cu, Super call: Present, Body content: Full
open class bNHA1_w {
  init() {}
}
class `NOkac` <: bNHA1_w {
  protected `NOkac`(public let ti3N3OHBD: Float16, public var `rs7wOs`: (Rune, (Bool) -> Range<Int16>) -> Range<UInt16>) {
    super()
    if (ti3N3OHBD > -100.15e-80f16) {
      ()
    } else {
      ()
    }
    func `H1KH`<VOn94o>(KI: Unit, mMJmXVi90: Rune) {}
    let RsA1CCP8B6 = -0b10101100101100100i32..980983i32:58
  }
}

// Modifiers: Present, Parameters: Cn, Super call: Absent, Body content: Empty
class `Fpk_eAjY` {
  protected `Fpk_eAjY`(private var `kdDrh`!: Float64 = -33.13) {
  }
}

// Modifiers: Present, Parameters: Cn, Super call: Absent, Body content: Expr
class `dOe7uaquxu` {
  private `dOe7uaquxu`(protected let `l_oJaX9ciz`!: String = "cwsAonhvCt6JbyM", public let `erq`!: Float32 = 121.173f32) {
    if (`erq` > -39.68f32) {
      72.195f16
    } else {
      97.147f16
    }
  }
}

// Modifiers: Present, Parameters: Cn, Super call: Absent, Body content: VarDecl
class G {
  protected G(var `WyNADI`!: Bool, protected var `zaY1hb`!: Rune = r'i') {
    let JAa = 112.97f32
  }
}

// Modifiers: Present, Parameters: Cn, Super call: Absent, Body content: FuncDef
class `cUmFM0` {
  protected `cUmFM0`(let `hutpliL`!: Array<Array<String>> = [["Fr5", "jr6rN2", "I3uJw8xT", "ChufDc2gmfgr8Ei"], ["rp0Km63dmBgDBHv", "ivxxieK70b3"], ["7", "KvovNSp29Z"], ["vP8dyUZ0FxvMQyn", "l", "W"], ["y55Lpzo0u", "1PGbI8Uca7tgkkmtNi"]], public let I_!: Range<UInt32>) {
    func PrJnBHc<oOkpYvhk>() {}
  }
}

// Modifiers: Present, Parameters: Cn, Super call: Absent, Body content: Full
class `fdB` {
  private `fdB`(protected let `sisS0j8zQ`!: (Float64, Int16, Rune)) {
    print(`sisS0j8zQ` is String)
    func JDqQSygTy<Eb_N>(`QEVtr85U`: (Unit, (Rune, Bool, Rune, Float16), Int32) -> Array<Rune>, `KZ`: Float16, axeo: (Bool, Array<Int64>)) {}
    let `SWho6m7S` = { => return false}
  }
}

// Modifiers: Present, Parameters: Cn, Super call: Present, Body content: Empty
open class L {
  init(`ozHtzS`: Float32, `K`: Rune, `ubdFKqX`: Bool) {}
}
class `Kq9K` <: L {
  private `Kq9K`(private let T2_k5!: String) {
    super(118.105e-57f32, r't', true)
  }
}

// Modifiers: Present, Parameters: Cn, Super call: Present, Body content: Expr
open class `Ubpui` {
  init() {}
}
class mx <: `Ubpui` {
  private mx(public let otJn7ie5!: Array<Bool> = [false, true, false]) {
    super()
    print(otJn7ie5 is Float64)
  }
}

// Modifiers: Present, Parameters: Cn, Super call: Present, Body content: VarDecl
open class RgErGYec {
  init(`A`: UInt8, `BUmMOk`: Array<Array<UInt32>>, `Ckj7sHC`: Float32) {}
}
class MhJCpX <: RgErGYec {
  public MhJCpX(var yGy!: (Rune, () -> Array<Range<UInt64>>, Int8), public var `WtJewGfj`!: Rune = r'C') {
    super(0xdau8, [[0b10000010011000010u32, 591559u32, 0o3142523u32, 0o2151415u32], [434484u32, 274075u32, 278735u32, 581088u32], [0o2763137u32, 0b101011010101111001u32, 0x7fe4u32, 0xd1fafu32, 0o2621044u32], [0b11111010011100001u32, 0xc6ddau32, 0b1000110011010110101u32, 634592u32, 0b10011110100010000000u32], [0b10101110111110001101u32, 506857u32, 0xd40bcu32, 799400u32, 0x7964eu32]], -91.78e56f32)
    let `LX6mKaoKY` = ((0x0, (), 0, -0o62i8..-127i8:11), [-0o3136011, -998758, 0o3426243, -0b101010110111011011])
  }
}

// Modifiers: Present, Parameters: Cn, Super call: Present, Body content: FuncDef
open class V8OEs {
  init(`KHDRs3JXU4`: Float32, m5ICRhy2: String) {}
}
class t <: V8OEs {
  private t(let nftjmDuwlm!: String = "ueAFNu", protected var DCnSo!: String) {
    super(18.46f32, "TgwsELLg")
    func `P0`(LfQo: Array<String>, vgoA2g: Rune, `n`: Bool) {}
  }
}

// Modifiers: Present, Parameters: Cn, Super call: Present, Body content: Full
open class `lNUvQ9C7D` {
  init(q8s8: Unit) {}
}
class U <: `lNUvQ9C7D` {
  public U(private let `L44WUWFZ`!: Float64) {
    super(())
    if (`L44WUWFZ` >= 102.2) {
      -20i8..-102i8:64
    } else {
      0o61i8..=0x5ei8:34
    }
    func m_tJ(`xZxhmssW6I`: (Bool, Rune) -> Range<Int64>) {
      return r'q'
    }
    var GjwWFvgsz = -46.36f32
  }
}

// Modifiers: Present, Parameters: OuCuCn, Super call: Absent, Body content: Empty
class pti61U0NW {
  public pti61U0NW(r7zg6cnz: (Range<Int8>, Bool) -> Array<Int64>, protected let `NjYxZWr7`: String, private var KNx5g1o!: Unit, private let NL!: String) {
  }
}

// Modifiers: Present, Parameters: OuCuCn, Super call: Absent, Body content: Expr
class IY {
  protected IY(hc: Unit, `OfDDGYS`: String, var R: (Array<Range<UInt32>>, Bool, String) -> Float16, var UZdLNCDj!: Int8) {
    print(-0b1110010i8 * UZdLNCDj)
  }
}

// Modifiers: Present, Parameters: OuCuCn, Super call: Absent, Body content: VarDecl
class `F3tzk_HLIS` {
  public `F3tzk_HLIS`(DuDNP: Unit, private var dD55CDVN: UInt32, protected let `GTamNj2`: Range<UInt16>, private var `gRDLSHOQu3`!: String) {
    var `U49` = -127.147e-47f32
  }
}

// Modifiers: Present, Parameters: OuCuCn, Super call: Absent, Body content: FuncDef
class `aqkOHh4r7d` {
  private `aqkOHh4r7d`(vKG0X9rjF: Range<UInt8>, let Ck: Float16, protected let `U1DT0Zl`: Rune, public var `T9oAcAvp`!: Float64 = -127.253e-91, private let `WbLsY2`!: Float32) {
    func `VcvBJV`(`YYKor`: Bool, cT03: Float32) {
      return { => return (0o0, 87.199)}
    }
  }
}

// Modifiers: Present, Parameters: OuCuCn, Super call: Absent, Body content: Full
class `NxMJ9Qr3a` {
  protected `NxMJ9Qr3a`(`Z`: (() -> Float64, Unit) -> (Int64) -> String, `SbIm`: String, protected let `Cp`: Int8, var `Odj`!: UInt16 = 0o133u16) {
    this.`Odj` = 0o71u16
    func `PQCLbuyB2`(d: Int8, aHi: Range<Int16>) {
      return [r'x', r't', r'u']
    }
    var kIHpBCmT = ["vGW8", "445ffoMkwq"]
  }
}

// Modifiers: Present, Parameters: OuCuCn, Super call: Present, Body content: Empty
open class `H7mfZdw` {
  init(`UDTViHu1u1`: (Rune, Array<Int64>, (Float32, Unit), Int8)) {}
}
class TNIw <: `H7mfZdw` {
  protected TNIw(`K`: Bool, f: String, public var `ft2`: Array<Float64>, private var bip: Array<Rune>, var `wN`!: Unit = ()) {
    super((r'g', [-0b11000101001111101010], (88.118f32, ()), 0x51i8))
  }
}

// Modifiers: Present, Parameters: OuCuCn, Super call: Present, Body content: Expr
open class `OWM` {
  init(`t3`: Rune, `Wg`: Unit, WH9tn0D: Range<Int16>) {}
}
class V3BbNTpOt <: `OWM` {
  private V3BbNTpOt(eZP: Array<Bool>, `ygwJte`: (Rune, Unit) -> Float32, private var `FMifUY`: Bool, var fE: Range<Int16>, private let UlE!: Array<Range<Int8>> = [0o116i8..0b1111011i8:96]) {
    super(r's', (), -0xffi16..-0x281i16:30)
    print(fE is Float16)
  }
}

// Modifiers: Present, Parameters: OuCuCn, Super call: Present, Body content: VarDecl
open class `t_1` {
  init(QMSPrvsUD: Int8, `lgAweJa2`: Range<UInt8>) {}
}
class hczfkk <: `t_1` {
  public hczfkk(`hAQ`: Range<Int8>, public var `SVB`: (Range<UInt32>, Rune, Range<UInt8>) -> Range<UInt32>, protected var Dy: String, public var I!: Rune = r'T') {
    super(0o142i8, 0b10100100u8..0x62u8:95)
    var G = [70.36e-6f32, -84.151f32, -82.179f32, 120.100f32, 88.144f32]
  }
}

// Modifiers: Present, Parameters: OuCuCn, Super call: Present, Body content: FuncDef
open class `mu_seOJ4tG` {
  init(`sMXT9dp`: Array<Bool>, RFn5M: Unit, `P`: Range<Int8>) {}
}
class `pELA` <: `mu_seOJ4tG` {
  public `pELA`(SCy: Unit, B76AXQ9UAr: Rune, public var `zA7`: Rune, protected var G48Z1H: (Float64) -> UInt16, let `rZ`!: String = "JQBxPxFG", var Rlo!: (Array<String>, () -> Int64, Range<UInt32>) -> Array<Unit>) {
    super([true, true, true, true, true], (), -5i8..-0o33i8:34)
    func `ZeLdIpMrj`<`esLFi03`>() {}
  }
}

// Modifiers: Present, Parameters: OuCuCn, Super call: Present, Body content: Full
open class `zdZ2_N` {
  init() {}
}
class `m1dnBI7` <: `zdZ2_N` {
  private `m1dnBI7`(`Xggh3`: (Array<Unit>, Unit, (Array<Int8>, Array<Array<Int16>>, Array<Float16>), Float64), public let DYL0oR_px: Bool, public var Otr: Array<Bool>, var `LKmNmn`!: Array<Float16> = [-29.222e119f16, -5.165e53f16, -101.181f16, 73.37e108f16, -8.248e51f16]) {
    super()
    this.`LKmNmn` = [-85.242e71f16, 34.177f16, -54.136f16, -86.186f16]
    func eDwfnbTp59(f0f: UInt8, kNrG87: Rune, OTU6A2lr41: Unit) {
      return r'2'
    }
    let M_L4w = ("DyDaJrIoqn", [r'y'], [64u8..=0b110u8:27, 0o101u8..0xc0u8:97, 0b11000u8..=0b110101u8:74, 0xdu8..=0x7du8:27, 123u8..=36u8:14], [-10.146e30f16, -57.54e47f16, -115.40e119f16, -12.14f16])
  }
}

// Modifiers: Present, Parameters: OuOnCn, Super call: Absent, Body content: Empty
class `Yhwpd` {
  private `Yhwpd`(`AVx4X6`: (Unit, Bool), v!: ((Float16, Int64, String, Int64), Float32, Range<UInt16>), var `xJ5LM`!: Unit) {
  }
}

// Modifiers: Present, Parameters: OuOnCn, Super call: Absent, Body content: Expr
class `xR0F` {
  protected `xR0F`(CQ5Ozb: Rune, myl52_: Rune, `MZjGXS5i`!: Range<Int32>, public let `Szbt6EeBiv`!: (String, () -> Unit), protected let f5vd7TJw2B!: Range<UInt8>) {
    print(`Szbt6EeBiv` is Array<Range<UInt16>>)
  }
}

// Modifiers: Present, Parameters: OuOnCn, Super call: Absent, Body content: VarDecl
class `uNACAx_` {
  private `uNACAx_`(HwII: String, `UFa9OlQeKR`: Float16, `KcPEX8Qb2T`!: Unit, `dbeSJ`!: Float16, private var `PZ54XyAC`!: Array<Range<Int8>>) {
    let `WvJpbX9P` = "87Zwai"
  }
}

// Modifiers: Present, Parameters: OuOnCn, Super call: Absent, Body content: FuncDef
class EvetF0 {
  protected EvetF0(AVAvfjm: Array<Unit>, `ONScev`: Array<UInt32>, `URFVCV9`!: Rune = r'o', public let tIE6AOkX0G!: String = "AMzziJSprAQiV", public let `Ik0NJNq`!: Bool = false) {
    func Gk() {}
  }
}

// Modifiers: Present, Parameters: OuOnCn, Super call: Absent, Body content: Full
class gl2qyBR {
  protected gl2qyBR(QnRbGaWp5: ((Range<Int16>, UInt8, Range<UInt64>), String, Unit), `C84vm7UV4l`: Unit, `rlAHTo8`!: Bool, `jG5JYW`!: Array<Rune>, var `nk`!: Unit) {
    this.`nk` = ()
    func `ciftA`<`b`>(Hs4DcJj: String) {}
    var `AFyPFxI` = -2.107f16
  }
}

// Modifiers: Present, Parameters: OuOnCn, Super call: Present, Body content: Empty
open class `GYV0lGP7z3` {
  init() {}
}
class e <: `GYV0lGP7z3` {
  protected e(MRZ: Float16, e31VT: UInt32, `OKKh`!: String = "Pb", private let lkErqtI8!: Rune, protected let `XX5x`!: Float64) {
    super()
  }
}

// Modifiers: Present, Parameters: OuOnCn, Super call: Present, Body content: Expr
open class `zSe` {
  init() {}
}
class mDn <: `zSe` {
  public mDn(D7FwgAw: ((Float16, Float64, Bool), Float16), `TuMUNwP`!: Range<UInt16> = 0b1100100101u16..674u16:55, `WBg_PIb`!: String = "8JwH7zs7rlQ8EjG1J", private let `XYAJER7`!: Range<Int64> = 0o1207266..0o3063032:27, private var fxgw5iK!: Int64) {
    super()
    if (this.fxgw5iK <= 0o2274270) {
      0x2di8
    } else {
      -0o127i8
    }
  }
}

// Modifiers: Present, Parameters: OuOnCn, Super call: Present, Body content: VarDecl
open class Q13 {
  init(m3U9wyL: Range<UInt16>, m7BD: Float32, raF: Float32) {}
}
class rILzdu <: Q13 {
  public rILzdu(My0p6de5v: Int8, `r`!: (Array<Rune>, Range<Int8>) -> Float32, `T4`!: UInt16, public var hq!: Unit, public let vQJX9!: Range<UInt64> = 0x54ae0u64..0b10101011000011011101u64:83) {
    super(7u16..0x2dau16:57, 69.152f32, 124.146e90f32)
    let Fmr_ = r'H'
  }
}

// Modifiers: Present, Parameters: OuOnCn, Super call: Present, Body content: FuncDef
open class UcnP {
  init(`F8Ur0`: Range<UInt8>, oj4: (Array<Array<Range<UInt64>>>, String) -> String, `h`: Bool) {}
}
class RO9MXuqG <: UcnP {
  protected RO9MXuqG(ZT8OZt2_: UInt32, `WP_8q`!: (Unit, Array<Int32>) -> UInt8, private var `PCaM4`!: Rune) {
    super(217u8..0o220u8:13, {gAOjTrm51:Array<Array<Range<UInt64>>>, `G4`:String => return "LENQ0tTkNCNHh7GOVKE"}, false)
    func Ax2vQt() {}
  }
}

// Modifiers: Present, Parameters: OuOnCn, Super call: Present, Body content: Full
open class UiB6gn1xsO {
  init(`FYjB`: (Range<Int8>, Range<Int8>, Bool) -> (Array<Float16>) -> Int64, W8p: Rune) {}
}
class mYc86_DYW <: UiB6gn1xsO {
  protected mYc86_DYW(wbIaZ: Rune, `UK1YJ`: Bool, R!: Unit, `Fj`!: Unit = (), private var MfnuDga7Q!: Rune = r'm') {
    super({`Qn2PTov3N`:Range<Int8>, kgOiS7i_Zp:Range<Int8>, I8hPPNe:Bool => return {`UqYerH_7cP`:Array<Float16> => return 0b0}}, r'g')
    this.MfnuDga7Q = r'O'
    func nsQbfU28<`vMBoilz`>(`wOmo`: Rune, OV: Float64) {}
    let `lAn` = -24.74e29
  }
}

main(){

}
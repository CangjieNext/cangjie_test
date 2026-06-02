/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a02_001

  @Level:         1

  @Assertion: 2.1.10.2(2)
              The syntax of the primary constructor is as follows:
              structPrimaryInit
                : (structNonStaticMemberModifier)? structName '('
                  structPrimaryInitParamLists? ')'
                  '{'
                  expressionOrDeclarations?
                  '}'
                ;
              structName
                : identifier
                ;
              structPrimaryInitParamLists
                : unnamedParameterList (',' namedParameterList)?
                (',' structNamedInitParamList)?
                | unnamedParameterList (',' structUnnamedInitParamList)?
                (',' structNamedInitParamList)?
                | structUnnamedInitParamList (',' structNamedInitParamList)?
                | namedParameterList (',' structNamedInitParamList)?
                | structNamedInitParamList
                ;
              structUnnamedInitParamList
                : structUnnamedInitParam (',' structUnnamedInitParam)*
                ;
              structNamedInitParamList
                : structNamedInitParam (',' structNamedInitParam)*
                ;
              structUnnamedInitParam
                : structNonStaticMemberModifier? ('let' | 'var') identifier ':' type
                ;
              structNamedInitParam
                : structNonStaticMemberModifier? ('let' | 'var') identifier '!' ':' type
                ('=' expression)?
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
//    e. OuCu: Ordinary unnamed and struct unnamed parameters
//    f. OuCn: Ordinary unnamed and struct named parameters
//    g. OnCn: Ordinary named and struct named parameters
//    h. CuCn: Class unnamed and struct named parameters
//    i. Cu: Class unnamed parameters
//    j. Cn: Class named parameters
//    k. OuCuCn: Ordinary unnamed, struct unnamed and struct named parameters
//    l. OuOnCn: Ordinary unnamed, ordinary named and struct named parameters
// 3. The constructor body configuration:
//    a. Empty body
//    b. Only an expression
//    c. Only a variable declaration
//    d. Only a function definition
//    f. Everything
// Everything else is randomized

// Modifiers: Absent, Parameters: Absent, Body content: Empty
struct `WMDFvIM20U` {
    `WMDFvIM20U`() {
    }
}

// Modifiers: Absent, Parameters: Absent, Body content: Expr
struct `r_HAg0d2F` {
    `r_HAg0d2F`() {
        print(-804605095 * 2120669496)
    }
}

// Modifiers: Absent, Parameters: Absent, Body content: VarDecl
struct G9e {
    G9e() {
        var pdX8 = true
    }
}

// Modifiers: Absent, Parameters: Absent, Body content: FuncDef
struct iyd7ytQMre {
    iyd7ytQMre() {
        func `kDmUktBw`<`qJuhNHH`>(`UZgzvA`: Array<(Int32) -> Unit>, l: UInt64, UNJ5: String) {
          return [['B', 'x', 'V', 'U', 'A'], ['g', 'S', 'F', 'j', '5'], ['p', 'q', 'U', 'r', 'F']]
        }
    }
}

// Modifiers: Absent, Parameters: Absent, Body content: Full
struct d {
    d() {
        print(0x75bc3809 + -1976698590)
        func `JUjXj`() {
          return -92.221e13f32
        }
        var `Zx3cfz9Q` = { => return [192u16..=0x1fu16:85, 0o221u16..=0o372u16:42]}
    }
}

// Modifiers: Absent, Parameters: Ou, Body content: Empty
struct o9eNzbPu {
    o9eNzbPu(`dhun`: Bool, G: Range<UInt32>) {
    }
}

// Modifiers: Absent, Parameters: Ou, Body content: Expr
struct fifyj884 {
    fifyj884(`z`: (Unit, (Bool, Array<(() -> (Rune, Bool), (Float64, Unit, () -> Range<Int16>) -> Bool, Array<Unit>)>) -> (Rune, (String, Float32), ((String, Array<Unit>) -> Unit, Int8, (Rune, Range<UInt64>, (Array<Float64>, Rune, String))), Array<(Array<String>, String, Unit, Rune)>), String) -> () -> (UInt16, (String, (((Rune, Range<UInt16>, UInt32), Bool) -> Bool, Float16, Bool) -> Float64), Float16), mNG7wQq: Unit) {
        print(mNG7wQq is Int64)
    }
}

// Modifiers: Absent, Parameters: Ou, Body content: VarDecl
struct `K9I4` {
    `K9I4`(`JqRxObD`: Array<Rune>, HF2l7I6ly: Float16) {
        let XvuY0pteQv = ()
    }
}

// Modifiers: Absent, Parameters: Ou, Body content: FuncDef
struct Lu4kSkzhw {
    Lu4kSkzhw(QAXj3: Float32, CHiXm2Rbb: UInt32) {
        func Zk6q0QhmDM<gaycd>() {}
    }
}

// Modifiers: Absent, Parameters: Ou, Body content: Full
struct UMKE {
    UMKE(`Y2GoCC`: (Rune) -> Unit, `fwpf4IUe`: ((String) -> String, Float32, Float16)) {
        print(`fwpf4IUe` is Bool)
        func `yZNgAL5`(Bs1cA6AZ1: (Array<Int8>, Float64), DJ6Nj: Bool) {
          return -1224i32..-15931i32:36
        }
        var g = 11343u32..0x80fau32:8
    }
}

// Modifiers: Absent, Parameters: OuOn, Body content: Empty
struct `GK` {
    `GK`(`iP`: String, `SVSxcr`: Array<((Rune, Array<Bool>, UInt8, Range<Int32>), (Range<Int8>, Float16, (((Array<Rune>, Float64, Unit, Rune), Int16, Rune, Bool), Bool, Rune), Range<Int16>))>, KxFaOkzJ!: UInt32) {
    }
}

// Modifiers: Absent, Parameters: OuOn, Body content: Expr
struct `z4swdjA` {
    `z4swdjA`(j8sYGSb: Float32, WxYVLYMf!: Rune = r'k', `tVUM`!: String = "wLZ401B99u") {
        print(j8sYGSb / -63.46f32)
    }
}

// Modifiers: Absent, Parameters: OuOn, Body content: VarDecl
struct `QkG6AbCj` {
    `QkG6AbCj`(K: String, RrguBK4yn!: String = "UXXu2x") {
        var b4qHZa = 0b110111000110001i32..=-24213i32:84
    }
}

// Modifiers: Absent, Parameters: OuOn, Body content: FuncDef
struct hfF4uRZbXM {
    hfF4uRZbXM(d3uA0zf: (Bool, Range<Int32>, Array<String>, Bool), bwKMCc69s: Array<Range<Int16>>, `zYN1WuvB`!: Rune = r'X') {
        func pB(r0keia: (String, Range<Int32>)) {}
    }
}

// Modifiers: Absent, Parameters: OuOn, Body content: Full
struct `ZU9` {
    `ZU9`(`H`: Float32, `z`: Bool, `Mfs0Qsu`!: UInt32) {
        print(93.5e-71f32 - `H`)
        func fCRaL<`Rsn8AYhVZ`>(`p4f`: Bool, `jpPPl3KQL6`: (Range<UInt16>, Range<Int32>, String), `oh1uksHCK`: String) {
          return {Z: String, G1: Int32 => return 'L'}
        }
        var `JFyYEb6` = [214u16..0x13u16:27, 0x69u16..202u16:64, 0b11011101u16..0o110u16:38]
    }
}

// Modifiers: Absent, Parameters: On, Body content: Empty
struct `r` {
    `r`(g5r!: Array<String> = ["1HVa", "0y", "0APl3MA"]) {
    }
}

// Modifiers: Absent, Parameters: On, Body content: Expr
struct `YPk3dn` {
    `YPk3dn`(OhCFv!: String) {
        print(OhCFv is Int16)
    }
}

// Modifiers: Absent, Parameters: On, Body content: VarDecl
struct `YcDZ` {
    `YcDZ`(zMEACLpvu2!: String, `Vc4`!: () -> String = { => return "BhyyEyFtQfmvuykSNs"}) {
        var RrI9aE = ((), (false, ({`b`: Array<Rune>, pVn: Range<Int32> => return [{qclK0: (Float16, UInt32, () -> Array<Rune>) => return 0x2a7u32}, {ZCS6frz: (Float16, UInt32, () -> Array<Rune>) => return 0xadeau32}, {Stf0iIpk6: (Float16, UInt32, () -> Array<Rune>) => return 0o146372u32}, {E1m: (Float16, UInt32, () -> Array<Rune>) => return 0o155166u32}]}, '4', ("hAcDJBX63WnyicuG", 0b100000111001011101101100001000, 't', -0x10e8i32..=-0b110001010000010i32:56), 'i')), 'c')
    }
}

// Modifiers: Absent, Parameters: On, Body content: FuncDef
struct `zpM` {
    `zpM`(N!: Range<UInt16> = 0o302u16..=0xc8u16:14, `lKEX_kB9L`!: Unit) {
        func oF(muyHw: Array<Range<UInt16>>) {}
    }
}

// Modifiers: Absent, Parameters: On, Body content: Full
struct i3elf4gCW {
    i3elf4gCW(`OQKQDqS`!: Float16) {
        print(`OQKQDqS` - 102.105e-39f16)
        func dqVRR<`INsG1q3YpE`>() {}
        let P = -17139i32
    }
}

// Modifiers: Absent, Parameters: OuCu, Body content: Empty
struct `zYm5NX` {
    `zYm5NX`(`z72GEk`: Unit, R: Float64, public let PvON9XTho: String) {
    }
}

// Modifiers: Absent, Parameters: OuCu, Body content: Expr
struct `rzN` {
    `rzN`(`u`: Bool, private var `FhrmiCr`: Rune, private var tfXELy8: (Range<UInt32>, Unit, Float64, UInt32)) {
        this.`FhrmiCr` = 'u'
    }
}

// Modifiers: Absent, Parameters: OuCu, Body content: VarDecl
struct ues4ERd3I {
    ues4ERd3I(AWiYqJ: Rune, AJ8: Unit, public var `jO`: () -> String) {
        var `cxohUOZg` = 91.44e102f16
    }
}

// Modifiers: Absent, Parameters: OuCu, Body content: FuncDef
struct E {
    E(Dmdkpf: (Range<UInt16>, Rune, Array<Rune>, String), `YfslfhrC`: Float64, public var YHYqUjxjP: Array<Range<Int16>>, private var oRilYz8esc: Bool) {
        func N<`IIW`>(J9MOn3: Rune, cy3b1aa: Range<UInt8>) {}
    }
}

// Modifiers: Absent, Parameters: OuCu, Body content: Full
struct P {
    P(`PmMAkm`: Array<Range<Int32>>, private var uz_emO3K5O: (String) -> String, public let byJi7Lg5: String) {
        this.uz_emO3K5O = {Q: String => return "3oE3Jk1dL1HOIW4"}
        func EKWIPH1<`vpawRY9YX`>(`FQp7`: Float16, `Sx`: (Float64) -> Unit) {}
        var `oKXloXP` = "TsfLufzpnBr1AAS"
    }
}

// Modifiers: Absent, Parameters: OuCn, Body content: Empty
struct `b` {
    `b`(`WRC_5bEtI4`: Rune, `Bn`: Array<String>, public var `Lsa8FOD`!: Unit, private let STfr!: Rune) {
    }
}

// Modifiers: Absent, Parameters: OuCn, Body content: Expr
struct wSUL9d {
    wSUL9d(`lww2D`: Range<Int8>, public let `Hcz8M1gD`!: Range<Int16> = -0o5i16..=-0b1100011i16:48) {
        print(`Hcz8M1gD` is Rune)
    }
}

// Modifiers: Absent, Parameters: OuCn, Body content: VarDecl
struct `UkqNe3M` {
    `UkqNe3M`(`FDMXKVlU`: (Float32) -> Float16, F: Bool, public var `u`!: UInt8, public var `yTeH6`!: String) {
        var `Cf` = "woDBX418"
    }
}

// Modifiers: Absent, Parameters: OuCn, Body content: FuncDef
struct W {
    W(`BkEGu`: Range<Int16>, public let `lqKv`!: Range<Int16>) {
        func `OdJpgs8`<`xDEIYXOQ`>(`W2aA`: Unit, `X`: Bool, Jxn: Range<UInt32>) {
          return 0x65u16
        }
    }
}

// Modifiers: Absent, Parameters: OuCn, Body content: Full
struct k0hy {
    k0hy(`e`: Unit, `q`: Range<Int64>, private let `F`!: Range<Int32> = -0o53163i32..26894i32:66) {
        print(`F` is Range<UInt8>)
        func `H`(OwXy: String, AW: (Unit, Range<Int8>) -> Bool) {}
        let mrNp = (true, 'm')
    }
}

// Modifiers: Absent, Parameters: OnCn, Body content: Empty
struct lMk {
    lMk(`WupS`!: Float16 = -105.231e64f16, private var RSwUxJ1!: Array<Range<UInt32>>) {
    }
}

// Modifiers: Absent, Parameters: OnCn, Body content: Expr
struct tMn_LqhB {
    tMn_LqhB(`eKHEKHKe`!: UInt8, var UXC7!: Range<Int64>, var HDJK!: Array<Float64> = [3.94, 21.116e-2, 66.223, 41.96e-59]) {
        print(`eKHEKHKe` ^ 0b1u8)
    }
}

// Modifiers: Absent, Parameters: OnCn, Body content: VarDecl
struct `nEnHy1gOMZ` {
    `nEnHy1gOMZ`(YNa4!: Unit = (), `ceit1rv`!: Rune, var k!: Rune, private let p3v!: Array<Range<UInt64>>) {
        let d9 = [-8.51, -25.60e-55, 30.65]
    }
}

// Modifiers: Absent, Parameters: OnCn, Body content: FuncDef
struct `gFyBZX` {
    `gFyBZX`(`Gf7`!: Rune, `bjjeARwz`!: (String) -> Unit, public var `m9KlRMED`!: Rune = r'x') {
        func T7F6TXFshJ<`Hamsinoo4F`>() {
          return 0o17u8
        }
    }
}

// Modifiers: Absent, Parameters: OnCn, Body content: Full
struct `t` {
    `t`(mJgF!: Range<UInt32> = 0x8cddu32..=0o13207u32:74, vLJIUHyyA!: Range<Int8> = -0b1000i8..=0o0i8:97, private let `IeC`!: Float16, let W!: Range<UInt64>) {
        print(W is (Bool, Unit, (String, Range<UInt32>, Float16, (Int16, String, Array<Array<Rune>>))))
        func uuOTBssA<`fLtSZdkiZ6`>() {}
        let `wOYcNfj72z` = {`oMCf4Vn_`: String => return true}
    }
}

// Modifiers: Absent, Parameters: CuCn, Body content: Empty
struct HpE {
    HpE(public let `ZwH9uaqlvh`: (Float64, Rune), var `nzK63dV`: Unit, public let Obo!: (Rune, ((Range<Int64>, Array<Bool>)) -> String, Unit, String)) {
    }
}

// Modifiers: Absent, Parameters: CuCn, Body content: Expr
struct CF {
    CF(let aXVqpR: UInt64, private var kvQv!: (Rune, (Rune) -> (Rune, String, String), Rune)) {
        print(aXVqpR / 543738195u64)
    }
}

// Modifiers: Absent, Parameters: CuCn, Body content: VarDecl
struct `IJHYoSjk3h` {
    `IJHYoSjk3h`(let p: (((Float16, Int64, (Float16, (Array<Int64>, Array<Float64>) -> Rune)) -> Unit, Rune), Array<String>, Bool), public var GN0rK5qpO: Bool, public let hfQEb!: Array<Float64> = [-30.172e-87]) {
        let NNzrX = 0o152765u32..=0b110100111101011u32:31
    }
}

// Modifiers: Absent, Parameters: CuCn, Body content: FuncDef
struct `gF` {
    `gF`(private var `DMpaUEouO3`: () -> String, public let `yknDlB`!: Range<Int16> = -0x3ai16..0b11001i16:53) {
        func TXlN(`ow6EoEq`: (Unit, UInt8, Unit, Int8)) {
          return -11i8..0b100i8:81
        }
    }
}

// Modifiers: Absent, Parameters: CuCn, Body content: Full
struct zVg8YatLP {
    zVg8YatLP(let s: Rune, var NRH0XvukY4: Array<Rune>, public var vVwoZ!: (String, (UInt32, Bool, (Array<Unit>) -> Unit), (Int64, Rune, Rune, Unit)) = ("kQWspkQI", (0o164146u32, false, {`QwxnSar4gU`: Array<Unit> => return ()}), (0x42f96724, r'o', r'8', ()))) {
        print(vVwoZ is String)
        func `Dj7F`<`vT0oOfFTr`>() {
          return ()
        }
        let `gMUH` = -0b1111101010010010110110001101010..=0x7d5ae87f:81
    }
}

// Modifiers: Absent, Parameters: Cu, Body content: Empty
struct `DBd` {
    `DBd`(private var xKqyhdc: Range<UInt16>, private var Or8Yuh24Vv: Unit) {
    }
}

// Modifiers: Absent, Parameters: Cu, Body content: Expr
struct `CgmCLX` {
    `CgmCLX`(var `ZaFY7yW`: Bool, private let Bp3zs29hv: Range<UInt64>) {
        this.`ZaFY7yW` = false
    }
}

// Modifiers: Absent, Parameters: Cu, Body content: VarDecl
struct DTcRz3F4qC {
    DTcRz3F4qC(var zsh2_q: Float16, let MMq: Int8) {
        let G8jXAYcfv = [-103.214e123f16]
    }
}

// Modifiers: Absent, Parameters: Cu, Body content: FuncDef
struct `gU_` {
    `gU_`(let `OCZOg8t_S`: Rune, public var `jbvAmPaj`: Bool) {
        func `YWuQL53x`(`RlR`: Range<Int16>, m: Range<UInt8>, QX5LtFq: (String) -> Float16) {}
    }
}

// Modifiers: Absent, Parameters: Cu, Body content: Full
struct O {
    O(public var MNfaoo2: Bool) {
        print(MNfaoo2 is Bool)
        func PvUW<`PnVx3eo`>(`w0PVMml`: (Range<Int8>, (Rune, Range<Int16>, ((Rune, () -> Range<Int64>), Int32, Float32), Range<UInt8>), String, Rune), `haYjfe`: (UInt16, Float64), LevZIKf91W: (Float16, Unit) -> String) {
          return ()
        }
        var fiBMoPvbJq = 80.125
    }
}

// Modifiers: Absent, Parameters: Cn, Body content: Empty
struct `D` {
    `D`(public let `H`!: String, public var xFgY!: (Range<Int8>, (((Bool, Array<Rune>, Bool), Float64, () -> Range<UInt32>)) -> Rune, () -> String)) {
    }
}

// Modifiers: Absent, Parameters: Cn, Body content: Expr
struct oT {
    oT(let `s49gZ`!: Bool = false) {
        print(`s49gZ` is Rune)
    }
}

// Modifiers: Absent, Parameters: Cn, Body content: VarDecl
struct `bnl` {
    `bnl`(private var `Idw`!: Array<Float16> = [13.145f16, -104.91e-75f16, -105.19f16]) {
        var `qOKHQflV` = -18.128e-22
    }
}

// Modifiers: Absent, Parameters: Cn, Body content: FuncDef
struct lI5azjo {
    lI5azjo(let qhscOjb_!: UInt64 = 0x4d494ed3u64) {
        func `lGz5C2HKnI`(`KRr`: () -> Unit, W4SUDfSHtP: Int64) {
          return ()
        }
    }
}

// Modifiers: Absent, Parameters: Cn, Body content: Full
struct I66 {
    I66(private let `ClKhNW`!: Array<String>) {
        print(`ClKhNW` is Array<Unit>)
        func iOwO5a(U: Int64) {}
        var lbVHsfYA1 = [{pqzrfMe: Int16, TJIwv: String, `AHSEMU`: Float16 => return 0b1110000111011110u32..=0o64176u32:56}]
    }
}

// Modifiers: Absent, Parameters: OuCuCn, Body content: Empty
struct M1 {
    M1(SaM17Cr: Range<Int32>, public var `ryQCFBGz_M`: String, public var u: Int64, private var NeRD!: Bool = false) {
    }
}

// Modifiers: Absent, Parameters: OuCuCn, Body content: Expr
struct `c` {
    `c`(`WrGLDo`: Float32, private var F: Float64, let DqqCxT2kye: String, let `VoBRRMp4`!: Float32 = -77.135e101f32, public var `MLEB9MVfqQ`!: ((Range<Int16>, String, String), Float32, Int64, (Bool, Array<Array<Unit>>, UInt16, () -> Unit)) = ((-0b1010100i16..0x22i16:57, "3", "m3vu7X4j"), 48.67e-126f32, -1522333149, (true, [[(), (), ()], [(), ()], [(), ()]], 0xa9u16, { => return ()}))) {
        this.`MLEB9MVfqQ` = ((18i16..=0o116i16:39, "m7oHG", "WIKprHc5FGxbZaS"), -24.177f32, 976772528, (false, [[(), (), (), ()], [(), (), (), (), ()], [()], [(), (), (), ()]], 181u16, { => return ()}))
    }
}

// Modifiers: Absent, Parameters: OuCuCn, Body content: VarDecl
struct `oYI` {
    `oYI`(R: (Int64, Bool, Unit), public let `xD41bYU`: Float16, public let O6!: String = "4HHyh3FfpjH1TSWu", private let VYOqj!: Array<Range<Int16>>) {
        var `Otaq` = { => return true}
    }
}

// Modifiers: Absent, Parameters: OuCuCn, Body content: FuncDef
struct `qx` {
    `qx`(`WQu`: (Bool) -> Array<UInt64>, var `DB7YQUs1l5`: String, private let `ECBXrd0QI`: Unit, public let j!: Rune = r'9', let g2wD!: Range<Int8> = 0o6i8..12i8:76) {
        func `Jfe9Q6D`<T1>(`F`: Bool) {
          return 15u8
        }
    }
}

// Modifiers: Absent, Parameters: OuCuCn, Body content: Full
struct `vzIwg15y` {
    `vzIwg15y`(Z6j1RCdZ: Rune, public var `fJCS6`: (Array<(() -> Unit, String, ((Range<Int8>, Rune) -> String, Range<UInt32>, String)) -> UInt16>, Rune, Unit) -> UInt16, private var `pmkQABAfb9`: Unit, let `IHWPcE`!: Bool = true) {
        this.`fJCS6` = {VvE4f2Q_HQ: Array<(() -> Unit, String, ((Range<Int8>, Rune) -> String, Range<UInt32>, String)) -> UInt16>, GQjNira: Rune, `PSqamTfb0`: Unit => return 0x6u16}
        func o_ICJvi<oX>() {}
        var SnMgiQQZ = -7.11
    }
}

// Modifiers: Absent, Parameters: OuOnCn, Body content: Empty
struct iFqwSl1QyW {
    iFqwSl1QyW(`uhC`: Range<Int64>, `H2b_d`!: Unit, var `ooNLjcu9`!: String) {
    }
}

// Modifiers: Absent, Parameters: OuOnCn, Body content: Expr
struct `RWSzR4DPR` {
    `RWSzR4DPR`(FrN9H: (Bool, (Range<Int32>, Rune, Float64), Bool) -> Unit, E_OMO!: UInt16, public let `l3Z`!: Array<Rune> = [r'P', r'M', r'V', r'9']) {
        if (0x8au16 > E_OMO) {
          0b1110i16
        } else {
          0b1111001i16
        }
    }
}

// Modifiers: Absent, Parameters: OuOnCn, Body content: VarDecl
struct `hBZ3TvdKze` {
    `hBZ3TvdKze`(U13: (Rune, Unit), `mHh`: Int8, `FWfsmW`!: Array<Rune> = [r'D', r'Z', r'a', r'3', r'm'], `R6gdHz`!: Int64 = -0o5046425037, let n8QRFMltib!: Range<Int8>) {
        var `ihwzkWm` = 5u8..0o6u8:56
    }
}

// Modifiers: Absent, Parameters: OuOnCn, Body content: FuncDef
struct `fL` {
    `fL`(`OD`: Array<(String) -> Bool>, `HizD0Ak`: Unit, sJmJ!: (Rune, Int64, String, Unit) = (r'M', -1650709482, "L2tmVV9tUx2t", ()), RPMj_HZGJz!: () -> Float64 = { => return -93.40}, var K!: (Range<Int8>, (Unit, () -> Bool, Array<Float16>, (Int8, Int16)), Unit, Float16) = (-0x4i8..-0o14i8:61, ((), { => return false}, [-39.28e13f16, 78.171f16, 113.27f16, 28.245e106f16], (-0b1i8, -0b1i16)), (), 65.149f16)) {
        func `Wmb`(`YKwO4C`: Float16, `M_8QuUez9X`: Rune) {}
    }
}

// Modifiers: Absent, Parameters: OuOnCn, Body content: Full
struct `QUl7YDyem` {
    `QUl7YDyem`(`fAtSdY6hb`: (UInt32, Float32), `wpY`: Bool, p!: Array<UInt32>, o!: Int16, var `owgyErJyky`!: Range<Int32>, public let `mjyMc`!: Int32 = 0x7675i32) {
        this.`owgyErJyky` = -0o15722i32..10707i32:26
        func kS(`ThvXo`: Range<Int32>, `iXp`: Bool) {}
        var `lC8giHZQs` = (0o10u8, {KkLMzrHIc: Range<UInt32>, `JR`: Unit, `AnpVu249`: Unit => return true}, false)
    }
}

// Modifiers: Present, Parameters: Absent, Body content: Empty
struct `rK1` {
    public `rK1`() {
    }
}

// Modifiers: Present, Parameters: Absent, Body content: Expr
struct `MdyHP` {
    public `MdyHP`() {
        print(-1553043219 + 0b1011100000100001001100000110111)
    }
}

// Modifiers: Present, Parameters: Absent, Body content: VarDecl
struct `j` {
    public `j`() {
        var `lD` = -0x4i8
    }
}

// Modifiers: Present, Parameters: Absent, Body content: FuncDef
struct M_ {
    private M_() {
        func QW8Y(Xw0vVF1U: Range<Int16>) {}
    }
}

// Modifiers: Present, Parameters: Absent, Body content: Full
struct `AIK9Ztp` {
    public `AIK9Ztp`() {
        print(-0o5632245161 - -0x59e9debe)
        func `CrMMulSjr`(`m08C`: (Bool, (((Unit, Float64) -> Range<Int8>, (Range<UInt32>, (Range<Int8>, UInt8) -> Range<Int32>), (UInt16, Unit, String, Rune)), Range<UInt8>, Array<Range<Int64>>, Float64), (Bool, Rune, Unit, Rune)) -> Bool) {
          return false
        }
        let `VHOv6_l0` = -111.187
    }
}

// Modifiers: Present, Parameters: Ou, Body content: Empty
struct kJFQhDot {
    public kJFQhDot(`apL`: String, `MmVoERA`: UInt32) {
    }
}

// Modifiers: Present, Parameters: Ou, Body content: Expr
struct `WMjpU16eU` {
    public `WMjpU16eU`(`e`: Float32) {
        print(`e` is String)
    }
}

// Modifiers: Present, Parameters: Ou, Body content: VarDecl
struct `zuLkOudgI` {
    public `zuLkOudgI`(`rrsZif_`: Unit) {
        let `O2T6A2u` = true
    }
}

// Modifiers: Present, Parameters: Ou, Body content: FuncDef
struct its_cUZ {
    private its_cUZ(XKdeJ4Hym: String) {
        func `LDI5xb1M`<Ic3iQ6Y>(exl: String, `iN`: (Bool, Float32, Unit, Rune)) {
          return 0o4i16
        }
    }
}

// Modifiers: Present, Parameters: Ou, Body content: Full
struct orp {
    public orp(rB_dmtXA2: String, g: Rune) {
        print(rB_dmtXA2 is Float64)
        func `ewjcL`(vy0G: Range<UInt8>, dk: Bool, XsQWLc: (Bool, Unit, Rune)) {}
        var Z = -71.45f32
    }
}

// Modifiers: Present, Parameters: OuOn, Body content: Empty
struct NDskoSI59 {
    private NDskoSI59(`muV6bycza`: Range<UInt16>, `h2qS`!: Unit = ()) {
    }
}

// Modifiers: Present, Parameters: OuOn, Body content: Expr
struct `Qc_Og` {
    public `Qc_Og`(KkL2: Float32, IY: (() -> (Array<Range<UInt64>>, Int64) -> Float32, String, Array<Float32>, Float16), NX3eMc90!: Range<UInt16> = 7u16..=0b1001011u16:6) {
        print(KkL2 is Float64)
    }
}

// Modifiers: Present, Parameters: OuOn, Body content: VarDecl
struct PHb {
    public PHb(m: Unit, `q5fIErWk`: UInt64, `hp1ojJdmmr`!: Range<Int64>, x!: Int8) {
        let `M6n` = "Uofwd"
    }
}

// Modifiers: Present, Parameters: OuOn, Body content: FuncDef
struct uDbV5m89 {
    private uDbV5m89(`doCTL9L0`: String, `mw`: Float32, bZCxiu!: Array<String>, AyWG0mnNw!: Array<UInt8>) {
        func `A5J`<hVdfoRay2g>(MR_6ZsQ0Fk: Array<Bool>, `nsMTcwg`: Range<UInt8>) {
          return 0xf3be2f8u64
        }
    }
}

// Modifiers: Present, Parameters: OuOn, Body content: Full
struct goNd31 {
    private goNd31(HrB668: Range<Int8>, p5P0!: Float16 = 115.165f16, DBUp7EF9Oe!: Range<Int32> = 0x3098i32..-0b101100000001110i32:36) {
        print(p5P0 / -76.152e-115f16)
        func Ym3fpFtdtn<`Ig`>(`n0qUrPtFR`: UInt16) {}
        var dcfG = false
    }
}

// Modifiers: Present, Parameters: On, Body content: Empty
struct pC {
    private pC(`k0VnpM`!: Rune = r'W') {
    }
}

// Modifiers: Present, Parameters: On, Body content: Expr
struct `y0sV` {
    public `y0sV`(ZTqv3_ud!: String = "kdD2RCVuLE") {
        print(ZTqv3_ud is Array<Float16>)
    }
}

// Modifiers: Present, Parameters: On, Body content: VarDecl
struct w8 {
    public w8(`t7hO`!: UInt16, `yRw55U`!: Range<Int64> = 0o3162772715..0o13705136363:63) {
        var `B6WWr` = (false, -0o15i16)
    }
}

// Modifiers: Present, Parameters: On, Body content: FuncDef
struct `g` {
    private `g`(`bQ`!: (Int32, (String, Rune, Int32), () -> Rune) = (0x5274i32, ("CzGKahdU", r'a', -0o41311i32), { => return r'j'})) {
        func vIQMRv<`GX1`>(`BibbYk5cLq`: (Unit, Bool)) {}
    }
}

// Modifiers: Present, Parameters: On, Body content: Full
struct KKtoulvaR {
    private KKtoulvaR(`ppH`!: Rune, `Gl2Ofqu0`!: String) {
        print(`ppH` is Int32)
        func `JiyLJ`<`EDw9xiuAnI`>(`oEh`: Range<UInt64>, dTjp: String) {
          return (-42.198e38, ('q', 0x16u16..=0xdeu16:66, 'o', (46.104f32, {k7: (Range<Int32>, UInt16, (Rune, ((Float32) -> Float64, Rune) -> ((String, Int8, String) -> Unit, Bool), Unit), Bool), `fXlTKE`: (Bool) -> Int16, `EDnEciB`: Unit => return "e3tlEAJKr8RP"})), "7gpm1yaM3faFB", {yn: Int8, aty: Array<(Array<Int16>) -> Float32>, aH: Rune => return 0b1001110001000100011011000100111u64})
        }
        let `iTN4gG` = 15953i32..=0b101000010011000i32:15
    }
}

// Modifiers: Present, Parameters: OuCu, Body content: Empty
struct `ql54vJr6H` {
    private `ql54vJr6H`(`MEj2lofx`: Rune, public let e7qdT_: UInt16) {
    }
}

// Modifiers: Present, Parameters: OuCu, Body content: Expr
struct `twdEny` {
    private `twdEny`(`CuU9WL`: (Rune, ((Unit, Unit, Bool, (String, Rune) -> (String, Range<UInt16>) -> Rune), Rune, Unit)), public var K: UInt8) {
        print(K is Array<Range<Int8>>)
    }
}

// Modifiers: Present, Parameters: OuCu, Body content: VarDecl
struct br {
    private br(`rZAOQhh2`: (Array<Range<UInt32>>, String, Unit), public var `tfEEPO7WEB`: Float32, public let b_8SmOgw: Rune) {
        let gNIgQ = ("TNZrEiS6KCNhx", (), -92.53f32)
    }
}

// Modifiers: Present, Parameters: OuCu, Body content: FuncDef
struct `DW` {
    private `DW`(wYK: Bool, `yaF7`: String, public var bY84hcLImW: Bool) {
        func `GSVSWeQrn0`<Y0>(`fimoL4ZN9D`: UInt16) {}
    }
}

// Modifiers: Present, Parameters: OuCu, Body content: Full
struct `T` {
    public `T`(`JfU`: Array<Range<UInt32>>, `U`: Rune, var ThcoFTEcXw: (Array<Rune>, Range<UInt16>, Array<Unit>, Float64), let Jb: Array<Int16>) {
        print(`U` is Range<UInt8>)
        func `F0wFbEQ0`(`ETDfsAA`: Float64) {
          return 124.116e121f16
        }
        let R = -268598597
    }
}

// Modifiers: Present, Parameters: OuCn, Body content: Empty
struct `FuOi` {
    private `FuOi`(rm: (Bool, ((Rune, Array<Unit>, Float64, (Range<UInt32>, () -> Range<Int64>)), Range<UInt64>, Float16, Bool)), let `w`!: String) {
    }
}

// Modifiers: Present, Parameters: OuCn, Body content: Expr
struct `XA_PWO` {
    private `XA_PWO`(v6Ez: Rune, var `knvhCZoqp`!: (Array<(Range<Int16>, Array<() -> Unit>, String)>, String, (((Range<UInt16>) -> Unit, Range<Int64>), Float64, String) -> Float16) = ([(-77i16..113i16:7, [{ => return ()}], "0NdISQC5WXWckZmyu350"), (-106i16..-0b100010i16:70, [{ => return ()}, { => return ()}], "lWo8ldNcW")], "Sci", {Iea7c: ((Range<UInt16>) -> Unit, Range<Int64>), Bi5eB: Float64, `nX`: String => return -24.154f16})) {
        this.`knvhCZoqp` = ([(-93i16..=0o14i16:71, [{ => return ()}, { => return ()}, { => return ()}, { => return ()}], "a9olkSlCemm"), (0o114i16..-0b111000i16:6, [{ => return ()}], "gTZoOizhYNQGa6zhButC"), (0o153i16..=0x39i16:12, [{ => return ()}, { => return ()}, { => return ()}, { => return ()}], "22")], "GYGhNuzrWpb3hQIPxyt", {`KbxJii6W`: ((Range<UInt16>) -> Unit, Range<Int64>), h: Float64, `ycF`: String => return -24.211f16})
    }
}

// Modifiers: Present, Parameters: OuCn, Body content: VarDecl
struct `a` {
    private `a`(IVQ2: Array<String>, `Irhzj`: Array<Unit>, private var `tiVuvpA`!: (String, Range<Int64>, Unit, Unit) = ("iH2Fn5mEYiL0PZ", 0x35b1d5e2..=-0x68fdfa70:16, (), ())) {
        var IZfsF6sUR = 'u'
    }
}

// Modifiers: Present, Parameters: OuCn, Body content: FuncDef
struct ED {
    public ED(`mu_y1`: Float16, nyc93I5H: Unit, private let Hq!: (String, (Unit, Float16, String, (Bool) -> UInt64)) = ("q1Iw", ((), 6.58f16, "uS07YIfnDUSUvk", {nYuw46ij: Bool => return 3243564631u64})), public var sK2n5!: Array<Range<UInt32>>) {
        func `Y`(Vo: Float16, `PpjD5wR2`: Unit, dH: String) {
          return ()
        }
    }
}

// Modifiers: Present, Parameters: OuCn, Body content: Full
struct nA {
    private nA(Umj3xfC13E: Rune, `Fo`: String, private var NV!: String = "rJ", private let Q3M9dHsT0e!: String) {
        print(NV is (Unit, (String, Rune, UInt64) -> Rune, (Bool, (Bool, () -> (Unit, Int16, Float16) -> Range<Int32>, Unit), Float64, Rune), Float32))
        func `Up`() {
          return 29.146e-123f32
        }
        var `JwKt` = [(), ()]
    }
}

// Modifiers: Present, Parameters: OnCn, Body content: Empty
struct DLXuDnNLMH {
    public DLXuDnNLMH(`JrE2`!: Unit, aGUHYyhrv9!: (Float64, (Float64, Array<(Bool, () -> Rune)>, UInt8), Bool) = (98.227e-71, (39.177, [(true, { => return r'N'})], 0o15u8), true), public var BP0WwuX5s!: Int8, public var uib!: (Int32, String, Unit) -> String) {
    }
}

// Modifiers: Present, Parameters: OnCn, Body content: Expr
struct n {
    private n(`NSbYz7s`!: (Array<Range<UInt8>>, String) -> Range<UInt64>, `CJIrj9pc50`!: Rune = r'L', public let `xo7r`!: Bool = true) {
        print(`NSbYz7s` is Unit)
    }
}

// Modifiers: Present, Parameters: OnCn, Body content: VarDecl
struct nUH6itozF {
    public nUH6itozF(NLTb9mAUOS!: Bool, TYSB!: Bool = true, public let `WVlT_6rsC`!: Array<Array<(Int8, Rune, Bool)>>, private var qc!: String) {
        var `SI` = false
    }
}

// Modifiers: Present, Parameters: OnCn, Body content: FuncDef
struct `ltF24Eq8h` {
    public `ltF24Eq8h`(`J0ylb`!: Unit, let `s3aJLBVcR6`!: Bool, let `GkgW`!: () -> Int64 = { => return -0x733a9eeb}) {
        func GeTauD8tl(t0vzEYqv80: (String, Array<Float64>) -> Bool, `wkwq`: Rune, `t8Z`: (Rune, UInt32, (Array<Unit>, Rune))) {
          return [false, true, true, true]
        }
    }
}

// Modifiers: Present, Parameters: OnCn, Body content: Full
struct `rDA5VY` {
    public `rDA5VY`(`ZbZXecMec`!: Array<Unit> = [(), (), ()], public var X7iJX!: (((String, String, Array<Float16>), Range<Int64>, Float32) -> (Unit, (Rune, (Float16, String)) -> Float32, Bool, Unit), Float16)) {
        this.X7iJX = ({UHd_U_8g: (String, String, Array<Float16>), n7: Range<Int64>, `j8`: Float32 => return ((), {v58mIdu6ly: Rune, MNR9Nc_: (Float16, String) => return 33.220f32}, false, ())}, 83.167e16f16)
        func y4y6WkHEB<`LyXSp27`>(Gchis: Bool, `Red`: UInt32) {}
        var `bR` = false
    }
}

// Modifiers: Present, Parameters: CuCn, Body content: Empty
struct `PQp` {
    private `PQp`(private let `STOxb3RjP9`: Int32, public var IF: Rune, let `yx`!: Unit) {
    }
}

// Modifiers: Present, Parameters: CuCn, Body content: Expr
struct ytw_ {
    public ytw_(private var `da`: Range<UInt32>, public var dW: Unit, let `ipDLonBb8`!: String = "Au7dH1QARqLfuw") {
        this.dW = ()
    }
}

// Modifiers: Present, Parameters: CuCn, Body content: VarDecl
struct `if` {
    public `if`(private let J6wIznz: String, var hg5_Txcp6c: Rune, public var `pR48H21m9`!: String, public let `Ipq3U5m`!: (Unit, UInt64, Bool) -> UInt16 = {`WW`: Unit, `OB2iCflI3i`: UInt64, XkKixrSJ: Bool => return 0xdcu16}) {
        var `Btrfq01L` = [(), (), (), ()]
    }
}

// Modifiers: Present, Parameters: CuCn, Body content: FuncDef
struct Nvi {
    public Nvi(private var `iNCSvmZMQ_`: Rune, let `YC`: Array<Bool>, public let `HdwPv`!: Rune) {
        func eC01v(`flg1HX3w`: Rune, aTLyqZ: Float32) {
          return {eZvB3rEo: Unit => return false}
        }
    }
}

// Modifiers: Present, Parameters: CuCn, Body content: Full
struct `NGmDCTm` {
    private `NGmDCTm`(public let `tzx`: UInt32, private var `RUv`!: Unit = (), private let `gYR22Ili`!: (Range<Int32>, Rune) -> Int8 = {`fp`: Range<Int32>, `mtdSH`: Rune => return -0xbi8}) {
        print(`RUv` is Int64)
        func `ldCfa9bw`() {
          return 43.193e74f32
        }
        let JugZ = 0b100001i16..=0b1100101i16:60
    }
}

// Modifiers: Present, Parameters: Cu, Body content: Empty
struct q {
    private q(public var `CmWzodsm0H`: Unit, public var `V07F`: Rune) {
    }
}

// Modifiers: Present, Parameters: Cu, Body content: Expr
struct `F6WP6S` {
    public `F6WP6S`(private let qfRco: Unit) {
        print(qfRco is String)
    }
}

// Modifiers: Present, Parameters: Cu, Body content: VarDecl
struct `fv` {
    public `fv`(public var `nuawP27vC`: Range<Int64>, let sG_iV: (Float32) -> Float32) {
        let `TJa` = 38.133
    }
}

// Modifiers: Present, Parameters: Cu, Body content: FuncDef
struct ZnERD1uHYl {
    private ZnERD1uHYl(public let `U`: (Float16) -> Array<(Bool) -> () -> (Float32, Rune, Unit)>, var Ubpy: Rune) {
        func `XrWJkH0V`(WTb7PxSsYQ: UInt8) {}
    }
}

// Modifiers: Present, Parameters: Cu, Body content: Full
struct `F3P3kO` {
    public `F3P3kO`(public let `aNL`: Array<String>, public let `XUF`: Bool) {
        print(`XUF` is Array<(Array<UInt8>, (Rune, Rune)) -> Rune>)
        func CGD_(`cgEMim`: Rune, `iLextcCX`: Array<Range<Int32>>) {}
        var `ZN3` = (((0o16615530135..=-2106847074:28, true, -21.223e27), '2', (), "TPcxZov"), (), 's', ())
    }
}

// Modifiers: Present, Parameters: Cn, Body content: Empty
struct `Zv` {
    public `Zv`(public var `J3f`!: Rune) {
    }
}

// Modifiers: Present, Parameters: Cn, Body content: Expr
struct `km2LHUIYeb` {
    public `km2LHUIYeb`(let `GmABEU3eF8`!: Float64, var `m3`!: Float32) {
        this.`m3` = -28.166e-96f32
    }
}

// Modifiers: Present, Parameters: Cn, Body content: VarDecl
struct `Z0lxSZge` {
    private `Z0lxSZge`(var vP!: Unit) {
        var `tbJIy7Ex` = {kHM: UInt32 => return ["Ao7zbR", "pW1m24", "N1elI65zhlgHHQdhWv0B", "eK3p8Q0K0wC6", ""]}
    }
}

// Modifiers: Present, Parameters: Cn, Body content: FuncDef
struct `y` {
    public `y`(let `V6`!: Array<Array<(Float64, Int8)>> = [[(2.244e-68, 12i8), (-41.81, 0b10i8), (25.73e-3, 0xbi8), (6.87e36, -0x4i8)], [(78.204e-81, -0b1001i8), (93.120, 0o10i8), (-48.241, -0o3i8), (-26.240e14, 0b1010i8), (45.230e-97, 0o4i8)], [(7.62, -0x3i8), (-102.244, 0x8i8), (-47.56e98, -0o14i8)]], public var Yssbh!: String = "JMFGXs") {
        func i(M: Range<UInt64>, `xYvaNw`: Array<Array<Int8>>) {}
    }
}

// Modifiers: Present, Parameters: Cn, Body content: Full
struct `lafmcf` {
    private `lafmcf`(private let `cokEsNPL7`!: Int16 = 0b1001i16) {
        print(`cokEsNPL7` is UInt8)
        func w(yFfFgpU: Range<UInt16>, TMvw4: Array<((Rune, Rune, Float64, (String) -> Bool), Bool)>) {}
        var `xLlzPONVTZ` = true
    }
}

// Modifiers: Present, Parameters: OuCuCn, Body content: Empty
struct JgLeRy86 {
    public JgLeRy86(W5ppD: String, private let `egT`: String, var fUH1sa1O!: Int16, private let J0sDvbN!: UInt16) {
    }
}

// Modifiers: Present, Parameters: OuCuCn, Body content: Expr
struct `IbcWLMh2` {
    public `IbcWLMh2`(ko: Unit, `YYWs4`: Range<UInt16>, private let `w`: Unit, public let `RXtUb9XE`: Array<(String, Range<Int8>, Rune)>, var `zid`!: Rune) {
        print(`RXtUb9XE` is Array<Range<Int16>>)
    }
}

// Modifiers: Present, Parameters: OuCuCn, Body content: VarDecl
struct V {
    private V(`clp2WyRMPX`: Int64, private var `H2emZ8I2`: UInt8, public let QAzMFZLQr: () -> Float32, var `utNuG`!: (Float64, String, Range<UInt16>, (Unit) -> Array<String>) = (117.97e6, "0ED365", 214u16..=0b10110010u16:52, {`aYPH6QwO`: Unit => return ["7zXPs", "Lzqywvs", "3pAouVA12CKq", "coJCquB6iljtqUWHgh", "H58fFxWqQ4AfKPJP0Wa"]}), public let `TWyzzPeu`!: Float32 = 91.4e-74f32) {
        var `PZ6_xAffCY` = true
    }
}

// Modifiers: Present, Parameters: OuCuCn, Body content: FuncDef
struct `NSZ` {
    public `NSZ`(f: Float64, private var `yqkmMZyatG`: Bool, var WrM: (UInt64, Unit, Range<Int8>) -> String, private let NyPnTePMo!: (Range<UInt64>, Bool, Rune) = (0o15737776343u64..=0b10110000111100011101111011101101u64:26, false, r'3')) {
        func `GWQt7Jf5`(HF8IzR62: Rune, Ef3Em: Float16, `M8sKsM7Umo`: Float64) {}
    }
}

// Modifiers: Present, Parameters: OuCuCn, Body content: Full
struct `FpBzuc` {
    private `FpBzuc`(gFjkIT8KP: (Range<Int64>, Range<Int32>, UInt16, Unit), private var `qPckMF2h4g`: Array<UInt8>, private let `CRWZe`: Range<UInt16>, private var `c90e0Wk`!: (Bool, Rune) -> UInt64, var kOg!: String = "Rn9m") {
        this.kOg = "OPkZRQkqX0K"
        func MrlXq(`E`: String) {
          return {Slh5yob: Range<UInt8>, `e8MvY`: Unit, `QXN1KE5U`: Array<(Float32, Array<Unit>, Int8)> => return ((0xf0ca6c2bu64, -0x1fi16), (), "c7")}
        }
        var iuJ7lO = ()
    }
}

// Modifiers: Present, Parameters: OuOnCn, Body content: Empty
struct zLxilFv {
    private zLxilFv(`qPFaVYs`: Int32, XLfju!: Array<Rune> = [r'd', r'T'], K85ONKh9yJ!: Rune, var `BdZY`!: (Rune, Rune, Rune) -> (Rune, (Bool, Bool) -> (Float32, Rune, Range<UInt32>, (Float16, Float16, Bool))) -> () -> Range<Int64>, private let `g0RBq`!: Array<(UInt8, Array<String>)>) {
    }
}

// Modifiers: Present, Parameters: OuOnCn, Body content: Expr
struct `KA2zece` {
    private `KA2zece`(`cFIA8F`: ((String, Float16) -> Rune, String), U4: ((Float64, Float16, Float16), (Bool, String, String) -> Bool, Array<(String) -> (Rune, (Rune, (Bool, Float16, String) -> String))>), `wzOUfi4`!: Unit, MW7YX!: String = "KAEJBexcKnCV9QK", public let NtlBZTIepP!: Range<UInt32> = 0b101111100010u32..18084u32:5, let `ge`!: Float32 = -98.243e-73f32) {
        print(`ge` / 48.228e-47f32)
    }
}

// Modifiers: Present, Parameters: OuOnCn, Body content: VarDecl
struct CQtg3r4na {
    private CQtg3r4na(sai: UInt64, `nQckbtsl6`: Array<Array<String>>, `F`!: Rune, `mlE`!: Array<((Bool, Bool) -> (UInt16, ((String, Float64), Float64, Range<UInt64>, ((String) -> Bool, (Range<UInt64>, Rune, (Array<Float16>, Int64, Bool), Unit)) -> Range<Int8>), Unit, Float16), String)> = [({GX: Bool, `lRmuf`: Bool => return (0b1010011u16, (("eKP7", -87.115), 81.113, 0x582a6824u64..0x4b656f54u64:79, {pzr1Q9KKd: (String) -> Bool, Q3s: (Range<UInt64>, Rune, (Array<Float16>, Int64, Bool), Unit) => return 4i8..-0b10i8:6}), (), -76.235f16)}, "MYmF5wCvrd1")], var `z`!: (Float64, (String) -> Unit) -> String) {
        var FNvrju5R = ""
    }
}

// Modifiers: Present, Parameters: OuOnCn, Body content: FuncDef
struct `dy51` {
    private `dy51`(v62: (Unit, Float64, (Range<UInt8>, Range<UInt8>, Unit), Rune), yiOeluKlZY: UInt16, `E`!: Rune = r'j', private var K!: Range<UInt8> = 12u8..=9u8:33, public let ZZ!: (Int8, (UInt8, Rune, Rune) -> Bool, Int16) = (-5i8, {YUicMvPZ: UInt8, `kL`: Rune, aml: Rune => return false}, 16i16)) {
        func `v51w`(bEFWb8: (Rune, () -> Float32, Unit, Rune), PY23qFnNUT: (Unit) -> String, `SH4swH_`: Array<(Float16, Rune, Int64) -> Range<UInt32>>) {
          return "1aX"
        }
    }
}

// Modifiers: Present, Parameters: OuOnCn, Body content: Full
struct `QVaww` {
    public `QVaww`(OzN3qDg83v: String, `hUXDuXq2ae`: Unit, `U1I06lIzIe`!: (Unit, UInt64), `oUgiSvKK33`!: (Unit, (Rune, Rune), Float32) -> String = {`kdAMrmr`: Unit, `XC`: (Rune, Rune), `qhwKhih`: Float32 => return "v7sxVym5Lz"}, var juHrrEw!: Rune) {
        print(this.juHrrEw is Bool)
        func `PmCA4Tz`<`crdgl`>(`zHJz0`: () -> UInt8, `CiqkNHa`: Range<UInt8>, JldPZ8: String) {
          return 0o0u8..=4u8:61
        }
        var `xsf1` = {DatLvI: String => return -14.74f16}
    }
}

main() {
}

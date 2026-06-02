/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a03_01

  @Level:         1

  @Assertion: 6.1.1.4(3)
              The syntax of a class body is as the following:
              classBody
                : r'{'
                  classMemberDeclaration*
                  classPrimaryInit?
                  classMemberDeclaration*
                  '}'
                ;
              classMemberDeclaration
                : classInit
                | staticInit
                | variableDeclaration
                | functionDefinition
                | operatorFunctionDefinition
                | macroExpression
                | propertyDefinition
                ;

  @Description: Check different combinations of correct syntax

  @Mode: compileonly

  @Negative: no

  @Structure: complex-main

  @Dependencies: macro_defs.cj

  @Issue: 0006124, 0006136, 0006151
*/

import a03.*

// Using the scale for the names of classes: 
// The name consists of 8 symbols, designating each element of the syntax in the assertion
// _ means the element is not present, other letters signifiy an element and go in the following order:
// C - primary constructor
// I - init constructor
// S - static initializer
// V - variable declaration
// F - function definition or declaration
// O - operator overloading
// M - macro expression
// P - property definition
// For example: ___V__M_ is the name for a class that only contains a variable declaration and a macro expression

class fajfle_fej {}

class C_______ {
  C_______() {}
}
class _I______ {
  init() {}
}
class CI______ {
  CI______(U4: Bool) {}
  init() {}
}
class __S_____ {
  static init() {}
}
class C_S_____ {
  C_S_____() {}
  static init() {}
}
class _IS_____ {
  init() {}
  static init() {}
}
class CIS_____ {
  CIS_____(ifew: Float32) {}
  init() {}
  static init() {}
}
class ___V____ {
  var wR = r'a'
}
class C__V____ {
  C__V____() {}
  static var kna = 0
}
class _I_V____ {
  init() {}
  public static var QR = false
}
class CI_V____ {
  CI_V____(seIkpt8: (Int32, Int32)) {}
  init() {}
  let Jwg7sT = 0
}
class __SV____ {
  static init() {}
  static var mCc = ""
}
class C_SV____ {
  C_SV____() {}
  static init() {}
  public static var bEkABgT = 0
}
class _ISV____ {
  init() {}
  static init() {}
  let Doxgp57 = 1
}
class CISV____ {
  CISV____(Si5IsM: Int32) {}
  init() {}
  static init() {}
  var vMY4h = 1
}
class ____F___ {
  func p_U(Nw: Int32, LU6: Object) {}
}
class C___F___ {
  C___F___() {}
  protected func F4jOt<f3Pgo>(iPLK: Object) {}
}
class _I__F___ {
  init() {}
  static func cMZXybA(FaO: Float64, g3: Int16) {}
}
class CI__F___ {
  CI__F___(WAvp: Float64) {}
  init() {}
  static func kmIa<bWUhBJj>(QZSvJOe: Int32, rXOT: Rune) {}
}
class __S_F___ {
  static init() {}
  func Ow1a(ps: Float64) {}
}
class C_S_F___ {
  C_S_F___() {}
  static init() {}
  static func f6pQaB7(p6: Float32, CGyko: Int8) {}
}
class _IS_F___ {
  init() {}
  static init() {}
  func lib<L5>(SekANn: Rune, Lvz: Int64) {}
}
class CIS_F___ {
  CIS_F___(j1DWiL: Float32) {}
  init() {}
  static init() {}
  public func Puk4() {}
}
class ___VF___ {
  public static var Bfa4eyl = 1
  func me1PiJ(wUZzsj: Int32) {}
}
class C__VF___ {
  C__VF___() {}
  private let ZN = 0
  public func FaYPOu<m6>() {}
}
class _I_VF___ {
  init() {}
  var j51Qb = r'a'
  func mgIYOa() {}
}
class CI_VF___ {
  CI_VF___(kL65Mdv: (Int32, Int32)) {}
  init() {}
  protected static let rrXvF = 0
  func Q6() {}
}
class __SVF___ {
  static init() {}
  private static var HPAPPPK = ""
  protected static func VK1Vh<hJ>() {}
}
class C_SVF___ {
  C_SVF___() {}
  static init() {}
  private let TjSSn = false
  protected static func xxfQ<RLg4>(bgyU: Int8, tRy: Bool) {}
}
class _ISVF___ {
  init() {}
  static init() {}
  let LT1fTQl = 1
  func jJ<cagQF>() {}
}
class CISVF___ {
  CISVF___(iHoJJ: Bool) {}
  init() {}
  static init() {}
  private static let Beqw = true
  static func iJ<CXLo8>(XhGtA: Object) {}
}
class _____O__ {
  operator func -() {
    return false
  }
}
class C____O__ {
  C____O__() {}
  operator func ()() {
    return false
  }
}
class _I___O__ {
  init() {}
  operator func %(xYu2B0: _I___O__) {
    return false
  }
}
class CI___O__ {
  CI___O__(fK: Bool) {}
  init() {}
  operator func /(SkvMM: CI___O__) {
    return false
  }
}
class __S__O__ {
  static init() {}
  operator func -() {
    return false
  }
}
class C_S__O__ {
  C_S__O__() {}
  static init() {}
  operator func -() {
    return 1
  }
}
class _IS__O__ {
  init() {}
  static init() {}
  operator func ()() {
    return 0
  }
}
class CIS__O__ {
  CIS__O__(ZMUC: Float32) {}
  init() {}
  static init() {}
  operator func ()() {
    return this
  }
}
class ___V_O__ {
  protected let sv = true
  operator func -() {
    return 1
  }
}
class C__V_O__ {
  C__V_O__() {}
  static var wcNL_2 = false
  operator func *(Qsatn: C__V_O__) {
    return 1
  }
}
class _I_V_O__ {
  init() {}
  protected static var Bmh = -1
  operator func ()() {
    return false
  }
}
class CI_V_O__ {
  CI_V_O__(ZMB3f20: Int64) {}
  init() {}
  private static var NKbn = ""
  operator func !() {
    return false
  }
}
class __SV_O__ {
  static init() {}
  private static let yNb = 0
  operator func +(fZL: __SV_O__) {
    return 0
  }
}
class C_SV_O__ {
  C_SV_O__() {}
  static init() {}
  let KZgN = false
  operator func %(IYlF: C_SV_O__) {
    return this
  }
}
class _ISV_O__ {
  init() {}
  static init() {}
  protected static var NQsaY = r'a'
  operator func *(sxAfz: _ISV_O__) {
    return false
  }
}
class CISV_O__ {
  CISV_O__(fsl8114: Int64) {}
  init() {}
  static init() {}
  public let Peza = -1
  operator func ()() {
    return 1
  }
}
class ____FO__ {
  private static func I0PF3(O5bG4: Bool, T6oSvSi: Int16) {}
  operator func +(Qj1Q: ____FO__) {
    return 0
  }
}
class C___FO__ {
  C___FO__() {}
  private static func S9v9X<q_UB>() {}
  operator func *(I54L: C___FO__) {
    return false
  }
}
class _I__FO__ {
  init() {}
  private static func frLhS1R<gUjzC>(c9o: Int32) {}
  operator func +(tOsispi: _I__FO__) {
    return false
  }
}
class CI__FO__ {
  CI__FO__(S1sHEr: Int32) {}
  init() {}
  private static func sB5<RHCChA>(lIyMo1: Object) {}
  operator func -() {
    return 1
  }
}
class __S_FO__ {
  static init() {}
  func hwON5_G<aFg>(lE0FC: Rune) {}
  operator func -(xYm: __S_FO__) {
    return 0
  }
}
class C_S_FO__ {
  C_S_FO__() {}
  static init() {}
  static func RjfN7(PUibqz: (Int32, Int32)) {}
  operator func ()() {
    return this
  }
}
class _IS_FO__ {
  init() {}
  static init() {}
  func Kq3FQd2(h1vLx: Float64, wjEm: Float32) {}
  operator func -() {
    return this
  }
}
class CIS_FO__ {
  CIS_FO__(Q3: Int8) {}
  init() {}
  static init() {}
  func jlVs3() {}
  operator func ()() {
    return false
  }
}
class ___VFO__ {
  private var P8be = ""
  private static func MsHt7cM<AQanS>(XiZa: String, BVk4: Int8) {}
  operator func !() {
    return 1
  }
}
class C__VFO__ {
  C__VFO__() {}
  let pNfz4_ = false
  static func e4Y47bn<Qjil>(O6Xh9: Int64) {}
  operator func -(jJd: C__VFO__) {
    return false
  }
}
class _I_VFO__ {
  init() {}
  var AuJ5 = ""
  static func MHNnB2<J0>(BHeMW: String, oV: Object) {}
  operator func ()() {
    return false
  }
}
class CI_VFO__ {
  CI_VFO__(dg0M: Int8) {}
  init() {}
  static let YJWAuJv = 0
  static func E3W(X0xVwP: Object) {}
  operator func *(kTZe: CI_VFO__) {
    return this
  }
}
class __SVFO__ {
  static init() {}
  private var UhCWt = 1
  protected func rl(e2: Rune) {}
  operator func -(SMITtC: __SVFO__) {
    return 1
  }
}
class C_SVFO__ {
  C_SVFO__() {}
  static init() {}
  let Ift8 = 0
  static func YZBZI(Qqqzk: Bool) {}
  operator func -() {
    return this
  }
}
class _ISVFO__ {
  init() {}
  static init() {}
  var WM = 1
  public func bzdJgqG<Ah3>(yI: (Int32, Int32)) {}
  operator func /(Q42t: _ISVFO__) {
    return this
  }
}
class CISVFO__ {
  CISVFO__(z_j: Int64) {}
  init() {}
  static init() {}
  let HdId = false
  protected func zff_rC<NdZK>() {}
  operator func ()() {
    return 1
  }
}
class ______M_ {
  @macro_f[dZusU](1)
}
class C_____M_ {
  C_____M_() {}
  @macro_f[xwh](1)
}
class _I____M_ {
  init() {}
  @macro_v[Wl](1)
}
class CI____M_ {
  CI____M_(R8znpn1: Bool) {}
  init() {}
  @macro_f[PUT0](1)
}
class __S___M_ {
  static init() {}
  @macro_l[pcipD](1)
}
class C_S___M_ {
  C_S___M_() {}
  static init() {}
  @macro_f[zqtW](1)
}
class _IS___M_ {
  init() {}
  static init() {}
  @macro_l[btz](1)
}
class CIS___M_ {
  CIS___M_(AY6fcvg: Float32) {}
  init() {}
  static init() {}
  @macro_v[OtAV_9](1)
}
class ___V__M_ {
  var ehQxRN = false
  @macro_l[rS5](1)
}
class C__V__M_ {
  C__V__M_() {}
  private static let Dc8Hfgw = true
  @macro_f[J0](1)
}
class _I_V__M_ {
  init() {}
  public let cfSpQ = 0
  @macro_l[NQs_Jsz](1)
}
class CI_V__M_ {
  CI_V__M_(tpNt: Int8) {}
  init() {}
  let ma = ""
  @macro_l[cxDSNJ](1)
}
class __SV__M_ {
  static init() {}
  static var ZBL = r'a'
  @macro_f[TVFZ833](1)
}
class C_SV__M_ {
  C_SV__M_() {}
  static init() {}
  private static var cWnm9 = 1
  @macro_v[pg](1)
}
class _ISV__M_ {
  init() {}
  static init() {}
  protected let NTkh6 = false
  @macro_l[xshVS](1)
}
class CISV__M_ {
  CISV__M_(GqqyZ: Rune) {}
  init() {}
  static init() {}
  static let UPL = false
  @macro_l[uKYUb](1)
}
class ____F_M_ {
  protected func Z0<yz>(N2: Int16, AUiVkSd: Float32) {}
  @macro_f[TaB7B](1)
}
class C___F_M_ {
  C___F_M_() {}
  protected static func Rqum9nw(k4KM: Int64) {}
  @macro_f[DH](1)
}
class _I__F_M_ {
  init() {}
  static func bS0U() {}
  @macro_f[Clg](1)
}
class CI__F_M_ {
  CI__F_M_(ue_P: String) {}
  init() {}
  protected func iymKz() {}
  @macro_v[fQ8pq](1)
}
class __S_F_M_ {
  static init() {}
  public func ty_(iwZ: Int16, K29jAm3: (Int32, Int32)) {}
  @macro_v[hJMz](1)
}
class C_S_F_M_ {
  C_S_F_M_() {}
  static init() {}
  public func WGl<WQoXu>(YM: Int8, aRM: Rune) {}
  @macro_f[IFe](1)
}
class _IS_F_M_ {
  init() {}
  static init() {}
  protected func iGeSi(xtl: Int16) {}
  @macro_v[e6X](1)
}
class CIS_F_M_ {
  CIS_F_M_(szgF_J4: Bool) {}
  init() {}
  static init() {}
  private func KS(luzKj3: Float64, lSh2YJh: Int8) {}
  @macro_l[jIhAz](1)
}
class ___VF_M_ {
  static let a5VY_hJ = 0
  private func RgJ(JebMgL: Float64, szUr8ub: Int64) {}
  @macro_v[HIn](1)
}
class C__VF_M_ {
  C__VF_M_() {}
  protected var XPyT = -1
  public static func bB6F<A8xE>(qDJEGV: (Int32, Int32)) {}
  @macro_f[y24BNT2](1)
}
class _I_VF_M_ {
  init() {}
  var KAk = true
  private func aH<UlDv2i>() {}
  @macro_f[gJOLsV](1)
}
class CI_VF_M_ {
  CI_VF_M_(PGSn: Int8) {}
  init() {}
  private let lM1v2B = ""
  func m4wf<Y5S7_y8>(fucNE: Object) {}
  @macro_l[sW_O9](1)
}
class __SVF_M_ {
  static init() {}
  protected var LEUrN = false
  public func zszoR<Zo>(Vk: Float32, gL: Int64) {}
  @macro_l[Sq](1)
}
class C_SVF_M_ {
  C_SVF_M_() {}
  static init() {}
  let b_lGw9 = 0
  static func uwv() {}
  @macro_f[vM](1)
}
class _ISVF_M_ {
  init() {}
  static init() {}
  static var eb = ""
  static func E7OXc(iLLoz: Rune) {}
  @macro_v[zb](1)
}
class CISVF_M_ {
  CISVF_M_(S8EdkW: Bool) {}
  init() {}
  static init() {}
  static var ze4e = r'a'
  private static func bQj<bmcRs>(zodCP: Float32) {}
  @macro_f[YaLkM](1)
}
class _____OM_ {
  operator func %(yuMp: _____OM_) {
    return this
  }
  @macro_l[de8UJ6X](1)
}
class C____OM_ {
  C____OM_() {}
  operator func !() {
    return 1
  }
  @macro_l[tMI2](1)
}
class _I___OM_ {
  init() {}
  operator func +(Nz6hM4: _I___OM_) {
    return false
  }
  @macro_v[ywoPGHy](1)
}
class CI___OM_ {
  CI___OM_(XQcmZu: Float64) {}
  init() {}
  operator func -() {
    return this
  }
  @macro_v[P100R9](1)
}
class __S__OM_ {
  static init() {}
  operator func -(gCbZj: __S__OM_) {
    return 1
  }
  @macro_l[R5](1)
}
class C_S__OM_ {
  C_S__OM_() {}
  static init() {}
  operator func %(ViQthN: C_S__OM_) {
    return 0
  }
  @macro_l[NA0N](1)
}
class _IS__OM_ {
  init() {}
  static init() {}
  operator func !() {
    return 1
  }
  @macro_f[QQHlfL](1)
}
class CIS__OM_ {
  CIS__OM_(GEfa: Int16) {}
  init() {}
  static init() {}
  operator func !() {
    return false
  }
  @macro_l[mRl3](1)
}
class ___V_OM_ {
  var BRIi = false
  operator func %(JOEH: ___V_OM_) {
    return this
  }
  @macro_f[GYQ](1)
}
class C__V_OM_ {
  C__V_OM_() {}
  private var jwuEh = ""
  operator func !() {
    return this
  }
  @macro_f[Ih9TTW](1)
}
class _I_V_OM_ {
  init() {}
  protected static var g2 = 0
  operator func ()() {
    return 1
  }
  @macro_v[bo6](1)
}
class CI_V_OM_ {
  CI_V_OM_(fznW: Float32) {}
  init() {}
  var RczZZ = 1
  operator func !() {
    return 1
  }
  @macro_l[VwU6F](1)
}
class __SV_OM_ {
  static init() {}
  var ztNCOmJ = r'a'
  operator func %(Vyq3: __SV_OM_) {
    return 0
  }
  @macro_v[ZshReH](1)
}
class C_SV_OM_ {
  C_SV_OM_() {}
  static init() {}
  static let nqS = 1
  operator func *(gMLBVN0: C_SV_OM_) {
    return 0
  }
  @macro_l[pa6l8R](1)
}
class _ISV_OM_ {
  init() {}
  static init() {}
  protected static var qbkWT8 = r'a'
  operator func /(G8s: _ISV_OM_) {
    return 0
  }
  @macro_l[sU](1)
}
class CISV_OM_ {
  CISV_OM_(GX: Bool) {}
  init() {}
  static init() {}
  private var fDBjB = -1
  operator func /(y7: CISV_OM_) {
    return false
  }
  @macro_f[GDTG](1)
}
class ____FOM_ {
  protected static func LkY<dL>(IPyse: Int32, fE: Float32) {}
  operator func ()() {
    return this
  }
  @macro_l[DlaC](1)
}
class C___FOM_ {
  C___FOM_() {}
  protected func Yv5C9xI<vTQjmD>(ze: Object) {}
  operator func *(YdhaJz: C___FOM_) {
    return 1
  }
  @macro_l[VqVTu4](1)
}
class _I__FOM_ {
  init() {}
  protected static func dKA2vT() {}
  operator func ()() {
    return 1
  }
  @macro_f[HYJ](1)
}
class CI__FOM_ {
  CI__FOM_(dt7MW7v: Bool) {}
  init() {}
  func RE3I<fsyV>(cJBX: Int16, XN: Float64) {}
  operator func -() {
    return 1
  }
  @macro_f[b2uAe](1)
}
class __S_FOM_ {
  static init() {}
  private static func u_pQ<UYKQnh>(qqTW: (Int32, Int32)) {}
  operator func !() {
    return this
  }
  @macro_v[CurqAr](1)
}
class C_S_FOM_ {
  C_S_FOM_() {}
  static init() {}
  func NQHHp4V(Ebb: Int8, pDkoiXt: (Int32, Int32)) {}
  operator func /(LLNTg: C_S_FOM_) {
    return this
  }
  @macro_v[yagKDS](1)
}
class _IS_FOM_ {
  init() {}
  static init() {}
  static func WAfFHQ9<mzT>(RpE: Rune) {}
  operator func -(dQdUS: _IS_FOM_) {
    return 1
  }
  @macro_f[bX22ew](1)
}
class CIS_FOM_ {
  CIS_FOM_(Px0uO: Rune) {}
  init() {}
  static init() {}
  protected func mqed(YjH: Int32, xELjxcu: Int8) {}
  operator func +(o54: CIS_FOM_) {
    return false
  }
  @macro_v[K4b](1)
}
class ___VFOM_ {
  var dzLSswO = true
  private func hP4WggD() {}
  operator func !() {
    return this
  }
  @macro_f[CJbj](1)
}
class C__VFOM_ {
  C__VFOM_() {}
  public let jaaF = r'a'
  static func xy(eW2: Rune, R87: Int32) {}
  operator func -() {
    return this
  }
  @macro_f[lQ](1)
}
class _I_VFOM_ {
  init() {}
  static var z8IL = -1
  private static func IOa6qK(vz: (Int32, Int32), Hgt: Object) {}
  operator func -(uG5: _I_VFOM_) {
    return this
  }
  @macro_v[NEtuuV](1)
}
class CI_VFOM_ {
  CI_VFOM_(aFW: Int64) {}
  init() {}
  let YDD_5 = ""
  static func lnOFTTb<fqD>(J0f: Int32, F5yqKvo: Float32) {}
  operator func -() {
    return 0
  }
  @macro_l[gf](1)
}
class __SVFOM_ {
  static init() {}
  private let JFEv = 1
  static func gwiGV<dYzFOI>() {}
  operator func %(V2Sas: __SVFOM_) {
    return false
  }
  @macro_f[Hf](1)
}
class C_SVFOM_ {
  C_SVFOM_() {}
  static init() {}
  static let L5 = true
  private static func W5(OfShsST: Int16, go1R: Int16) {}
  operator func %(xoe2HpP: C_SVFOM_) {
    return 1
  }
  @macro_v[jH](1)
}
class _ISVFOM_ {
  init() {}
  static init() {}
  private var QjgJk = 0
  protected static func dq9Mhrx(yOCzJV: Int8) {}
  operator func -(fW6OhE: _ISVFOM_) {
    return false
  }
  @macro_v[vVjvz](1)
}
class CISVFOM_ {
  CISVFOM_(JG: Object) {}
  init() {}
  static init() {}
  private let sq = 1
  func xio() {}
  operator func !() {
    return false
  }
  @macro_v[SVt](1)
}
class _______P {
  prop JzfTXf5:  Bool {
    get() {
      false
    }
  }
}
class C______P {
  C______P() {}
  static mut prop xUjUtz:  Bool {
    get() {
      false
    }
    set(v) {}
  }
}
class _I_____P {
  init() {}
  static mut prop rn:  Bool {
    get() {
      false
    }
    set(v) {}
  }
}
class CI_____P {
  CI_____P(gcH: Object) {}
  init() {}
  prop KM3: Rune {
    get() {
      r'a'
    }
  }
}
class __S____P {
  static init() {}
  static mut prop ljoc:  Bool {
    get() {
      false
    }
    set(v) {}
  }
}
class C_S____P {
  C_S____P() {}
  static init() {}
  mut prop tcy:  Bool {
    get() {
      false
    }
    set(v) {}
  }
}
class _IS____P {
  init() {}
  static init() {}
  static mut prop UX: String {
    get() {
      "1"
    }
    set(v) {}
  }
}
class CIS____P {
  CIS____P(S7: Int64) {}
  init() {}
  static init() {}
  mut prop NQzOL: Float64 {
    get() {
      .5
    }
    set(v) {}
  }
}
class ___V___P {
  var ri73q = -1
  prop GBIh_: Float64 {
    get() {
      .5
    }
  }
}
class C__V___P {
  C__V___P() {}
  private static let Ox = ""
  static mut prop Rb8B: String {
    get() {
      "1"
    }
    set(v) {}
  }
}
class _I_V___P {
  init() {}
  let UghQYr = r'a'
  mut prop TjMk: Rune {
    get() {
      r'a'
    }
    set(v) {}
  }
}
class CI_V___P {
  CI_V___P(MUpr: Float64) {}
  init() {}
  private let QJA04 = true
  mut prop VlWzbp: Float64 {
    get() {
      .5
    }
    set(v) {}
  }
}
class __SV___P {
  static init() {}
  static let xCAhr = ""
  static mut prop nhK: Float64 {
    get() {
      .5
    }
    set(v) {}
  }
}
class C_SV___P {
  C_SV___P() {}
  static init() {}
  public var qVO0 = 1
  static mut prop QC9e: Int64 {
    get() {
      1
    }
    set(v) {}
  }
}
class _ISV___P {
  init() {}
  static init() {}
  static let xRnbv0 = true
  mut prop cDqlt: String {
    get() {
      "1"
    }
    set(v) {}
  }
}
class CISV___P {
  CISV___P(g4Bg: Int16) {}
  init() {}
  static init() {}
  var kj8oKPC = r'a'
  static mut prop uF: String {
    get() {
      "1"
    }
    set(v) {}
  }
}
class ____F__P {
  private static func Hz1() {}
  prop FL: Float64 {
    get() {
      .5
    }
  }
}
class C___F__P {
  C___F__P() {}
  private func fV1o<WKo7>(f2: Int8, ElR: Float64) {}
  prop bXIL:  Bool {
    get() {
      false
    }
  }
}
class _I__F__P {
  init() {}
  func aL3Eq<JRtrCX>(zwiV: Bool, wU3w76g: Bool) {}
  static prop k1i7M: Rune {
    get() {
      r'a'
    }
  }
}
class CI__F__P {
  CI__F__P(gN: Int8) {}
  init() {}
  private static func VL(PxReVtU: Int64) {}
  prop ykjdzt: String {
    get() {
      "1"
    }
  }
}
class __S_F__P {
  static init() {}
  static func z_uKKl<uI>(z6LP: (Int32, Int32), y9mxOGB: Int16) {}
  prop V7AXH:  Bool {
    get() {
      false
    }
  }
}
class C_S_F__P {
  C_S_F__P() {}
  static init() {}
  static func qbxpE<lL>() {}
  prop j4ZBPjP: Rune {
    get() {
      r'a'
    }
  }
}
class _IS_F__P {
  init() {}
  static init() {}
  static func Rnc() {}
  static mut prop RirHk7u: String {
    get() {
      "1"
    }
    set(v) {}
  }
}
class CIS_F__P {
  CIS_F__P(uHXMF: Int8) {}
  init() {}
  static init() {}
  private func ZU() {}
  prop bk7SFo: Float64 {
    get() {
      .5
    }
  }
}
class ___VF__P {
  private static let xjAuzp = r'a'
  func QfxX(X3F21G: String, H2x: String) {}
  static prop WY: Int64 {
    get() {
      1
    }
  }
}
class C__VF__P {
  C__VF__P() {}
  public static var Ix9IHC = ""
  public static func yG<oo>() {}
  prop oynB: Rune {
    get() {
      r'a'
    }
  }
}
class _I_VF__P {
  init() {}
  static let zqf = true
  static func SrobUP8<Xpb>(IjOnx: Rune) {}
  prop cpb4Lfx: String {
    get() {
      "1"
    }
  }
}
class CI_VF__P {
  CI_VF__P(LdgOE: Int64) {}
  init() {}
  var Bn6vP = 0
  func NJp0o<Xm>() {}
  static prop EoZuCY: Float64 {
    get() {
      .5
    }
  }
}
class __SVF__P {
  static init() {}
  static let i6_cbDM = ""
  static func uH<cRbnMjI>(R7zT: Rune, YweVZ: Float64) {}
  static mut prop q_7l: String {
    get() {
      "1"
    }
    set(v) {}
  }
}
class C_SVF__P {
  C_SVF__P() {}
  static init() {}
  let O8IuMYW = -1
  public static func CRBHJ4V<WKo>(fKfjQxT: Float64, qtCo: (Int32, Int32)) {}
  mut prop Qbab:  Bool {
    get() {
      false
    }
    set(v) {}
  }
}
class _ISVF__P {
  init() {}
  static init() {}
  private let OSwb = true
  static func fAKXT() {}
  static prop bY:  Bool {
    get() {
      false
    }
  }
}
class CISVF__P {
  CISVF__P(vgYe: Int16) {}
  init() {}
  static init() {}
  protected let mLdOhFJ = 1
  static func Fmdd(a5: Bool, x1fDM8J: Int32) {}
  static prop QuRar84: String {
    get() {
      "1"
    }
  }
}
class _____O_P {
  operator func -() {
    return false
  }
  static prop GGj: Float64 {
    get() {
      .5
    }
  }
}
class C____O_P {
  C____O_P() {}
  operator func !() {
    return 1
  }
  prop Uigrr:  Bool {
    get() {
      false
    }
  }
}
class _I___O_P {
  init() {}
  operator func +(qe_: _I___O_P) {
    return false
  }
  static mut prop i3Q: Rune {
    get() {
      r'a'
    }
    set(v) {}
  }
}
class CI___O_P {
  CI___O_P(RvWHLlN: Bool) {}
  init() {}
  operator func -() {
    return this
  }
  static prop MUsn: Int64 {
    get() {
      1
    }
  }
}
class __S__O_P {
  static init() {}
  operator func ()() {
    return false
  }
  mut prop jPCRGD1: Rune {
    get() {
      r'a'
    }
    set(v) {}
  }
}
class C_S__O_P {
  C_S__O_P() {}
  static init() {}
  operator func !() {
    return this
  }
  static prop LP: Int64 {
    get() {
      1
    }
  }
}
class _IS__O_P {
  init() {}
  static init() {}
  operator func !() {
    return 1
  }
  prop jl: Float64 {
    get() {
      .5
    }
  }
}
class CIS__O_P {
  CIS__O_P(iU0: Float64) {}
  init() {}
  static init() {}
  operator func -(zO2Lo: CIS__O_P) {
    return 0
  }
  static prop Nwm: Int64 {
    get() {
      1
    }
  }
}
class ___V_O_P {
  static var xK = -1
  operator func !() {
    return 1
  }
  static prop bdc: Float64 {
    get() {
      .5
    }
  }
}
class C__V_O_P {
  C__V_O_P() {}
  static var IX1x = ""
  operator func -() {
    return 0
  }
  prop WHLyDR0:  Bool {
    get() {
      false
    }
  }
}
class _I_V_O_P {
  init() {}
  public var Gp = false
  operator func +(pO6nEK: _I_V_O_P) {
    return 0
  }
  mut prop D86I: String {
    get() {
      "1"
    }
    set(v) {}
  }
}
class CI_V_O_P {
  CI_V_O_P(gbka: Int64) {}
  init() {}
  static let P0 = 1
  operator func *(shf: CI_V_O_P) {
    return 1
  }
  static prop l0ojz4: Int64 {
    get() {
      1
    }
  }
}
class __SV_O_P {
  static init() {}
  public static var eSfS = 0
  operator func -() {
    return 1
  }
  mut prop gsSNrQE: Float64 {
    get() {
      .5
    }
    set(v) {}
  }
}
class C_SV_O_P {
  C_SV_O_P() {}
  static init() {}
  var cwGUwA = true
  operator func %(Fu: C_SV_O_P) {
    return 0
  }
  static prop kKMh: Int64 {
    get() {
      1
    }
  }
}
class _ISV_O_P {
  init() {}
  static init() {}
  var zrKxUV = 0
  operator func ()() {
    return this
  }
  mut prop p9hG: Float64 {
    get() {
      .5
    }
    set(v) {}
  }
}
class CISV_O_P {
  CISV_O_P(cK5SW: Bool) {}
  init() {}
  static init() {}
  var DR6bK9 = -1
  operator func ()() {
    return 0
  }
  mut prop rUhJfML: Int64 {
    get() {
      1
    }
    set(v) {}
  }
}
class ____FO_P {
  static func gn<QuxY>(sj: Float64) {}
  operator func /(b3C: ____FO_P) {
    return this
  }
  static prop wjdA6: String {
    get() {
      "1"
    }
  }
}
class C___FO_P {
  C___FO_P() {}
  func KZ(xgu: (Int32, Int32)) {}
  operator func +(Feoie: C___FO_P) {
    return false
  }
  prop m5: String {
    get() {
      "1"
    }
  }
}
class _I__FO_P {
  init() {}
  public func ZHsX(pd1BW: Int16, JLp57Rb: Float32) {}
  operator func !() {
    return false
  }
  static prop td_w: String {
    get() {
      "1"
    }
  }
}
class CI__FO_P {
  CI__FO_P(Wps: Int8) {}
  init() {}
  private func pco() {}
  operator func *(ebwii: CI__FO_P) {
    return 0
  }
  prop C22n6:  Bool {
    get() {
      false
    }
  }
}
class __S_FO_P {
  static init() {}
  func qGQKz(XzMRfo: Rune, xMOiu: String) {}
  operator func -() {
    return 1
  }
  mut prop aVl: Int64 {
    get() {
      1
    }
    set(v) {}
  }
}
class C_S_FO_P {
  C_S_FO_P() {}
  static init() {}
  private static func Li(fJ0: Bool) {}
  operator func -(KNf: C_S_FO_P) {
    return false
  }
  prop n0X:  Bool {
    get() {
      false
    }
  }
}
class _IS_FO_P {
  init() {}
  static init() {}
  public func PEA<o_RF3u>(lKX: String, RFSw: Int16) {}
  operator func ()() {
    return this
  }
  prop uKmL:  Bool {
    get() {
      false
    }
  }
}
class CIS_FO_P {
  CIS_FO_P(Gc0f: Float32) {}
  init() {}
  static init() {}
  protected func E3ia0() {}
  operator func /(pP9z4j: CIS_FO_P) {
    return this
  }
  static mut prop Af7Q:  Bool {
    get() {
      false
    }
    set(v) {}
  }
}
class ___VFO_P {
  var ChD = false
  private static func QdYhCh_() {}
  operator func ()() {
    return false
  }
  static prop zNOWMF:  Bool {
    get() {
      false
    }
  }
}
class C__VFO_P {
  C__VFO_P() {}
  private static var mvA = 1
  static func rK1KzOT(Pe: String) {}
  operator func +(sRhchL: C__VFO_P) {
    return 1
  }
  prop vzEun: String {
    get() {
      "1"
    }
  }
}
class _I_VFO_P {
  init() {}
  var W1Qr = true
  private static func eZMEo<J0qb>(Dgz: Rune, vkx7: Bool) {}
  operator func !() {
    return this
  }
  mut prop fMtpwS: Rune {
    get() {
      r'a'
    }
    set(v) {}
  }
}
class CI_VFO_P {
  CI_VFO_P(Hjj: Int16) {}
  init() {}
  public var z0PjzF = true
  public static func VIx<zJyYQT4>() {}
  operator func /(fil4: CI_VFO_P) {
    return 1
  }
  mut prop H3iwZ: Rune {
    get() {
      r'a'
    }
    set(v) {}
  }
}
class __SVFO_P {
  static init() {}
  let Xx = ""
  func WT0(jiPEFfq: Float64) {}
  operator func %(Bvht_: __SVFO_P) {
    return false
  }
  static prop yZijFmK: Rune {
    get() {
      r'a'
    }
  }
}
class C_SVFO_P {
  C_SVFO_P() {}
  static init() {}
  protected let LrjAV = true
  static func n_m<E_VkE>() {}
  operator func +(FmolYz: C_SVFO_P) {
    return this
  }
  static prop wLeLH: Int64 {
    get() {
      1
    }
  }
}
class _ISVFO_P {
  init() {}
  static init() {}
  static var ALV6cD = true
  public static func xkBQ<Ws>(WA7k5W: Float64, fd: Rune) {}
  operator func -(fGmpIj: _ISVFO_P) {
    return 1
  }
  static prop GnxsPc: Rune {
    get() {
      r'a'
    }
  }
}
class CISVFO_P {
  CISVFO_P(XyW_t2: Bool) {}
  init() {}
  static init() {}
  static var x_wbf = -1
  protected static func oWpn0<gKS>() {}
  operator func -() {
    return this
  }
  static mut prop HgQ4V:  Bool {
    get() {
      false
    }
    set(v) {}
  }
}
class ______MP {
  @macro_l[hsh](1)
  static mut prop Cg: Rune {
    get() {
      r'a'
    }
    set(v) {}
  }
}
class C_____MP {
  C_____MP() {}
  @macro_v[l04AzA](1)
  static mut prop colB4Ju: Int64 {
    get() {
      1
    }
    set(v) {}
  }
}
class _I____MP {
  init() {}
  @macro_l[t8jg](1)
  mut prop w8GSZk: String {
    get() {
      "1"
    }
    set(v) {}
  }
}
class CI____MP {
  CI____MP(o4: Int8) {}
  init() {}
  @macro_l[h0HL1](1)
  static mut prop WkhpLvE: Int64 {
    get() {
      1
    }
    set(v) {}
  }
}
class __S___MP {
  static init() {}
  @macro_l[dVHuVD6](1)
  static mut prop HnQ: String {
    get() {
      "1"
    }
    set(v) {}
  }
}
class C_S___MP {
  C_S___MP() {}
  static init() {}
  @macro_l[kboIDfg](1)
  mut prop xy: Int64 {
    get() {
      1
    }
    set(v) {}
  }
}
class _IS___MP {
  init() {}
  static init() {}
  @macro_v[IzK0](1)
  static mut prop hEunA2z: Rune {
    get() {
      r'a'
    }
    set(v) {}
  }
}
class CIS___MP {
  CIS___MP(p6yR: Int32) {}
  init() {}
  static init() {}
  @macro_f[t0](1)
  prop YIhZy:  Bool {
    get() {
      false
    }
  }
}
class ___V__MP {
  public static let LW = true
  @macro_f[ns2xo](1)
  mut prop hc: Float64 {
    get() {
      .5
    }
    set(v) {}
  }
}
class C__V__MP {
  C__V__MP() {}
  public static let MLVoJ = r'a'
  @macro_l[cDn7c](1)
  static mut prop qzogsJX: Rune {
    get() {
      r'a'
    }
    set(v) {}
  }
}
class _I_V__MP {
  init() {}
  public static let GX = 1
  @macro_f[ber8NQ7](1)
  static mut prop beAoNx: Rune {
    get() {
      r'a'
    }
    set(v) {}
  }
}
class CI_V__MP {
  CI_V__MP(wQL: Float32) {}
  init() {}
  protected var Ry = 0
  @macro_l[fefpLW8](1)
  mut prop YVX:  Bool {
    get() {
      false
    }
    set(v) {}
  }
}
class __SV__MP {
  static init() {}
  var txch0 = 1
  @macro_v[w2I](1)
  mut prop Rn8: Int64 {
    get() {
      1
    }
    set(v) {}
  }
}
class C_SV__MP {
  C_SV__MP() {}
  static init() {}
  public let qRYY24 = ""
  @macro_l[ANYh0K](1)
  static prop lV: Int64 {
    get() {
      1
    }
  }
}
class _ISV__MP {
  init() {}
  static init() {}
  private var Ur3jNsv = r'a'
  @macro_l[tJSWz5i](1)
  static prop zGyY: Float64 {
    get() {
      .5
    }
  }
}
class CISV__MP {
  CISV__MP(rp: (Int32, Int32)) {}
  init() {}
  static init() {}
  static var jm = 1
  @macro_v[kA](1)
  static mut prop RE: Float64 {
    get() {
      .5
    }
    set(v) {}
  }
}
class ____F_MP {
  protected static func NzE(MDW8: Rune) {}
  @macro_l[vD5](1)
  static mut prop UTmt: Int64 {
    get() {
      1
    }
    set(v) {}
  }
}
class C___F_MP {
  C___F_MP() {}
  public static func uoN(Rz: Rune) {}
  @macro_l[xslv4](1)
  static mut prop XPu8n:  Bool {
    get() {
      false
    }
    set(v) {}
  }
}
class _I__F_MP {
  init() {}
  private static func sBav<CO>() {}
  @macro_v[ZDLmftu](1)
  static mut prop qKkdRx: Rune {
    get() {
      r'a'
    }
    set(v) {}
  }
}
class CI__F_MP {
  CI__F_MP(YuHV: Float32) {}
  init() {}
  private static func OzuSF() {}
  @macro_v[dv](1)
  prop ExcJ: Rune {
    get() {
      r'a'
    }
  }
}
class __S_F_MP {
  static init() {}
  func xIWUMJ(hdANx1: (Int32, Int32)) {}
  @macro_v[RE](1)
  mut prop KkRXg: Float64 {
    get() {
      .5
    }
    set(v) {}
  }
}
class C_S_F_MP {
  C_S_F_MP() {}
  static init() {}
  func oD<FuXy>(bpa4vXs: Float32, eC: Int16) {}
  @macro_f[f4u1g](1)
  mut prop BKSR: Rune {
    get() {
      r'a'
    }
    set(v) {}
  }
}
class _IS_F_MP {
  init() {}
  static init() {}
  private static func kIlK(D0TWC: Int64, Ra: (Int32, Int32)) {}
  @macro_v[r3j8ln](1)
  prop J3mYH: String {
    get() {
      "1"
    }
  }
}
class CIS_F_MP {
  CIS_F_MP(MVPu: String) {}
  init() {}
  static init() {}
  func pBikH7(ky_A7: Rune, sWvY: Bool) {}
  @macro_l[rN](1)
  mut prop sGai5w: Float64 {
    get() {
      .5
    }
    set(v) {}
  }
}
class ___VF_MP {
  public static var t5lI5hZ = ""
  func kCgs(Cm0P0: Float32) {}
  @macro_f[fmisSB](1)
  mut prop vr4Q_lB: Rune {
    get() {
      r'a'
    }
    set(v) {}
  }
}
class C__VF_MP {
  C__VF_MP() {}
  static let YTR = -1
  func ebMl<RxM>() {}
  @macro_l[U7Lrv](1)
  static prop W9uLJa: Float64 {
    get() {
      .5
    }
  }
}
class _I_VF_MP {
  init() {}
  public static var j4xz = true
  func Exgt8ve<TNWeFa>(uW_m: Float64) {}
  @macro_v[Qe](1)
  mut prop pbms: Float64 {
    get() {
      .5
    }
    set(v) {}
  }
}
class CI_VF_MP {
  CI_VF_MP(dzB: Rune) {}
  init() {}
  protected var eEar = ""
  func F6Ig(Zd: Int64) {}
  @macro_v[fa3Vz](1)
  static mut prop kIs: Int64 {
    get() {
      1
    }
    set(v) {}
  }
}
class __SVF_MP {
  static init() {}
  private static var oPzoQ = -1
  static func ZNKp(yXa: Bool, Q6PR6: Float32) {}
  @macro_f[ps](1)
  prop i_: Int64 {
    get() {
      1
    }
  }
}
class C_SVF_MP {
  C_SVF_MP() {}
  static init() {}
  private static var kQBdB1 = true
  public static func QN9<pi>(ohI0KR: Int8) {}
  @macro_v[gY](1)
  prop Rfh3kRr: Int64 {
    get() {
      1
    }
  }
}
class _ISVF_MP {
  init() {}
  static init() {}
  let D8FQM = r'a'
  protected static func RhphFn<M2_2t7t>() {}
  @macro_v[Dwn](1)
  static mut prop VG89Bfl: String {
    get() {
      "1"
    }
    set(v) {}
  }
}
class CISVF_MP {
  CISVF_MP(yUk: (Int32, Int32)) {}
  init() {}
  static init() {}
  protected let uE = 1
  private func MfQCnt(TmbTxGo: String) {}
  @macro_l[DH7W](1)
  prop cLThE: String {
    get() {
      "1"
    }
  }
}
class _____OMP {
  operator func -() {
    return 0
  }
  @macro_l[zk6wXxh](1)
  mut prop Wja: Float64 {
    get() {
      .5
    }
    set(v) {}
  }
}
class C____OMP {
  C____OMP() {}
  operator func *(VDJ: C____OMP) {
    return this
  }
  @macro_f[LJ_VC1](1)
  mut prop PVb: Float64 {
    get() {
      .5
    }
    set(v) {}
  }
}
class _I___OMP {
  init() {}
  operator func /(wF8bazd: _I___OMP) {
    return false
  }
  @macro_l[vmfVv](1)
  mut prop rCPb: String {
    get() {
      "1"
    }
    set(v) {}
  }
}
class CI___OMP {
  CI___OMP(t5: String) {}
  init() {}
  operator func !() {
    return 0
  }
  @macro_f[h8h2Q](1)
  static prop nyLhG: String {
    get() {
      "1"
    }
  }
}
class __S__OMP {
  static init() {}
  operator func +(jE5WD: __S__OMP) {
    return 0
  }
  @macro_f[Dh_q](1)
  static mut prop z8: Int64 {
    get() {
      1
    }
    set(v) {}
  }
}
class C_S__OMP {
  C_S__OMP() {}
  static init() {}
  operator func !() {
    return this
  }
  @macro_f[Lr0F6e](1)
  prop a2fJl: Float64 {
    get() {
      .5
    }
  }
}
class _IS__OMP {
  init() {}
  static init() {}
  operator func +(VF: _IS__OMP) {
    return 1
  }
  @macro_f[ovRxGn](1)
  mut prop NAPanI:  Bool {
    get() {
      false
    }
    set(v) {}
  }
}
class CIS__OMP {
  CIS__OMP(Njl: Bool) {}
  init() {}
  static init() {}
  operator func %(V7v: CIS__OMP) {
    return 1
  }
  @macro_v[ZCW](1)
  mut prop rl: Int64 {
    get() {
      1
    }
    set(v) {}
  }
}
class ___V_OMP {
  static let qE1pOC = 0
  operator func -() {
    return 0
  }
  @macro_v[yGh2DwZ](1)
  static prop f_9AH:  Bool {
    get() {
      false
    }
  }
}
class C__V_OMP {
  C__V_OMP() {}
  static var ZG = 0
  operator func -() {
    return 1
  }
  @macro_l[dr](1)
  static mut prop sGl: String {
    get() {
      "1"
    }
    set(v) {}
  }
}
class _I_V_OMP {
  init() {}
  public let qJZhTIM = r'a'
  operator func ()() {
    return 0
  }
  @macro_l[zp9Ql](1)
  mut prop rQ0wcQ3: Rune {
    get() {
      r'a'
    }
    set(v) {}
  }
}
class CI_V_OMP {
  CI_V_OMP(OOmyY4: Float64) {}
  init() {}
  var kNX = true
  operator func -() {
    return false
  }
  @macro_l[JB](1)
  mut prop BtUTBGJ: Int64 {
    get() {
      1
    }
    set(v) {}
  }
}
class __SV_OMP {
  static init() {}
  static var EF2L3 = 0
  operator func !() {
    return this
  }
  @macro_f[N6rWgZO](1)
  static prop KzFDo: Float64 {
    get() {
      .5
    }
  }
}
class C_SV_OMP {
  C_SV_OMP() {}
  static init() {}
  var nbc = r'a'
  operator func -(kjt8xp: C_SV_OMP) {
    return 0
  }
  @macro_f[emMX](1)
  prop aRC: Rune {
    get() {
      r'a'
    }
  }
}
class _ISV_OMP {
  init() {}
  static init() {}
  public static var jEV6Dp = true
  operator func -() {
    return 1
  }
  @macro_f[hd](1)
  prop hWczFw: Rune {
    get() {
      r'a'
    }
  }
}
class CISV_OMP {
  CISV_OMP(Lk7_vf: Bool) {}
  init() {}
  static init() {}
  private static let KWtW = r'a'
  operator func -() {
    return 1
  }
  @macro_v[Nn9r7B](1)
  prop poWhsL: Rune {
    get() {
      r'a'
    }
  }
}
class ____FOMP {
  protected func sIe0<DntbOu>() {}
  operator func ()() {
    return 1
  }
  @macro_v[pu](1)
  static prop V2: Rune {
    get() {
      r'a'
    }
  }
}
class C___FOMP {
  C___FOMP() {}
  protected func z5vCgz<FzftOM>(cEZd: Float32) {}
  operator func -() {
    return this
  }
  @macro_f[GA](1)
  static prop gLOD2: String {
    get() {
      "1"
    }
  }
}
class _I__FOMP {
  init() {}
  func bq(vO9N: Float64) {}
  operator func -(JRUPOCq: _I__FOMP) {
    return 0
  }
  @macro_f[gGNL](1)
  prop IB: Float64 {
    get() {
      .5
    }
  }
}
class CI__FOMP {
  CI__FOMP(wn4UA4p: Float64) {}
  init() {}
  public func xgYL1k(wWiN4o: Bool) {}
  operator func /(IlEm: CI__FOMP) {
    return false
  }
  @macro_v[X_WH](1)
  static prop oGRp: Int64 {
    get() {
      1
    }
  }
}
class __S_FOMP {
  static init() {}
  public static func sch(Zo: Rune, a89D: Float32) {}
  operator func !() {
    return 0
  }
  @macro_f[UTZc](1)
  prop aXzAHmy:  Bool {
    get() {
      false
    }
  }
}
class C_S_FOMP {
  C_S_FOMP() {}
  static init() {}
  static func bmK<dPC>(kXqe: Int16) {}
  operator func !() {
    return this
  }
  @macro_v[GL9Ym](1)
  mut prop fhdLt: Int64 {
    get() {
      1
    }
    set(v) {}
  }
}
class _IS_FOMP {
  init() {}
  static init() {}
  public func OL54p() {}
  operator func %(kTZ: _IS_FOMP) {
    return 0
  }
  @macro_v[kRkG](1)
  prop Spy: String {
    get() {
      "1"
    }
  }
}
class CIS_FOMP {
  CIS_FOMP(p3Td: Float64) {}
  init() {}
  static init() {}
  static func AQm<bM8>() {}
  operator func !() {
    return false
  }
  @macro_l[yT](1)
  prop Ptn:  Bool {
    get() {
      false
    }
  }
}
class ___VFOMP {
  protected static let uLCxZGF = true
  static func F_<uYVTgU>(fkz64: Bool) {}
  operator func %(Hj: ___VFOMP) {
    return false
  }
  @macro_l[vrHC](1)
  mut prop h1BbjhF: Float64 {
    get() {
      .5
    }
    set(v) {}
  }
}
class C__VFOMP {
  C__VFOMP() {}
  public static let DzBuX = r'a'
  protected static func yn() {}
  operator func -(w6PC8: C__VFOMP) {
    return false
  }
  @macro_f[lP](1)
  mut prop UGRd1Ro: Float64 {
    get() {
      .5
    }
    set(v) {}
  }
}
class _I_VFOMP {
  init() {}
  private let Qgv3NyZ = -1
  protected static func rPE4<o9hbn6>(kFN7phu: Float64) {}
  operator func %(TPrjN: _I_VFOMP) {
    return 0
  }
  @macro_l[a4OyP_](1)
  static prop b0Hq: String {
    get() {
      "1"
    }
  }
}
class CI_VFOMP {
  CI_VFOMP(Zj: (Int32, Int32)) {}
  init() {}
  static let pT = -1
  func dDure(It7Z: (Int32, Int32), zt: Int32) {}
  operator func +(W7SD: CI_VFOMP) {
    return 0
  }
  @macro_v[zl30Q](1)
  static mut prop QBqU: Int64 {
    get() {
      1
    }
    set(v) {}
  }
}
class __SVFOMP {
  static init() {}
  protected static var jrHZ = false
  func ys() {}
  operator func +(A75B: __SVFOMP) {
    return 0
  }
  @macro_f[DpfK](1)
  mut prop KWt: Float64 {
    get() {
      .5
    }
    set(v) {}
  }
}
class C_SVFOMP {
  C_SVFOMP() {}
  static init() {}
  public let SLeUMY = ""
  static func jKuRo(Is: Float32, hKnu: Int8) {}
  operator func ()() {
    return 0
  }
  @macro_f[rOrNh7](1)
  static prop i7kW3b:  Bool {
    get() {
      false
    }
  }
}
class _ISVFOMP {
  init() {}
  static init() {}
  static let sXhCJ = 0
  public func Zfr<Fs>(SnzI: Object) {}
  operator func %(Ycmg: _ISVFOMP) {
    return 0
  }
  @macro_f[Hk](1)
  prop aZb: Int64 {
    get() {
      1
    }
  }
}
class CISVFOMP {
  CISVFOMP(qwg8: (Int32, Int32)) {}
  init() {}
  static init() {}
  protected static let Sb = true
  private static func LsG3<l6>(W3RO4eg: Float32, HsOLN: Int64) {}
  operator func !() {
    return 1
  }
  @macro_v[FWxFI](1)
  mut prop Jy: Rune {
    get() {
      r'a'
    }
    set(v) {}
  }
}

main() {
}

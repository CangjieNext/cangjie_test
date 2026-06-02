/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_03_02_a06_08

  @Level:         1

  @Assertion:       1.3.2(6) The syntax of floating point literals is:
                       FloatLiteralSuffix
                           : 'f16' | 'f32' | 'f64'
                           ;
                       FloatLiteral
                           : (DecimalLiteral DecimalExponent
                                | DecimalFraction DecimalExponent?
                                | (DecimalLiteral DecimalFraction) DecimalExponent?) FloatLiteralSuffix?
                           | (Hexadecimalprefix (HexadecimalDigits
                                                | HexadecimalFraction
                                                | (HexadecimalDigits HexadecimalFraction)) HexadecimalExponent)
                       DecimalFraction
                           : '.' DecimalFragment
                           ;
                       DecimalFragment
                           : DecimalDigit (DecimalDigit | '_')*
                           ;
                       DecimalExponent
                           : FloatE Sign? DecimalFragment
                           ;
                       HexadecimalFraction
                           : '.' HexadecimalDigits
                           ;
                       HexadecimalExponent
                           : FloatP Sign? DecimalFragment
                           ;
                    FloatE
                    : [eE]
                    ;
                    FloatP
                    : [pP]
                    ;
                    Sign
                    : [-]
                    ;
                    Hexadecimalprefix
                        : '0' [xX]
                        ;

  @Description:     Check positive cases for `(Hexadecimalprefix (HexadecimalDigits
                                                                    | HexadecimalFraction
                                                                    | (HexadecimalDigits HexadecimalFraction)
                                                                ) HexadecimalExponent)`.

  @Mode:            run
  @Negative:        no
  @Structure:       single
*/

import utils.assert.Assert

main() {
    // Hexadecimalprefix HexadecimalDigits HexadecimalExponent
    let a = 0x01p0 + 0XaP00 + 0xAp0_ + 0X00P-000 + 0x0ap-00_ + 0x0AP0_0 + 0X0_p0__ + 0xa0P0000 + 0Xaap-000_ +
            0xaAP00_0 + 0Xa_p00__ + 0xA0P0_00 + 0XAap-0_0_ + 0xAAP0__0 + 0XA_p0___ + 0x000P-1 + 0X00ap-0 + 0x00AP0 +
            0X00_P-0 + 0x0a0p00 + 0X0aap-00 + 0x0aAP-00 + 0X0a_P0_ + 0x0A0p-0_ + 0X0AaP-0_ + 0x0AAp000 + 0X0A_P000 +
            0x0_0p-000 + 0X0_ap00_ + 0x0_AP00_ + 0X0__P-00_
    Assert.approxEquals(2121.0, a)
    // Hexadecimalprefix HexadecimalFraction HexadecimalExponent
    let b = 0x.01p0 - 0X.aP00 - 0x.Ap0_ - 0X.00P-000 - 0x.0ap-00_ - 0X.0AP0_0 - 0x.0_p0__ - 0X.a0P0000 - 0x.aap-000_ -
            0X.aAP00_0 - 0x.a_p00__ - 0X.A0P0_00 - 0x.Aap-0_0_ - 0X.AAP0__0 - 0x.A_p0___ - 0X.0A_P-1 - 0x.0_0p-0 -
            0X.0_aP0 - 0x.0_AP-0 - 0X.0__p00
    Assert.approxEquals(-6.578125, b)
    // Hexadecimalprefix HexadecimalDigits HexadecimalFraction HexadecimalExponent
    let c = 0x01.0p0 * 0Xa.aP0_0 * 0xA.AP0_00 * 0X00.00p-0 * 0x0a.0ap-00_ * 0X0A.0AP-00 * 0x0_.0_p-000_ *
            0Xa0.a0P00_0 * 0xaa.aap-0 * 0XaA.aAp0__ * 0xa_.a_p00_ * 0XA0.A0p0_ * 0xAa.AaP00 * 0XAA.0_ap-0_0_ *
            0xA_.0A_P0
    Assert.approxEquals(.0, c)
}

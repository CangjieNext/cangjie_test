/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_03_02_a06_06

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

  @Description:     Check positive cases for `(DecimalLiteral DecimalExponent
                                            | DecimalFraction DecimalExponent?
                                            | (DecimalLiteral DecimalFraction) DecimalExponent?) FloatLiteralSuffix?`
                    with the 'f32' suffix.

  @Mode:            run
  @Negative:        no
  @Structure:       single
*/

import utils.assert.Assert

main() {
    // DecimalLiteral DecimalExponent
    let a = 1e0f32 + 10e00f32 + 1_e0_f32 + 100e000f32 + 10_e00_f32 + 1_0e0_0f32 + 1__e0__f32 + 1000E0f32 + 100_E00f32 +
            10_0E0_f32 + 10__E000f32 + 1_00E00_f32 + 1_0_E0_0f32 + 1__0E0__f32 + 1___e-0f32 + 2e-00f32 + 3e-0_f32 +
            4e-000f32 + 5e-00_f32 + 6e-0_0f32 + 7e-0__f32 + 8E-0f32 + 9E-00f32 + 11E-0_f32 + 12E-000f32 + 13E-00_f32 +
            14E-0_0f32 + 15E-0__f32
    Assert.approxEquals(1573.0, a)
    // DecimalFraction DecimalExponent?
    let b = .0f32 - .00e0f32 - .0_e00f32 - .000e0_f32 - .00_e000f32 - .0_0e00_f32 - .0__e0_0f32 - .0000e0__f32 -
            .000_E0f32 - .00_0E00f32 - .00__E0_f32 - .0_00E000f32 - .0_0_E00_f32 - .0__0E0_0f32 - .0___E0__f32 -
            .1e-0f32 - .2e-00f32 - .3e-0_f32 - .4e-000f32 - .5e-00_f32 - .6e-0_0f32 - .7e-0__f32 - .8E-0f32 -
            .9E-00f32 - .01E-0_f32 - .02E-000f32 - .03E-00_f32 - .04E-0_0f32 - .05E-0__f32
    Assert.approxEquals(-4.65, b)
    // (DecimalLiteral DecimalFraction) DecimalExponent?
    let c = 1.0f32 + 10.00e0f32 + 1_.0_E0f32 + 100.000e-0f32 + 10_.00_E-0f32 + 1_0.0_0e00f32 + 1__.0__E00f32 +
            1000.0000e-00f32 + 100_.000_E-00f32 + 10_0.00_0e0_f32 + 10__.00__E0_f32 + 1_00.0_00e-0_f32 +
            1_0_.0_0_E-0_f32 + 1__0.0__0e000f32 + 1___.0___E000f32 + 2.1e-000f32
    Assert.approxEquals(1466.1, c)
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_03_02_a06_04

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
                    without suffixes.

  @Mode:            run
  @Negative:        no
  @Structure:       single
*/

import utils.assert.Assert

main() {
    // DecimalLiteral DecimalExponent
    let a = 1e0 + 10e00 + 1_e0_ + 100e000 + 10_e00_ + 1_0e0_0 + 1__e0__ + 1000E0 + 100_E00 + 10_0E0_ + 10__E000 +
            1_00E00_ + 1_0_E0_0 + 1__0E0__ + 1___e-0 + 2e-00 + 3e-0_ + 4e-000 + 5e-00_ + 6e-0_0 + 7e-0__ + 8E-0 +
            9E-00 + 11E-0_ + 12E-000 + 13E-00_ + 14E-0_0 + 15E-0__
    Assert.approxEquals(1573.0, a)
    // DecimalFraction DecimalExponent?
    let b = .0 - .00e0 - .0_e00 - .000e0_ - .00_e000 - .0_0e00_ - .0__e0_0 - .0000e0__ - .000_E0 - .00_0E00 -
            .00__E0_ - .0_00E000 - .0_0_E00_ - .0__0E0_0 - .0___E0__ - .1e-0 - .2e-00 - .3e-0_ - .4e-000 - .5e-00_ -
            .6e-0_0 - .7e-0__ - .8E-0 - .9E-00 - .01E-0_ - .02E-000 - .03E-00_ - .04E-0_0 - .05E-0__
    Assert.approxEquals(-4.65, b)
    // (DecimalLiteral DecimalFraction) DecimalExponent?
    let c = 1.0 * 10.00e0 * 1_.0_E0 * 100.000e-0 * 10_.00_E-0 * 1_0.0_0e00 * 1__.0__E00 * 1000.0000e-00 *
            100_.000_E-00 * 10_0.00_0e0_ * 10__.00__E0_ * 1_00.0_00e-0_ * 1_0_.0_0_E-0_ * 1__0.0__0e000 *
            1___.0___E000 * 2.1e-000
    Assert.approxEquals(2.1e17, c)
}

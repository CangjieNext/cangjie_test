/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_01_05_a02_01

  @Level:         1
  @Assertion:   A.1.5(2) 
                FloatLiteralSuffix
                    : 'f16' | 'f32' | 'f64'
                    ;
                FloatLiteral
                    : (DecimalLiteral DecimalExponent | DecimalFraction DecimalExponent? | (DecimalLiteral DecimalFraction) DecimalExponent?) FloatLiteralSuffix?
                    | ( Hexadecimalprefix (HexadecimalDigits | HexadecimalFraction | (HexadecimalDigits HexadecimalFraction)) HexadecimalExponent)
                    ;
                fragment DecimalFraction : '.' DecimalFragment;
                fragment DecimalExponent : FloatE Sign? DecimalFragment;
                fragment Sign : [-] ;
                fragment Hexadecimalprefix : '0' [xX] ;
                DecimalFraction : '.' DecimalLiteral ;
                DecimalExponent : FloatE Sign? DecimalLiteral ;
                HexadecimalFraction : '.' HexadecimalDigits ;
                HexadecimalExponent : FloatP Sign? DecimalFragment;
                FloatE : [eE] ;
                FloatP : [pP] ;
                Sign : [-] ;
                Hexadecimalprefix : '0' [xX] ;

  @Description: Check -0xFFffFFffp-1 as FloatLiteral
  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       6350
*/
import utils.assert.Assert

main() {
    // Check -0xFFffFFffp-1 symbol is Float32 type
    Assert.equals(-0xFFffFFffp-1, Float32(-0xFFffFFffp-1))
    return 0
}

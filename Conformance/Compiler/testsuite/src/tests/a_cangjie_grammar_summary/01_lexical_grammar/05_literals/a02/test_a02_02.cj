/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion:   A.1.5(2) 
                FloatLiteralSuffix
                    : 'f16' | 'f32' | 'f64'
                    ;
                FloatLiteral
                    : (DecimalLiteral DecimalExponent | DecimalFraction DecimalExponent?
                        | (DecimalLiteral DecimalFraction) DecimalExponent?) FloatLiteralSuffix?
                    | ( Hexadecimalprefix (HexadecimalDigits | HexadecimalFraction
                        | (HexadecimalDigits HexadecimalFraction)) HexadecimalExponent)
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

  @Description: Check various floating point number representations as FloatLiteral
  @Level:         1
  @Comment:     Auto-generated tests by gen_literals_tests_a02.py with seed = 1
  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       0006075
*/
import utils.assert.Assert

main() {
    
    // Check 2e4f16 symbol is Float16 type
    Assert.equals(2e4f16, Float16(2e4f16))

    // Check -20_000.0f16 symbol is Float16 type
    Assert.equals(-20_000.0f16, Float16(-20_000.0f16))

    // Check 1e-2f16 symbol is Float16 type
    Assert.equals(1e-2f16, Float16(1e-2f16))

    // Check .8e1f16 symbol is Float16 type
    Assert.equals(.8e1f16, Float16(.8e1f16))

    // Check 0x.1p1 symbol is Float16 type
    Assert.equals(0x.1p1, Float16(0x.1p1))

    // Check 0xFFp-1 symbol is Float16 type
    Assert.equals(0xFFp-1, Float16(0xFFp-1))

    // Check 6.5504e4f16 symbol is Float16 type
    Assert.equals(6.5504e4f16, Float16(6.5504e4f16))

    // Check 5.9604_645e-8f16 symbol is Float16 type
    Assert.equals(5.9604_645e-8f16, Float16(5.9604_645e-8f16))

    // Check 0.0f16 symbol is Float16 type
    Assert.equals(0.0f16, Float16(0.0f16))

    // Check -0.0f16 symbol is Float16 type
    Assert.equals(-0.0f16, Float16(-0.0f16))

    // Check Float16.Inf symbol is Float16 type
    Assert.equals(Float16.Inf, Float16(Float16.Inf))

    // Check Float16.NaN symbol is Float16 type
    Assert.equals(Float16.NaN, Float16(Float16.NaN))

    // Check 0x1p32 symbol is Float32 type
    Assert.equals(0x1p32, Float32(0x1p32))

    // Check 0x1_2a.1p0 symbol is Float32 type
    Assert.equals(0x1_2a.1p0, Float32(0x1_2a.1p0))

    // Check 3.402_8234664e38 symbol is Float32 type
    Assert.equals(3.402_8234664e38, Float32(3.402_8234664e38))

    // Check 1.4012984643E-45 symbol is Float32 type
    Assert.equals(1.4012984643E-45, Float32(1.4012984643E-45))

    // Check 0.0_f32 symbol is Float32 type
    Assert.equals(0.0_f32, Float32(0.0_f32))

    // Check -0.0f32 symbol is Float32 type
    Assert.equals(-0.0f32, Float32(-0.0f32))

    // Check Float32.Inf symbol is Float32 type
    Assert.equals(Float32.Inf, Float32(Float32.Inf))

    // Check Float32.NaN symbol is Float32 type
    Assert.equals(Float32.NaN, Float32(Float32.NaN))

    // Check -0x4p32 symbol is Float64 type
    Assert.equals(-0x4p32, Float64(-0x4p32))

    // Check 0x12a.1p2 symbol is Float64 type
    Assert.equals(0x12a.1p2, Float64(0x12a.1p2))

    // Check 0xeeEEe_eEEp-5 symbol is Float64 type
    Assert.equals(0xeeEEe_eEEp-5, Float64(0xeeEEe_eEEp-5))

    // Check 0xA.BP-10 symbol is Float64 type
    Assert.equals(0xA.BP-10, Float64(0xA.BP-10))

    // Check 1.7976931_348623157e308 symbol is Float64 type
    Assert.equals(1.7976931_348623157e308, Float64(1.7976931_348623157e308))

    // Check 4.9406564584124654e-324 symbol is Float64 type
    Assert.equals(4.9406564584124654e-324, Float64(4.9406564584124654e-324))

    // Check 0.0f64 symbol is Float64 type
    Assert.equals(0.0f64, Float64(0.0f64))

    // Check -0x0p0 symbol is Float64 type
    Assert.equals(-0x0p0, Float64(-0x0p0))

    // Check Float64.Inf symbol is Float64 type
    Assert.equals(Float64.Inf, Float64(Float64.Inf))

    // Check Float64.NaN symbol is Float64 type
    Assert.equals(Float64.NaN, Float64(Float64.NaN))

    return 0
}

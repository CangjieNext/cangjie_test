/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt 
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args --opti8=4 --opti16=234 --opti32=33 --opti64=1 --optu8=1 --optu16=0 --optu32=234 --optu64=234 --sign=322 --long=42

// NOTE: the test check that option types (UIn64, Int8) can be guessed by provided CLI argument

@UnittestOption[String, Int8](opti8)

@UnittestOption[Int16](opti16)

@UnittestOption[Int32, Bool](opti32)

@UnittestOption[Int64](opti64)

@UnittestOption[String, UInt8](optu8)

@UnittestOption[UInt16](optu16)

@UnittestOption[UInt32, Bool](optu32)

@UnittestOption[UInt64](optu64)

@UnittestOption[Int64, UInt64](sign)

@Test
func integer_signed_types_preferable_to_unsigned() {
    let conf = defaultConfiguration()

    @Assert(conf.get<Int64>(KeySign.sign) == 322)
    @Assert(conf.get<UInt64>(KeySign.sign).isNone())
}

@UnittestOption[Int16, Int8](long)

@Test
func integer_long_types_prefered_to_short() {
    let conf = defaultConfiguration()

    @Assert(conf.get<Int16>(KeyLong.long) == 42i16)
    @Assert(conf.get<Int8>(KeyLong.long).isNone())
}

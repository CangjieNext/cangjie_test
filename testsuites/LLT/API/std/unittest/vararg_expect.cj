/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %cmp_utest_opt 2>&1 | compare %f
// ASSERT: scan unable to infer generic argument of this function
// ASSERT: scan 'Struct-Array<Struct-Array<UInt8>> <: Generics-T'
// ASSERT: scan 'Generics-T <: Struct-Array<UInt8>'

@Test
func test(): Unit {
    let arr: Array<Array<Byte>> = [[1]]
    @Expect(arr, Array<Byte>())
}

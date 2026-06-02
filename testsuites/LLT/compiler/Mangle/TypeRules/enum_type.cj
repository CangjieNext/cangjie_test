// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . --apc=1 -Woff unused --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define void @_CN7default9testEnum1HNNY_10RGBColorE1E
// (CJNATIVE) ASSERT: scan define void @_CN7default9testEnum2HNNY_10RGBColorE2E

public enum RGBColorE1 {
    | Red(UInt8) | Green(UInt8) | Blue(UInt8)
}

func testEnum1(a: RGBColorE1) {}

enum RGBColorE2 {
    | Red
    | Green
    | Blue
    | Red(UInt8)
    | Green(UInt8)
    | Blue(UInt8)
}

func testEnum2(a: RGBColorE2) {}

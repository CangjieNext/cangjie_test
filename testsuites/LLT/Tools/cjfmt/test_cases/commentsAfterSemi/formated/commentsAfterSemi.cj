// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

let HIGH_1_MASK: UInt32 = 0b10000000; // 0x80
let HIGH_2_MASK: UInt32 = 0b11000000; // 0xc0
let HIGH_3_MASK: UInt32 = 0b11100000; // 0xe0
let HIGH_4_MASK: UInt32 = 0b11110000; // 0xf0
let HIGH_5_MASK: UInt32 = 0b11111000; // 0xf8
let HIGH_6_MASK: UInt32 = 0b11111100; // 0xfc
let SHIFT_30: UInt32 = 30;
let SHIFT_24: UInt32 = 24;
let SHIFT_18: UInt32 = 18;
let SHIFT_12: UInt32 = 12;
let SHIFT_6: UInt32 = 6;
let LOW_6_MASK: UInt32 = 0b00111111; // 0x3f
let LOW_5_MASK: UInt32 = 0b00011111; // 0x1f
let LOW_4_MASK: UInt32 = 0b00001111; // 0x0f
let LOW_3_MASK: UInt32 = 0b00000111; // 0x07
let LOW_2_MASK: UInt32 = 0b00000011; // 0x03
let LOW_1_MASK: UInt32 = 0b00000001; // 0x01
let UTF8_6_MAX: UInt32 = 0x7FFFFFFF;
let UTF8_5_MAX: UInt32 = 0x3FFFFFF
let UTF8_4_MAX: UInt32 = 0x10FFFF;
let UTF8_3_MAX: UInt32 = 0xFFFF;
let UTF8_2_MAX: UInt32 = 0x07FF;
let UTF8_1_MAX: UInt32 = 0x7F;
let HIGH_1_UInt8: UInt8 = 0b10000000; // 0x80
let HIGH_2_UInt8: UInt8 = 0b11000000; // 0xc0
let HIGH_3_UInt8: UInt8 = 0b11100000; // 0xe0
let HIGH_4_UInt8: UInt8 = 0b11110000; // 0xf0
let HIGH_5_UInt8: UInt8 = 0b11111000; // 0xf8
let HIGH_6_UInt8: UInt8 = 0b11111100; // 0xfc
let UNICODE_TO_UTF8_MAX_LEN: Int64 = 6
let EMPTY_UINT8_ARRAY: Array<UInt8> = Array<UInt8>()
let EMPTY_INT64_ARRAY: Array<Int64> = Array<Int64>()
let EMPTY_STRING_ARRAY: Array<String> = Array<String>()
let STRING_C_THRESHOLD = 32

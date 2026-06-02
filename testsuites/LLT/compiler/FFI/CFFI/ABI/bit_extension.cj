// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Darwin) EXEC: %compiler %cmp_opt %f --save-temps . -j1
// (Darwin) EXEC: %llvmDissembler %n.bc -o %n.ll
// (Darwin) EXEC: %cat %n.ll 2>&1 | compare %f
// (Darwin) ASSERT: scan define zeroext i1 @getBool(i1 noundef zeroext %0)
// (Darwin) ASSERT: scan define signext i8 @getInt8(i8 noundef signext %0)
// (Darwin) ASSERT: scan define zeroext i8 @getUInt8(i8 noundef zeroext %0)
// (Darwin) ASSERT: scan define signext i16 @getInt16(i16 noundef signext %0)
// (Darwin) ASSERT: scan define zeroext i16 @getUInt16(i16 noundef zeroext %0)
// (Darwin) ASSERT: scan define i32 @getInt32(i32 noundef %0)
// (Darwin) ASSERT: scan define i32 @getUInt32(i32 noundef %0)
// (Darwin) ASSERT: scan define i64 @getInt64(i64 noundef %0)
// (Darwin) ASSERT: scan define i64 @getUInt64(i64 noundef %0)

import std.math.*

@C func getBool(_: Bool): Bool { true }
@C func getInt8(_: Int8): Int8 { Int8.Max }
@C func getUInt8(_: UInt8): UInt8 { UInt8.Max }
@C func getInt16(_: Int16): Int16 { Int16.Max }
@C func getUInt16(_: UInt16): UInt16 { UInt16.Max }
@C func getInt32(_: Int32): Int32 { Int32.Max }
@C func getUInt32(_: UInt32): UInt32 { UInt32.Max }
@C func getInt64(_: Int64): Int64 { Int64.Max }
@C func getUInt64(_: UInt64): UInt64 { UInt64.Max }

main() {}

// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (MAC) EXEC: %compiler %cmp_opt %f --save-temps . -j1
// (MAC) EXEC: %llvmDissembler %n.bc -o %n.ll
// (MAC) EXEC: %cat %n.ll 2>&1 | compare %f
// (MAC) ASSERT: scan define i32 @_CN7default6calleeHCNY_2CAET1_ilENNY_1EECNY_2I1E(i8 addrspace(1)* %x, %"Tuple<Int32,Int64>"* noalias %y, %"enum.default:E"* noalias %z, i8 addrspace(1)* %w)

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

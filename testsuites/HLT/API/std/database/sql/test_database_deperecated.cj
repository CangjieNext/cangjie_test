/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan interface 'SqlDbType' is deprecated.
// ASSERT: scan interface 'SqlNullableDbType' is deprecated.
// ASSERT: scan class 'SqlBigInt' is deprecated. Use `Int64` instead.
// ASSERT: scan class 'SqlBinary' is deprecated. Use `Array<Byte>` instead.
// ASSERT: scan class 'SqlBlob' is deprecated. Use `InputStream` instead.
// ASSERT: scan class 'SqlBool' is deprecated. Use `Bool` instead.
// ASSERT: scan class 'SqlByte' is deprecated. Use `Int8` instead.
// ASSERT: scan class 'SqlChar' is deprecated. Use `String` instead.
// ASSERT: scan class 'SqlClob' is deprecated. Use `InputStream` instead.
// ASSERT: scan class 'SqlDate' is deprecated. Use `DateTime` instead.
// ASSERT: scan class 'SqlDecimal' is deprecated. Use `Decimal` instead.
// ASSERT: scan class 'SqlDouble' is deprecated. Use `Float64` instead.
// ASSERT: scan class 'SqlInteger' is deprecated. Use `Int32` instead.
// ASSERT: scan class 'SqlInterval' is deprecated. Use `Duration` instead.
// ASSERT: scan class 'SqlNullableBigInt' is deprecated. Use `?Int64` instead.
// ASSERT: scan class 'SqlNullableBinary' is deprecated. Use `?Array<Byte>` instead.
// ASSERT: scan class 'SqlNullableBlob' is deprecated. Use `?InputStream` instead.
// ASSERT: scan class 'SqlNullableBool' is deprecated. Use `?Bool` instead.
// ASSERT: scan class 'SqlNullableByte' is deprecated. Use `?Int8` instead.
// ASSERT: scan class 'SqlNullableChar' is deprecated. Use `?String` instead.
// ASSERT: scan class 'SqlNullableClob' is deprecated. Use `?InputStream` instead.
// ASSERT: scan class 'SqlNullableDate' is deprecated. Use `?DateTime` instead.
// ASSERT: scan class 'SqlNullableDecimal' is deprecated. Use `?Decimal` instead.
// ASSERT: scan class 'SqlNullableDouble' is deprecated. Use `?Float64` instead.
// ASSERT: scan class 'SqlNullableInteger' is deprecated. Use `?Int32` instead.
// ASSERT: scan class 'SqlNullableInterval' is deprecated. Use `?Duration` instead.
// ASSERT: scan class 'SqlNullableReal' is deprecated. Use `?Float32` instead.
// ASSERT: scan class 'SqlNullableSmallInt' is deprecated. Use `?Int16` instead.
// ASSERT: scan class 'SqlNullableTime' is deprecated. Use `?DateTime` instead.
// ASSERT: scan class 'SqlNullableTimeTz' is deprecated. Use `?DateTime` instead.
// ASSERT: scan class 'SqlNullableTimestamp' is deprecated. Use `?DateTime` instead.
// ASSERT: scan class 'SqlNullableVarBinary' is deprecated. Use `?Array<Byte>` instead.
// ASSERT: scan class 'SqlNullableVarchar' is deprecated. Use `?String` instead.
// ASSERT: scan class 'SqlReal' is deprecated. Use `Float32` instead.
// ASSERT: scan class 'SqlSmallInt' is deprecated. Use `Int16` instead.
// ASSERT: scan class 'SqlTime' is deprecated. Use `DateTime` instead.
// ASSERT: scan class 'SqlTimeTz' is deprecated. Use `DateTime` instead.
// ASSERT: scan class 'SqlTimestamp' is deprecated. Use `DateTime` instead.
// ASSERT: scan class 'SqlVarBinary' is deprecated. Use `Array<Byte>` instead.
// ASSERT: scan class 'SqlVarchar' is deprecated. Use `String` instead.

import std.database.sql.*
import std.io.*
import std.time.*
import std.math.numeric.*
import std.math.*

let date1: DateTime = DateTime.of(year: 2024, month: 1, dayOfMonth: 1)

class Sqlclass <: SqlDbType {
    private var value = ""
    public prop name: String {
        get() {
            value
        }
    }
}

class SqlNullableDbTypeclass <: SqlNullableDbType {
    private var value = ""
    public prop name: String {
        get() {
            value
        }
    }
}

main(): Unit {
    SqlBigInt(0)
    SqlBinary(Array<Byte>())
    SqlBlob(ByteBuffer())
    SqlBool(true)
    SqlByte(-127)
    SqlChar("")
    SqlClob(ByteBuffer())
    SqlDate(date1)
    SqlDecimal(Decimal(BigInt.parse("1")))
    SqlDouble(1.0)
    SqlInteger(1)
    SqlInterval(Duration.Max)
    SqlNullableBigInt(None<Int64>)
    SqlNullableBinary(None<Array<Byte>>)
    SqlNullableBlob(None<InputStream>)
    SqlNullableBool(None<Bool>)
    SqlNullableByte(None<Int8>)
    SqlNullableChar(None<String>)
    SqlNullableClob(None<InputStream>)
    SqlNullableDate(None<DateTime>)
    SqlNullableDecimal(None<Decimal>)
    SqlNullableDouble(None<Float64>)
    SqlNullableInteger(None<Int32>)
    SqlNullableInterval(None<Duration>)
    SqlNullableReal(None<Float32>)
    SqlNullableSmallInt(None<Int16>)
    SqlNullableTime(None<DateTime>)
    SqlNullableTimeTz(None<DateTime>)
    SqlNullableTimestamp(None<DateTime>)
    SqlNullableVarBinary(None<Array<Byte>>)
    SqlNullableVarchar(None<String>)
    SqlReal(1.0)
    SqlSmallInt(1)
    SqlTime(date1)
    SqlTimeTz(date1)
    SqlTimestamp(date1)
    SqlVarBinary(Array<Byte>())
    SqlVarchar("")
}

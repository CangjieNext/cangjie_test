/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.database.sql.*
import std.io.*
import std.math.*
import std.time.DateTime
import std.unittest.*
import std.math.numeric.Decimal

@Test
class SqlDataTypeTest {
    static const nullStr: String = ""
    static const testStr: String = "test"
    let nullArr: Array<Byte> = nullStr.toArray()
    let testArr: Array<Byte> = testStr.toArray()
    let nullStream: ByteBuffer = ByteBuffer()
    let testStream: ByteBuffer = ByteBuffer()
    let date1: DateTime = DateTime.of(year: 2000, month: 1, dayOfMonth: 1)
    let date2: DateTime = DateTime.of(year: 2000, month: 12, dayOfMonth: 31)

    public func beforeAll(): Unit {
        testStream.read(testArr)
    }

    func sizeOf(inputStream: InputStream): ?Int64 {
        match (inputStream) {
            case s: Seekable =>
                if (s.remainLength >= 0) {
                    return s.remainLength
                }
                return None
            case _ => return None
        }
    }

    @TestCase
    func inputStringReturnSqlChar(): Unit {
        let sdb: SqlChar = SqlChar(nullStr)
        @Expect(sdb.value, nullStr)
        sdb.value = testStr
        @Expect(sdb.value, testStr)
        @Expect(sdb.name,"SqlChar")
    }

    @TestCase
    func inputStringReturnSqlNullableChar(): Unit {
        let sdb: SqlNullableChar = SqlNullableChar(None)
        @Expect(sdb.value, None)
        sdb.value = testStr
        @Expect(sdb.value, testStr)
        @Expect(sdb.name,"SqlNullableChar")
    }

    @TestCase
    func inputStringReturnSqlVarchar(): Unit {
        let sdb: SqlVarchar = SqlVarchar(nullStr)
        @Expect(sdb.value, nullStr)
        sdb.value = testStr
        @Expect(sdb.value, testStr)
        @Expect(sdb.name,"SqlVarchar")
    }

    @TestCase
    func inputStringReturnSqlSqlNullableVarchar(): Unit {
        let sdb: SqlNullableVarchar = SqlNullableVarchar(None)
        @Expect(sdb.value, None)
        sdb.value = testStr
        @Expect(sdb.value, testStr)
        @Expect(sdb.name,"SqlNullableVarchar")
    }

    @TestCase
    func inputArrayReturnSqlBinary(): Unit {
        let sdb: SqlBinary = SqlBinary(nullArr)
        @Expect(sdb.value, nullArr)
        sdb.value = testArr
        @Expect(sdb.value, testArr)
        @Expect(sdb.name,"SqlBinary")
    }

    @TestCase
    func inputArrayReturnSqlNullableBinary(): Unit {
        let sdb: SqlNullableBinary = SqlNullableBinary(None)
        @Expect(sdb.value, None)
        sdb.value = testArr
        @Expect(sdb.value, testArr)
        @Expect(sdb.name,"SqlNullableBinary")
    }

    @TestCase
    func inputArrayReturnSqlVarBinary(): Unit {
        let sdb: SqlVarBinary = SqlVarBinary(nullArr)
        @Expect(sdb.value, nullArr)
        sdb.value = testArr
        @Expect(sdb.value, testArr)
        @Expect(sdb.name,"SqlVarBinary")
    }

    @TestCase
    func inputArrayReturnSqlNullableVarBinary(): Unit {
        let sdb: SqlNullableVarBinary = SqlNullableVarBinary(None)
        @Expect(sdb.value, None)
        sdb.value = testArr
        @Expect(sdb.value, testArr)
        @Expect(sdb.name,"SqlNullableVarBinary")
    }

    @TestCase
    func inputInputStreamReturnSqlClob(): Unit {
        let sdb: SqlClob = SqlClob(nullStream)
        @Expect(sizeOf(sdb.value), nullStream.length)
        sdb.value = testStream
        @Expect(sizeOf(sdb.value), testStream.length)
        @Expect(sdb.name,"SqlClob")
    }

    @TestCase
    func inputInputStreamReturnSqlNullableClob(): Unit {
        let sdb: SqlNullableClob = SqlNullableClob(None)
        if (let Some(_) <- sdb.value) {
            @Assert(false)
        }
        sdb.value = testStream
        @Expect(sizeOf(sdb.value.getOrThrow()), testStream.length)
        @Expect(sdb.name,"SqlNullableClob")
    }

    @TestCase
    func inputInputStreamReturnSqlBlob(): Unit {
        let sdb: SqlBlob = SqlBlob(nullStream)
        @Expect(sizeOf(sdb.value), nullStream.length)
        sdb.value = testStream
        @Expect(sizeOf(sdb.value), testStream.length)
        @Expect(sdb.name,"SqlBlob")
    }

    @TestCase
    func inputInputStreamReturnSqlNullableBlob(): Unit {
        let sdb: SqlNullableBlob = SqlNullableBlob(None)
        if (let Some(_) <- sdb.value) {
            @Assert(false)
        }
        sdb.value = testStream
        @Expect(sizeOf(sdb.value.getOrThrow()), testStream.length)
        @Expect(sdb.name,"SqlNullableBlob")
    }

    @TestCase
    func inputBoolReturnSqlBool(): Unit {
        let sdb: SqlBool = SqlBool(true)
        @Expect(sdb.value, true)
        sdb.value = false
        @Expect(sdb.value, false)
        @Expect(sdb.name,"SqlBool")
    }

    @TestCase
    func inputBoolReturnSqlNullableBool(): Unit {
        let sdb: SqlNullableBool = SqlNullableBool(None)
        @Expect(sdb.value, None)
        sdb.value = false
        @Expect(sdb.value, false)
        @Expect(sdb.name,"SqlNullableBool")
    }

    @TestCase
    func inputByteReturnSqlByte(): Unit {
        let sdb: SqlByte = SqlByte(Int8.Min)
        @Expect(sdb.value, Int8.Min)
        sdb.value = Int8.Max
        @Expect(sdb.value, Int8.Max)
        @Expect(sdb.name,"SqlByte")
    }

    @TestCase
    func inputByteReturnSqlNullableByte(): Unit {
        let sdb: SqlNullableByte = SqlNullableByte(None)
        @Expect(sdb.value, None)
        sdb.value = Int8.Max
        @Expect(sdb.value, Int8.Max)
        @Expect(sdb.name,"SqlNullableByte")
    }

    @TestCase
    func inputSmallIntReturnSqlSmallInt(): Unit {
        let sdb: SqlSmallInt = SqlSmallInt(Int16.Min)
        @Expect(sdb.value, Int16.Min)
        sdb.value = Int16.Max
        @Expect(sdb.value, Int16.Max)
        @Expect(sdb.name,"SqlSmallInt")
    }

    @TestCase
    func inputSmallIntReturnSqlNullableSmallInt(): Unit {
        let sdb: SqlNullableSmallInt = SqlNullableSmallInt(None)
        @Expect(sdb.value, None)
        sdb.value = Int16.Max
        @Expect(sdb.value, Int16.Max)
        @Expect(sdb.name,"SqlNullableSmallInt")
    }

    @TestCase
    func inputIntegerReturnSqlInteger(): Unit {
        let sdb: SqlInteger = SqlInteger(Int32.Min)
        @Expect(sdb.value, Int32.Min)
        sdb.value = Int32.Max
        @Expect(sdb.value, Int32.Max)
        @Expect(sdb.name,"SqlInteger")
    }

    @TestCase
    func inputIntegerReturnSqlNullableInteger(): Unit {
        let sdb: SqlNullableInteger = SqlNullableInteger(None)
        @Expect(sdb.value, None)
        sdb.value = Int32.Max
        @Expect(sdb.value, Int32.Max)
        @Expect(sdb.name,"SqlNullableInteger")
    }

    @TestCase
    func inputBigIntReturnSqlBigInt(): Unit {
        let sdb: SqlBigInt = SqlBigInt(Int64.Min)
        @Expect(sdb.value, Int64.Min)
        sdb.value = Int64.Max
        @Expect(sdb.value, Int64.Max)
        @Expect(sdb.name,"SqlBigInt")
    }

    @TestCase
    func inputBigIntReturnSqlNullableBigInt(): Unit {
        let sdb: SqlNullableBigInt = SqlNullableBigInt(None)
        @Expect(sdb.value, None)
        sdb.value = Int64.Max
        @Expect(sdb.value, Int64.Max)
        @Expect(sdb.name,"SqlNullableBigInt")
    }

    @TestCase
    func inputRealReturnSqlReal(): Unit {
        let sdb: SqlReal = SqlReal(Float32.Min)
        @Expect(sdb.value, Float32.Min)
        sdb.value = Float32.Max
        @Expect(sdb.value, Float32.Max)
        @Expect(sdb.name,"SqlReal")
    }

    @TestCase
    func inputRealReturnSqlNullableReal(): Unit {
        let sdb: SqlNullableReal = SqlNullableReal(None)
        @Expect(sdb.value, None)
        sdb.value = Float32.Max
        @Expect(sdb.value, Float32.Max)
        @Expect(sdb.name,"SqlNullableReal")
    }

    @TestCase
    func inputDoubleReturnSqlDouble(): Unit {
        let sdb: SqlDouble = SqlDouble(Float64.Min)
        @Expect(sdb.value, Float64.Min)
        sdb.value = Float64.Max
        @Expect(sdb.value, Float64.Max)
        @Expect(sdb.name,"SqlDouble")
    }

    @TestCase
    func inputDoubleReturnSqlNullableDouble(): Unit {
        let sdb: SqlNullableDouble = SqlNullableDouble(None)
        @Expect(sdb.value, None)
        sdb.value = Float64.Max
        @Expect(sdb.value, Float64.Max)
        @Expect(sdb.name,"SqlNullableDouble")
    }

    @TestCase
    func inputDateReturnSqlDate(): Unit {
        let sdb: SqlDate = SqlDate(date1)
        @Expect(sdb.value, date1)
        sdb.value = date2
        @Expect(sdb.value, date2)
        @Expect(sdb.name,"SqlDate")
    }

    @TestCase
    func inputDateReturnSqlNullableDate(): Unit {
        let sdb: SqlNullableDate = SqlNullableDate(None)
        @Expect(sdb.value, None)
        sdb.value = date2
        @Expect(sdb.value, date2)
        @Expect(sdb.name,"SqlNullableDate")
    }

    @TestCase
    func inputTimeReturnSqlTime(): Unit {
        let sdb: SqlTime = SqlTime(date1)
        @Expect(sdb.value, date1)
        sdb.value = date2
        @Expect(sdb.value, date2)
        @Expect(sdb.name,"SqlTime")
    }

    @TestCase
    func inputTimeReturnSqlNullableTime(): Unit {
        let sdb: SqlNullableTime = SqlNullableTime(None)
        @Expect(sdb.value, None)
        sdb.value = date2
        @Expect(sdb.value, date2)
        @Expect(sdb.name,"SqlNullableTime")
    }

    @TestCase
    func inputTimeTzReturnSqlTimeTz(): Unit {
        let sdb: SqlTimeTz = SqlTimeTz(date1)
        @Expect(sdb.value, date1)
        sdb.value = date2
        @Expect(sdb.value, date2)
        @Expect(sdb.name,"SqlTimeTz")
    }

    @TestCase
    func inputTimeTzReturnSqlNullableTimeTz(): Unit {
        let sdb: SqlNullableTimeTz = SqlNullableTimeTz(None)
        @Expect(sdb.value, None)
        sdb.value = date2
        @Expect(sdb.value, date2)
        @Expect(sdb.name,"SqlNullableTimeTz")
    }

    @TestCase
    func inputTimestampReturnSqlTimestamp(): Unit {
        let sdb: SqlTimestamp = SqlTimestamp(date1)
        @Expect(sdb.value, date1)
        sdb.value = date2
        @Expect(sdb.value, date2)
        @Expect(sdb.name,"SqlTimestamp")
    }

    @TestCase
    func inputTimestampReturnSqlNullableTimestamp(): Unit {
        let sdb: SqlNullableTimestamp = SqlNullableTimestamp(None)
        @Expect(sdb.value, None)
        sdb.value = date2
        @Expect(sdb.value, date2)
        @Expect(sdb.name,"SqlNullableTimestamp")
    }

    @TestCase
    func inputIntervalReturnSqlInterval(): Unit {
        let sdb: SqlInterval = SqlInterval(Duration.Min)
        @Expect(sdb.value, Duration.Min)
        sdb.value = Duration.Max
        @Expect(sdb.value, Duration.Max)
        @Expect(sdb.name,"SqlInterval")
    }

    @TestCase
    func inputIntervalReturnSqlNullableInterval(): Unit {
        let sdb: SqlNullableInterval = SqlNullableInterval(None)
        @Expect(sdb.value, None)
        sdb.value = Duration.Max
        @Expect(sdb.value, Duration.Max)
        @Expect(sdb.name,"SqlNullableInterval")
    }

    @TestCase
    func inputDecimalReturnSqlDecimal(): Unit {
        let sdb: SqlDecimal = SqlDecimal(Decimal(0.0))
        @Expect(sdb.value, Decimal(0.0))
        sdb.value = Decimal(1000000.0)
        @Expect(sdb.value, Decimal(1000000.0))
        @Expect(sdb.name,"SqlDecimal")
    }

    @TestCase
    func inputDecimalReturnSqlNullableDecimal(): Unit {
        let sdb: SqlNullableDecimal = SqlNullableDecimal(None)
        @Expect(sdb.value, None)
        sdb.value = Decimal(1000000.0)
        @Expect(sdb.value, Decimal(1000000.0))
        @Expect(sdb.name,"SqlNullableDecimal")
    }
}

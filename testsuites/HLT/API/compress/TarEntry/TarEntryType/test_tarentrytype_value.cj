/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.compress.*
import stdx.compress.tar.*

@Test
class test_TarEntryType {
    let _types = [
        V7RegularFile,
        RegularFile,
        ContiguousFile,
        HardLink,
        Symlink,
        CharDevice,
        BlockDevice,
        Directory,
        Fifo,
        ExtendedHeader,
        GlobalExtendedHeader,
        GnuLongName,
        GnuLongLink,
        GnuSparse,
        GnuDumpDir,
        GnuMultiVolume,
        GnuName,
        GnuVolumeHeader,
        Unknown(10)
    ]

    let flag_values: Array<UInt8> = [
        0,
        48,
        55,
        49,
        50,
        51,
        52,
        53,
        54,
        120,
        103,
        76,
        75,
        83,
        68,
        77,
        78,
        86,
        10
    ]
    // should not contains enum name
    let _type_strs = [
        "TarEntryType.V7RegularFile",
        "TarEntryType.RegularFile",
        "TarEntryType.ContiguousFile",
        "TarEntryType.HardLink",
        "TarEntryType.Symlink",
        "TarEntryType.CharDevice",
        "TarEntryType.BlockDevice",
        "TarEntryType.Directory",
        "TarEntryType.Fifo",
        "TarEntryType.ExtendedHeader",
        "TarEntryType.GlobalExtendedHeader",
        "TarEntryType.GnuLongName",
        "TarEntryType.GnuLongLink",
        "TarEntryType.GnuSparse",
        "TarEntryType.GnuDumpDir",
        "TarEntryType.GnuMultiVolume",
        "TarEntryType.GnuName",
        "TarEntryType.GnuVolumeHeader",
        "TarEntryType.Unknown(10)"
    ]

    @TestCase
    func test_TarEntryType_flag(): Unit {
        @Assert(_types.map{ ee => ee.flag}, flag_values)
    }

    @TestCase
    func test_TarEntryType_fromFlag(): Unit {
        @Assert(flag_values.map{ ee => TarEntryType.fromFlag(ee)}, _types)
    }

    @TestCase
    func test_TarEntryType_toString(): Unit {
        @Assert(_types.map{ ee => ee.toString()}, _type_strs)
    }

    @TestCase
    func test_TarEntryType_equal(): Unit {
        for (i in 0.._types.size) {
            @Assert(_types[i], _types[i])
        }
    }

    @TestCase
    func test_TarEntryType_unequal(): Unit {
        for (i in 0.._types.size - 1) {
            @Assert(_types[i] != _types[i + 1])
        }
        @Assert(TarEntryType.Unknown(0) != TarEntryType.V7RegularFile)
        @Assert(TarEntryType.Unknown(10) != TarEntryType.Unknown(11))
    }
}
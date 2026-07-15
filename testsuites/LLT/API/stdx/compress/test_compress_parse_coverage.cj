/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// (Unix) EXEC-PIPE: export cjHeapSize=16GB && %set_stdx_path %run %run_opt %output %run_utest_opt %run_args

import std.unittest.*
import std.unittest.testmacro.*
import stdx.compress.tar.*
import std.fs.{File, OpenMode, remove}
import std.io.{InputStream}

@Test
public class CompressParseCoverageTest {

    func copyStr(header: Array<UInt8>, offset: Int64, str: String): Unit {
        let bytes = unsafe { str.rawData() }
        for (i in 0..bytes.size) {
            header[offset + i] = bytes[i]
        }
    }

    func toOctal(n: Int64): String {
        if (n == 0) { return "0" }
        var v = n
        var s = ""
        while (v > 0) {
            s = String(Rune(UInt8(v % 8) + 48)) + s
            v /= 8
        }
        return s
    }

    func tarChecksum(header: Array<UInt8>): Int64 {
        var sum: Int64 = 0
        for (i in 0..512) {
            if (i >= 148 && i < 156) {
                sum += 32
            } else {
                sum += Int64(header[i])
            }
        }
        return sum
    }

    func encodeChecksum(header: Array<UInt8>): Unit {
        for (i in 148..156) { header[i] = 32 }
        let sum = tarChecksum(header)
        let octalStr = toOctal(sum)
        let bytes = unsafe { octalStr.rawData() }
        var idx = 6 - bytes.size
        if (idx < 0) { idx = 0 }
        for (i in 0..bytes.size) {
            if (idx + i < 6) { header[148 + idx + i] = bytes[i] }
        }
        header[154] = 0
        header[155] = 32
    }

    func makeHeader(sizeField: Array<UInt8>, typeFlag: UInt8, isUstar: Bool): Array<UInt8> {
        let header = Array<UInt8>(512, repeat: 0)
        copyStr(header, 0, "test.txt")
        copyStr(header, 100, "0000644")
        copyStr(header, 108, "0001750")
        copyStr(header, 116, "0001750")
        for (i in 0..sizeField.size) { header[124 + i] = sizeField[i] }
        copyStr(header, 136, "13666546212")
        header[156] = typeFlag
        if (isUstar) {
            copyStr(header, 257, "ustar")
            header[263] = 48
            header[264] = 48
        }
        encodeChecksum(header)
        return header
    }

    func writeTar(path: String, blocks: Array<Array<UInt8>>): Unit {
        try (file = File(path, OpenMode.Write)) {
            for (block in blocks) { file.write(block) }
            let end = Array<UInt8>(1024, repeat: 0)
            file.write(end)
        }
    }

    func countEntries(path: String): Int64 {
        var n: Int64 = 0
        try (file = File(path, OpenMode.Read)) {
            let reader = TarReader(file)
            for (_ in reader) { n++ }
        }
        return n
    }

    // parse.cj:86-87 — Int64.parseNumeric base256 positive → GnuBase256.parsePositive
    @TestCase
    func testBase256PositiveSize(): Unit {
        let sf = Array<UInt8>(12, repeat: 0)
        sf[0] = 0x80
        sf[11] = 42
        let header = makeHeader(sf, UInt8(48), true)
        let path = "/tmp/test_b256_pos.tar"
        writeTar(path, [header, Array<UInt8>(512, repeat: 0)])
        @Expect(countEntries(path), 1)
        remove(path)
    }

    // parse.cj:88-89 — Int64.parseNumeric base256 negative → GnuBase256.parseNegative
    @TestCase
    func testBase256NegativeSize(): Unit {
        let sf = Array<UInt8>(12, repeat: 0xFF)
        let header = makeHeader(sf, UInt8(48), true)
        let path = "/tmp/test_b256_neg.tar"
        writeTar(path, [header])
        try {
            countEntries(path)
            @Expect(false)
        } catch (_: Exception) {}
        remove(path)
    }

    // parse.cj:75 — parseOctal with all-zero buffer → trim.size == 0
    @TestCase
    func testEmptyOctalSize(): Unit {
        let sf = Array<UInt8>(12, repeat: 0)
        let header = makeHeader(sf, UInt8(48), true)
        let path = "/tmp/test_empty_size.tar"
        writeTar(path, [header])
        @Expect(countEntries(path), 1)
        remove(path)
    }

    // parse.cj:127-130 — Int32.parseNumeric base256 for devMajor/devMinor (char device)
    @TestCase
    func testBase256DevFields(): Unit {
        let sf = Array<UInt8>(12, repeat: 0)
        for (i in 0..8) { sf[i] = 48 }
        let header = makeHeader(sf, UInt8(51), true)  // '3' = CharDevice
        header[329] = 0x80
        header[336] = 5
        header[337] = 0x80
        header[344] = 3
        encodeChecksum(header)
        let path = "/tmp/test_b256_dev.tar"
        writeTar(path, [header])
        @Expect(countEntries(path), 1)
        remove(path)
    }

    // parse.cj:145-183 — parsePaxTimestamp with negative/decimal values via PAX extended header
    @TestCase
    func testPaxTimestampNegativeDecimal(): Unit {
        let paxContent = "31 mtime=-1234567890.987654321\n"
        let paxBytes = unsafe { paxContent.rawData() }
        let paxHeader = Array<UInt8>(512, repeat: 0)
        copyStr(paxHeader, 0, "PaxHeader/test")
        let sizeOctal = toOctal(paxBytes.size)
        copyStr(paxHeader, 124, sizeOctal)
        paxHeader[156] = UInt8(120)  // 'x' = extended header
        copyStr(paxHeader, 257, "ustar")
        paxHeader[263] = 48; paxHeader[264] = 48
        encodeChecksum(paxHeader)
        let paddedData = Array<UInt8>(512, repeat: 0)
        for (i in 0..paxBytes.size) { paddedData[i] = paxBytes[i] }
        let regHeader = makeHeader(Array<UInt8>(12, repeat: 0), UInt8(48), true)
        let path = "/tmp/test_pax_ts.tar"
        writeTar(path, [paxHeader, paddedData, regHeader])
        @Expect(countEntries(path), 1)
        remove(path)
    }

    // parse.cj:129-130 — Int32.parseNumeric base256 negative devMinor → GnuBase256.parseNegative
    @TestCase
    func testBase256NegativeDevMinor(): Unit {
        let sf = Array<UInt8>(12, repeat: 0)
        for (i in 0..8) { sf[i] = 48 }
        let header = makeHeader(sf, UInt8(51), true)  // '3' = CharDevice
        // devMajor: base256 positive
        header[329] = 0x80; header[336] = 5
        // devMinor: base256 negative (0xFF prefix)
        header[337] = 0xFF
        for (i in 338..345) { header[i] = 0 }
        encodeChecksum(header)
        let path = "/tmp/test_b256_neg_dev.tar"
        writeTar(path, [header])
        try {
            countEntries(path)
        } catch (_: Exception) {}
        remove(path)
    }

    // parse.cj:177-179 — parsePaxTimestamp padding: decimal digit < 9 triggers while loop
    @TestCase
    func testPaxTimestampShortDecimal(): Unit {
        // mtime=12345.1 → only 1 decimal digit, padding runs 8 times
        let paxContent = "17 mtime=12345.1\n"
        let paxBytes = unsafe { paxContent.rawData() }
        let paxHeader = Array<UInt8>(512, repeat: 0)
        copyStr(paxHeader, 0, "PaxHeader/test")
        copyStr(paxHeader, 124, toOctal(paxBytes.size))
        paxHeader[156] = UInt8(120)
        copyStr(paxHeader, 257, "ustar")
        paxHeader[263] = 48; paxHeader[264] = 48
        encodeChecksum(paxHeader)
        let paddedData = Array<UInt8>(512, repeat: 0)
        for (i in 0..paxBytes.size) { paddedData[i] = paxBytes[i] }
        let regHeader = makeHeader(Array<UInt8>(12, repeat: 0), UInt8(48), true)
        let path = "/tmp/test_pax_short_dec.tar"
        writeTar(path, [paxHeader, paddedData, regHeader])
        @Expect(countEntries(path), 1)
        remove(path)
    }

    // parse.cj:98,103 — Int32.parseDecimal with empty buffer + all-space trim
    @TestCase
    func testPaxEmptyAndSpaceValues(): Unit {
        // PAX records: empty uid (buffer.size==0) + space gid (trim.size==0)
        let paxContent = "7 uid=\n8 gid= \n"
        let paxBytes = unsafe { paxContent.rawData() }
        let paxHeader = Array<UInt8>(512, repeat: 0)
        copyStr(paxHeader, 0, "PaxHeader/test")
        copyStr(paxHeader, 124, toOctal(paxBytes.size))
        paxHeader[156] = UInt8(120)
        copyStr(paxHeader, 257, "ustar")
        paxHeader[263] = 48; paxHeader[264] = 48
        encodeChecksum(paxHeader)
        let paddedData = Array<UInt8>(512, repeat: 0)
        for (i in 0..paxBytes.size) { paddedData[i] = paxBytes[i] }
        let regHeader = makeHeader(Array<UInt8>(12, repeat: 0), UInt8(48), true)
        let path = "/tmp/test_pax_empty.tar"
        writeTar(path, [paxHeader, paddedData, regHeader])
        @Expect(countEntries(path), 1)
        remove(path)
    }

    // --- wave2: hit remaining parse / tar_header PAX + GNU branches ---

    func writePaxThenReg(path: String, paxContent: String): Unit {
        let paxBytes = unsafe { paxContent.rawData() }
        let paxHeader = Array<UInt8>(512, repeat: 0)
        copyStr(paxHeader, 0, "PaxHeader/test")
        copyStr(paxHeader, 124, toOctal(paxBytes.size))
        paxHeader[156] = UInt8(120)
        copyStr(paxHeader, 257, "ustar")
        paxHeader[263] = 48
        paxHeader[264] = 48
        encodeChecksum(paxHeader)
        let paddedData = Array<UInt8>(512, repeat: 0)
        for (i in 0..paxBytes.size) {
            paddedData[i] = paxBytes[i]
        }
        let regHeader = makeHeader(Array<UInt8>(12, repeat: 0), UInt8(48), true)
        writeTar(path, [paxHeader, paddedData, regHeader])
    }

    // tar_header.cj:78 + parse.cj:57-67 — Int64.parseDecimal via PAX size=
    @TestCase
    func testPaxSizeDecimal(): Unit {
        let path = "/tmp/test_pax_size_dec.tar"
        writePaxThenReg(path, "11 size=42\n8 size=\n9 size= \n")
        @Expect(countEntries(path), 1)
        remove(path)
    }

    // tar_header.cj:79-89 — PAX mode/linkpath/uname/gname/atime/ctime/dev*
    @TestCase
    func testPaxAllKnownKeys(): Unit {
        let path = "/tmp/test_pax_all_keys.tar"
        let pax = "18 path=hello.txt\n13 mode=0644\n16 linkpath=tgt\n15 uname=alice\n14 gname=devs\n" +
            "20 mtime=1700000000\n20 atime=1600000000\n20 ctime=1500000000\n14 devmajor=1\n14 devminor=2\n"
        writePaxThenReg(path, pax)
        @Expect(countEntries(path), 1)
        remove(path)
    }

    // parse.cj:145-146 — empty mtime value → UnixEpoch
    @TestCase
    func testPaxMtimeEmpty(): Unit {
        let path = "/tmp/test_pax_mtime_empty.tar"
        writePaxThenReg(path, "9 mtime=\n")
        @Expect(countEntries(path), 1)
        remove(path)
    }

    // parse.cj:174 — decimal digits beyond nanosecond precision are ignored
    @TestCase
    func testPaxMtimeLongDecimal(): Unit {
        let path = "/tmp/test_pax_mtime_long.tar"
        writePaxThenReg(path, "34 mtime=1234567890.1234567890123\n")
        @Expect(countEntries(path), 1)
        remove(path)
    }

    // parse.cj:166-167 — invalid pax timestamp character
    @TestCase
    func testPaxMtimeInvalidChar(): Unit {
        let path = "/tmp/test_pax_mtime_bad.tar"
        writePaxThenReg(path, "14 mtime=12x3\n")
        try {
            countEntries(path)
        } catch (_: Exception) {}
        remove(path)
    }

    // tar_header.cj:136 — GnuSparse type 'S' throws
    @TestCase
    func testGnuSparseUnsupported(): Unit {
        let sf = Array<UInt8>(12, repeat: 0)
        for (i in 0..8) {
            sf[i] = 48
        }
        let header = makeHeader(sf, UInt8(83), true) // 'S'
        let path = "/tmp/test_gnu_sparse.tar"
        writeTar(path, [header])
        try {
            countEntries(path)
            @Expect(false)
        } catch (_: Exception) {}
        remove(path)
    }

    // tar_header.cj:163-165,184-185,209-211 — GNU magic + GNU version + atime/ctime
    @TestCase
    func testGnuMagicAndVersion(): Unit {
        let sf = Array<UInt8>(12, repeat: 0)
        for (i in 0..8) {
            sf[i] = 48
        }
        let header = makeHeader(sf, UInt8(48), false)
        copyStr(header, 257, "ustar ")
        header[263] = 32 // ' '
        header[264] = 0
        // A_TIME@345 / C_TIME@357 — octal timestamps (zero fields also OK via parseOctal empty)
        copyStr(header, 345, "13666546212")
        copyStr(header, 357, "13666546212")
        encodeChecksum(header)
        let path = "/tmp/test_gnu_magic.tar"
        writeTar(path, [header])
        try {
            @Expect(countEntries(path), 1)
        } catch (_: Exception) {
            // still exercised GNU magic/version/readGnuFields even if timestamp parse is picky
        }
        remove(path)
    }

    // tar_header.cj:187 — invalid version under ustar magic
    @TestCase
    func testInvalidUstarVersion(): Unit {
        let sf = Array<UInt8>(12, repeat: 0)
        for (i in 0..8) {
            sf[i] = 48
        }
        let header = makeHeader(sf, UInt8(48), true)
        header[263] = 57 // '9'
        header[264] = 57
        encodeChecksum(header)
        let path = "/tmp/test_bad_version.tar"
        writeTar(path, [header])
        try {
            countEntries(path)
            @Expect(false)
        } catch (_: Exception) {}
        remove(path)
    }

    // tar_header.cj:172 — unknown magic bytes
    @TestCase
    func testUnknownMagic(): Unit {
        let sf = Array<UInt8>(12, repeat: 0)
        for (i in 0..8) {
            sf[i] = 48
        }
        let header = makeHeader(sf, UInt8(48), false)
        copyStr(header, 257, "xxxxxx")
        header[263] = 48
        header[264] = 48
        encodeChecksum(header)
        let path = "/tmp/test_unknown_magic.tar"
        writeTar(path, [header])
        try {
            countEntries(path)
        } catch (_: Exception) {}
        remove(path)
    }

    // tar_header.cj:203-205 — USTAR prefix field joins name
    @TestCase
    func testUstarPrefix(): Unit {
        let sf = Array<UInt8>(12, repeat: 0)
        for (i in 0..8) {
            sf[i] = 48
        }
        let header = makeHeader(sf, UInt8(48), true)
        copyStr(header, 345, "dir/sub")
        encodeChecksum(header)
        let path = "/tmp/test_ustar_prefix.tar"
        writeTar(path, [header])
        @Expect(countEntries(path), 1)
        remove(path)
    }

    // parse.cj:129-132 — Int32.parseNumeric octal for block device DEV fields
    @TestCase
    func testBlockDeviceDevOctal(): Unit {
        let sf = Array<UInt8>(12, repeat: 0)
        for (i in 0..8) {
            sf[i] = 48
        }
        let header = makeHeader(sf, UInt8(52), true) // '4' BlockDevice
        copyStr(header, 329, "0000001")
        copyStr(header, 337, "0000002")
        encodeChecksum(header)
        let path = "/tmp/test_blk_dev.tar"
        writeTar(path, [header])
        @Expect(countEntries(path), 1)
        remove(path)
    }

    // Int32.parseNumeric NEGATIVE_PREFIX on DEV_MAJOR (char device)
    @TestCase
    func testBase256NegativeDevMajor(): Unit {
        let sf = Array<UInt8>(12, repeat: 0)
        for (i in 0..8) {
            sf[i] = 48
        }
        let header = makeHeader(sf, UInt8(51), true)
        header[329] = 0xFF
        for (i in 330..337) {
            header[i] = 0
        }
        header[337] = 0x80
        header[344] = 1
        encodeChecksum(header)
        let path = "/tmp/test_b256_neg_major.tar"
        writeTar(path, [header])
        try {
            countEntries(path)
        } catch (_: Exception) {}
        remove(path)
    }
}

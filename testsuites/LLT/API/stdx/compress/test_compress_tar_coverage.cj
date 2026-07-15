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
import std.fs.{File, OpenMode, remove, exists, Path, Directory}
import std.io.{InputStream}
import std.collection.ArrayList

@Test
public class CompressTarReaderCoverageTest {

    func copyStr(header: Array<UInt8>, offset: Int64, str: String): Unit {
        let bytes = unsafe { str.rawData() }
        for (i in 0..bytes.size) { header[offset + i] = bytes[i] }
    }

    func toOctal(n: Int64): String {
        if (n == 0) { return "0" }
        var v = n; var s = ""
        while (v > 0) { s = String(Rune(UInt8(v % 8) + 48)) + s; v /= 8 }
        return s
    }

    func encodeChecksum(header: Array<UInt8>): Unit {
        for (i in 148..156) { header[i] = 32 }
        var sum: Int64 = 0
        for (i in 0..512) { sum += if (i >= 148 && i < 156) { 32 } else { Int64(header[i]) } }
        let bytes = unsafe { toOctal(sum).rawData() }
        var idx = 6 - bytes.size; if (idx < 0) { idx = 0 }
        for (i in 0..bytes.size) { if (idx + i < 6) { header[148 + idx + i] = bytes[i] } }
        header[154] = 0; header[155] = 32
    }

    func makeHeader(name: String, sizeOctal: String, typeFlag: UInt8, isUstar: Bool): Array<UInt8> {
        let h = Array<UInt8>(512, repeat: 0)
        copyStr(h, 0, name)
        copyStr(h, 100, "0000644")
        copyStr(h, 108, "0001750")
        copyStr(h, 116, "0001750")
        copyStr(h, 124, sizeOctal)
        copyStr(h, 136, "13666546212")
        h[156] = typeFlag
        if (isUstar) { copyStr(h, 257, "ustar"); h[263] = 48; h[264] = 48 }
        encodeChecksum(h)
        return h
    }

    func makeDataBlock(data: String): Array<UInt8> {
        let raw = unsafe { data.rawData() }
        let padded = Array<UInt8>(((raw.size + 511) / 512) * 512, repeat: 0)
        for (i in 0..raw.size) { padded[i] = raw[i] }
        return padded
    }

    func writeTar(path: String, blocks: Array<Array<UInt8>>): Unit {
        try (file = File(path, OpenMode.Write)) {
            for (block in blocks) { file.write(block) }
            file.write(Array<UInt8>(1024, repeat: 0))
        }
    }

    func countEntries(path: String): Int64 {
        var n: Int64 = 0
        try (file = File(path, OpenMode.Read)) {
            for (_ in TarReader(file)) { n++ }
        }
        return n
    }

    // tar_reader.cj:72-74,111-113 — GnuLongName ('L') entry + regular entry
    @TestCase
    func testGnuLongName(): Unit {
        let longName = "a" * 200
        let longHeader = makeHeader("./longname", toOctal(longName.size), UInt8(76), true)  // 'L' = GnuLongName
        let longData = makeDataBlock(longName)
        let regHeader = makeHeader("short.txt", "00000000000", UInt8(48), true)
        let path = "/tmp/test_gnu_longname.tar"
        writeTar(path, [longHeader, longData, regHeader, makeDataBlock("")])
        @Expect(countEntries(path), 1)
        remove(path)
    }

    // tar_reader.cj:75-77,116-118 — GnuLongLink ('K') entry + regular entry
    @TestCase
    func testGnuLongLink(): Unit {
        let longLink = "b" * 200
        let linkHeader = makeHeader("./longlink", toOctal(longLink.size), UInt8(75), true)  // 'K' = GnuLongLink
        let linkData = makeDataBlock(longLink)
        let regHeader = makeHeader("test.txt", "00000000000", UInt8(48), true)
        let path = "/tmp/test_gnu_longlink.tar"
        writeTar(path, [linkHeader, linkData, regHeader, makeDataBlock("")])
        @Expect(countEntries(path), 1)
        remove(path)
    }

    // tar_reader.cj:66-68,133-149 — GlobalExtendedHeader ('g') with PAX records
    @TestCase
    func testGlobalExtendedHeader(): Unit {
        let paxData = "23 comment=global test\n"
        let gHeader = makeHeader("globalhdr", toOctal(paxData.size), UInt8(103), true)  // 'g' = GlobalExtendedHeader
        let gData = makeDataBlock(paxData)
        let regHeader = makeHeader("test.txt", "00000000000", UInt8(48), true)
        let path = "/tmp/test_gnu_global.tar"
        writeTar(path, [gHeader, gData, regHeader, makeDataBlock("")])
        @Expect(countEntries(path), 1)
        remove(path)
    }

    // tar_reader.cj:102 — V7 format entry (no magic, type '\0')
    @TestCase
    func testV7FormatEntry(): Unit {
        let header = makeHeader("v7file.txt", "00000000000", UInt8(0), false)  // no magic, type '\0'
        let path = "/tmp/test_v7.tar"
        writeTar(path, [header])
        @Expect(countEntries(path), 1)
        remove(path)
    }

    // tar_reader.cj:173 — PAX record with empty length field
    @TestCase
    func testPaxEmptyLength(): Unit {
        let paxData = " \n"
        let paxHeader = makeHeader("paxhdr", toOctal(paxData.size), UInt8(120), true)  // 'x'
        let path = "/tmp/test_pax_empty_len.tar"
        writeTar(path, [paxHeader, makeDataBlock(paxData)])
        try { countEntries(path); @Expect(false) } catch (_: Exception) {}
        remove(path)
    }

    // tar_reader.cj:181 — PAX record length exceeds available data
    @TestCase
    func testPaxLengthExceedsData(): Unit {
        let paxData = "99 short\n"
        let paxHeader = makeHeader("paxhdr", toOctal(paxData.size), UInt8(120), true)
        let path = "/tmp/test_pax_long.tar"
        writeTar(path, [paxHeader, makeDataBlock(paxData)])
        try { countEntries(path); @Expect(false) } catch (_: Exception) {}
        remove(path)
    }

    // tar_reader.cj:206 — PAX record value not ending with newline
    @TestCase
    func testPaxNoNewline(): Unit {
        let paxData = "20 mtime=12345"
        let paxHeader = makeHeader("paxhdr", toOctal(paxData.size), UInt8(120), true)
        let path = "/tmp/test_pax_nonl.tar"
        writeTar(path, [paxHeader, makeDataBlock(paxData)])
        try { countEntries(path); @Expect(false) } catch (_: Exception) {}
        remove(path)
    }

    // tar_reader.cj:187 — PAX length with non-digit character
    @TestCase
    func testPaxNonDigitLength(): Unit {
        let paxData = "1x mtime=12345\n"
        let paxHeader = makeHeader("paxhdr", toOctal(paxData.size), UInt8(120), true)
        let path = "/tmp/test_pax_nondigit.tar"
        writeTar(path, [paxHeader, makeDataBlock(paxData)])
        try { countEntries(path); @Expect(false) } catch (_: Exception) {}
        remove(path)
    }

    // tar_reader.cj:238 — Invalid (negative) tar entry size
    @TestCase
    func testInvalidEntrySize(): Unit {
        let sf = Array<UInt8>(12, repeat: 0xFF)
        let header = makeHeader("badsize.txt", "", UInt8(48), true)
        for (i in 0..12) { header[124 + i] = sf[i] }
        encodeChecksum(header)
        let path = "/tmp/test_bad_size.tar"
        writeTar(path, [header])
        try { countEntries(path); @Expect(false) } catch (_: Exception) {}
        remove(path)
    }

    // tar_reader.cj:250 — PAX header size exceeds maximum
    @TestCase
    func testPaxHeaderSizeExceedsMax(): Unit {
        // MAX_PAX_HEADER_SIZE is typically 32KB; set size to a huge value
        let header = makeHeader("paxhdr", "77777777777", UInt8(120), true)  // huge octal size
        let path = "/tmp/test_pax_huge.tar"
        writeTar(path, [header])
        try { countEntries(path); @Expect(false) } catch (_: Exception) {}
        remove(path)
    }

    // tar_reader.cj:257-258 — GNU long path size exceeds maximum
    @TestCase
    func testGnuLongPathExceedsMax(): Unit {
        let header = makeHeader("longpath", "77777777777", UInt8(76), true)  // 'L' with huge size
        let path = "/tmp/test_gnu_huge.tar"
        writeTar(path, [header])
        try { countEntries(path); @Expect(false) } catch (_: Exception) {}
        remove(path)
    }

    // --- wave2: drain unread + invalid PAX + unsupported GNU types ---

    // tar_reader.cj:58-60,366-384 — skip unread entry payload before next header
    @TestCase
    func testDrainUnreadEntryThenNext(): Unit {
        let payload = "x" * 100
        let h1 = makeHeader("a.txt", toOctal(payload.size), UInt8(48), true)
        let d1 = makeDataBlock(payload)
        let h2 = makeHeader("b.txt", "00000000000", UInt8(48), true)
        let path = "/tmp/tar_cov_drain.tar"
        writeTar(path, [h1, d1, h2, makeDataBlock("")])
        var n: Int64 = 0
        try (file = File(path, OpenMode.Read)) {
            for (entry in TarReader(file)) {
                // intentionally do not read entry.stream
                n++
            }
        }
        @Expect(n, 2)
        remove(path)
    }

    // tar_reader.cj:172-187 — invalid PAX length / incomplete record
    @TestCase
    func testInvalidPaxRecords(): Unit {
        let bad1 = " path=x\n"
        let h1 = makeHeader("pax", toOctal(bad1.size), UInt8(120), true)
        let path1 = "/tmp/tar_cov_bad_pax1.tar"
        writeTar(path1, [h1, makeDataBlock(bad1), makeHeader("f.txt", "00000000000", UInt8(48), true)])
        try {
            countEntries(path1)
        } catch (_: Exception) {}
        remove(path1)

        let bad2 = "1a path=x\n"
        let h2 = makeHeader("pax", toOctal(bad2.size), UInt8(120), true)
        let path2 = "/tmp/tar_cov_bad_pax2.tar"
        writeTar(path2, [h2, makeDataBlock(bad2), makeHeader("f.txt", "00000000000", UInt8(48), true)])
        try {
            countEntries(path2)
        } catch (_: Exception) {}
        remove(path2)

        let bad3 = "11 path=abc"
        let h3 = makeHeader("pax", toOctal(bad3.size), UInt8(120), true)
        let path3 = "/tmp/tar_cov_bad_pax3.tar"
        writeTar(path3, [h3, makeDataBlock(bad3), makeHeader("f.txt", "00000000000", UInt8(48), true)])
        try {
            countEntries(path3)
        } catch (_: Exception) {}
        remove(path3)
    }

    // tar_reader.cj:78-82 — unsupported GNU special types continue past header
    @TestCase
    func testUnsupportedGnuTypesThenRegular(): Unit {
        let types = [UInt8(68), UInt8(77), UInt8(78), UInt8(86)]
        var blocks = ArrayList<Array<UInt8>>()
        for (t in types) {
            blocks.add(makeHeader("meta", "00000000000", t, true))
        }
        blocks.add(makeHeader("ok.txt", "00000000000", UInt8(48), true))
        blocks.add(makeDataBlock(""))
        let path = "/tmp/tar_cov_gnu_types.tar"
        try (file = File(path, OpenMode.Write)) {
            for (b in blocks) {
                file.write(b)
            }
            file.write(Array<UInt8>(1024, repeat: 0))
        }
        @Expect(countEntries(path), 1)
        remove(path)
    }

    @TestCase
    func testSymlinkEntryType(): Unit {
        let h = makeHeader("link.txt", "00000000000", UInt8(50), true) // '2'
        copyStr(h, 157, "target.txt")
        encodeChecksum(h)
        let path = "/tmp/tar_cov_symlink.tar"
        writeTar(path, [h])
        @Expect(countEntries(path), 1)
        remove(path)
    }

    @TestCase
    func testDirectoryEntryType(): Unit {
        let h = makeHeader("mydir/", "00000000000", UInt8(53), true) // '5'
        let path = "/tmp/tar_cov_dir_entry.tar"
        writeTar(path, [h])
        @Expect(countEntries(path), 1)
        remove(path)
    }

    @TestCase
    func testPartialReadThenDrain(): Unit {
        let payload = "y" * 200
        let h1 = makeHeader("partial.txt", toOctal(payload.size), UInt8(48), true)
        let d1 = makeDataBlock(payload)
        let h2 = makeHeader("next.txt", "00000000000", UInt8(48), true)
        let path = "/tmp/tar_cov_partial.tar"
        writeTar(path, [h1, d1, h2, makeDataBlock("")])
        var n: Int64 = 0
        try (file = File(path, OpenMode.Read)) {
            for (entry in TarReader(file)) {
                if (n == 0) {
                    if (let Some(s) <- entry.stream) {
                        let buf = Array<UInt8>(16, repeat: 0)
                        let _ = s.read(buf)
                    }
                }
                n++
            }
        }
        @Expect(n, 2)
        remove(path)
    }
}

// === tar.cj archive/extract 路径覆盖 ===

@Test
public class CompressTarArchiveCoverageTest {
    func mkTempDir(name: String): String {
        let dir = "/tmp/tar_cov_${name}"
        Directory.create(dir, recursive: true)
        return dir
    }

    func mkFile(path: String, content: String): Unit {
        try (f = File(path, OpenMode.Write)) { f.write(unsafe { content.rawData() }) }
    }

    func cleanup(paths: Array<String>): Unit {
        for (p in paths) {
            if (exists(p)) { remove(p, recursive: true) }
        }
    }

    // tar.cj:23-25 — archive with Path arguments (not String)
    @TestCase
    func testArchiveWithPathArgs(): Unit {
        let srcDir = mkTempDir("path_src")
        mkFile("${srcDir}/test.txt", "hello")
        let tarPath = "/tmp/tar_cov_path.tar"
        Tar.archive(fromDir: Path(srcDir), destFile: Path(tarPath), includeBaseDirectory: false)
        @Expect(exists(tarPath), true)
        cleanup([srcDir, tarPath])
    }

    // tar.cj:46-48 — archive with Path + filter
    @TestCase
    func testArchiveWithFilterPath(): Unit {
        let srcDir = mkTempDir("filter_src")
        mkFile("${srcDir}/keep.txt", "yes")
        mkFile("${srcDir}/skip.txt", "no")
        let tarPath = "/tmp/tar_cov_filter.tar"
        Tar.archive(fromDir: Path(srcDir), filter: { p: Path => p.toString().contains("keep") },
                    destFile: Path(tarPath), includeBaseDirectory: false)
        @Expect(exists(tarPath), true)
        cleanup([srcDir, tarPath])
    }

    // tar.cj:62 — archive root directory should throw
    @TestCase
    func testArchiveRootDir(): Unit {
        let tarPath = "/tmp/tar_cov_root.tar"
        try {
            Tar.archive(fromDir: "/", destFile: tarPath, includeBaseDirectory: false)
            @Expect(false)
        } catch (_: TarException) {}
        cleanup([tarPath])
    }

    // tar.cj:94-96 — extract with Path arguments
    @TestCase
    func testExtractWithPath(): Unit {
        let srcDir = mkTempDir("ext_src")
        mkFile("${srcDir}/data.txt", "test data")
        let tarPath = "/tmp/tar_cov_ext.tar"
        let destDir = "/tmp/tar_cov_ext_dst"
        Tar.archive(fromDir: srcDir, destFile: tarPath, includeBaseDirectory: false)
        Tar.extract(fromTar: Path(tarPath), destDir: Path(destDir), overwrite: true)
        @Expect(exists(destDir), true)
        cleanup([srcDir, tarPath, destDir])
    }

    // tar.cj:119-120 — extract with overwrite=false on existing file
    @TestCase
    func testExtractOverwriteFalse(): Unit {
        let srcDir = mkTempDir("ow_src")
        mkFile("${srcDir}/file.txt", "original")
        let tarPath = "/tmp/tar_cov_ow.tar"
        let destDir = "/tmp/tar_cov_ow_dst"
        Tar.archive(fromDir: srcDir, destFile: tarPath, includeBaseDirectory: false)
        // Extract once
        Tar.extract(fromTar: tarPath, destDir: destDir, overwrite: true)
        // Extract again with overwrite=false → should throw
        try {
            Tar.extract(fromTar: tarPath, destDir: destDir, overwrite: false)
            @Expect(false)
        } catch (_: TarException) {}
        cleanup([srcDir, tarPath, destDir])
    }

    // tar.cj:166 — unknown entry type (case _ => continue)
    @TestCase
    func testUnknownEntryType(): Unit {
        // Create a tar with an unknown type flag (e.g., 'Z')
        let header = Array<UInt8>(512, repeat: 0)
        let rawName = unsafe { "unknown.txt".rawData() }
        for (i in 0..rawName.size) { header[i] = rawName[i] }
        let rawMode = unsafe { "0000644".rawData() }
        for (i in 0..rawMode.size) { header[100 + i] = rawMode[i] }
        let rawSize = unsafe { "00000000000".rawData() }
        for (i in 0..rawSize.size) { header[124 + i] = rawSize[i] }
        header[156] = UInt8(90)  // 'Z' = unknown type
        // Compute checksum
        for (i in 148..156) { header[i] = 32 }
        var sum: Int64 = 0
        for (i in 0..512) { sum += if (i >= 148 && i < 156) { 32 } else { Int64(header[i]) } }
        var v = sum; var s = ""
        while (v > 0) { s = String(Rune(UInt8(v % 8) + 48)) + s; v /= 8 }
        let csBytes = unsafe { s.rawData() }
        var idx = 6 - csBytes.size; if (idx < 0) { idx = 0 }
        for (i in 0..csBytes.size) { if (idx + i < 6) { header[148 + idx + i] = csBytes[i] } }
        header[154] = 0; header[155] = 32

        let tarPath = "/tmp/tar_cov_unknown.tar"
        try (f = File(tarPath, OpenMode.Write)) {
            f.write(header)
            f.write(Array<UInt8>(1024, repeat: 0))
        }
        let destDir = "/tmp/tar_cov_unknown_dst"
        try {
            Tar.extract(fromTar: tarPath, destDir: destDir, overwrite: true)
        } catch (_: Exception) {}
        cleanup([tarPath, destDir])
    }

    // tar.cj:137 — parent directory creation during extract
    @TestCase
    func testExtractNestedDirs(): Unit {
        let srcDir = mkTempDir("nested_src")
        Directory.create("${srcDir}/sub1/sub2", recursive: true)
        mkFile("${srcDir}/sub1/sub2/deep.txt", "deep")
        let tarPath = "/tmp/tar_cov_nested.tar"
        let destDir = "/tmp/tar_cov_nested_dst"
        Tar.archive(fromDir: srcDir, destFile: tarPath, includeBaseDirectory: false)
        Tar.extract(fromTar: tarPath, destDir: destDir, overwrite: true)
        @Expect(exists(destDir), true)
        cleanup([srcDir, tarPath, destDir])
    }
}

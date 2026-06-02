/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Windows)DEPENDENCE: ./utils
// (Windows)DEPENDENCE: ./data
// (Windows)EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Windows)EXEC: ATTRIB -R ./utils/NewFile.txt
// (Windows)EXEC: ATTRIB +R ./utils/.gitignore
// (Windows)EXEC: ATTRIB -R ./utils/NewDir
// (Windows)EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args 
// (Windows)EXEC: ATTRIB -R ./utils/.gitignore
internal import std.fs.*
internal import std.io.SeekPosition
internal import std.math.*
internal import std.runtime.*
internal import std.time.*
internal import std.posix.chdir
internal import std.process.*

/*
 * Test description: Test the funcs for FileInfo
 * Test class:
 * public struct FileInfo <: Equatable<FileInfo>
 */
@Test
class FileInfoWindowsTest {
    let dirFileNoOnlyRead = "./utils/NewFile.txt"
    let dirFileOnlyRead = "./utils/.gitignore"
    let dirPathNoOnlyRead = "./utils/NewDir"
    public override func beforeEach(): Unit {
        let file1 = FileInfo(dirFileNoOnlyRead)
        file1.setReadable(false)

        let file2 = FileInfo(dirFileOnlyRead)
        file2.setReadable(true)

        let file3 = FileInfo(dirPathNoOnlyRead)
        file3.setReadable(false)
    }

    public override func afterAll(): Unit {
        remove("./tmpDir", recursive: true)
    }

    /*
     * Test description: Test fs::FileInfo
     * Test API:
     * public func canRead(): Bool
     */
    @TestCase
    func testInputValidCanRead(): Unit {
        var fi = FileInfo(dirFileNoOnlyRead)
        @Expect(fi.canRead(), true)
        fi = FileInfo(dirFileOnlyRead)
        @Expect(fi.canRead(), true)
        fi = FileInfo(dirPathNoOnlyRead)
        @Expect(fi.canRead(), true)
    }

    /*
     * Test description: Test fs::FileInfo
     * Test API:
     * public func canWrite(): Bool
     */
    @TestCase
    func testInputValidCanWrite(): Unit {
        var fi = FileInfo(dirFileNoOnlyRead)
        @Expect(fi.canWrite(), true)
        fi = FileInfo(dirFileOnlyRead)
        @Expect(fi.canWrite(), false)
        fi = FileInfo(dirPathNoOnlyRead)
        @Expect(fi.canWrite(), true)
    }

    /*
     * Test description: Test fs::FileInfo
     * Test API:
     * public func canExecute(): Bool
     */
    @TestCase
    func testInputValidCanExecute(): Unit {
        var fi = FileInfo(dirFileNoOnlyRead)
        @Expect(fi.canExecute(), false)

        fi = FileInfo(dirFileOnlyRead)
        @Expect(fi.canExecute(), false)

        fi = FileInfo(dirPathNoOnlyRead)
        @Expect(fi.canExecute(), true)
    }

    /*
     * Test description: Test fs::FileInfo
     * Test API:
     * public func isReadOnly(): Bool
           public func setExecutable(executable: Bool): Bool
           public func setExecutable(executable: Bool): Bool
           public func setExecutable(executable: Bool): Bool
     * Describe:
           set And isReadOnly combination testing
     */
    @TestCase
    func testSetAccessIsReadOnly(): Unit {
        let fi = FileInfo(dirFileNoOnlyRead)
        @Expect(checkReadOnly(fi, false, false, false), true)
        @Expect(checkReadOnly(fi, false, false, true), true)
        @Expect(checkReadOnly(fi, false, true, false), false)
        @Expect(checkReadOnly(fi, false, true, true), false)
        @Expect(checkReadOnly(fi, true, false, false), true)
        @Expect(checkReadOnly(fi, true, false, true), true)
        @Expect(checkReadOnly(fi, true, true, false), false)
        @Expect(checkReadOnly(fi, true, true, true), false)
        let di = FileInfo(dirPathNoOnlyRead)
        @Expect(checkReadOnly(di, false, false, false), false)
        @Expect(checkReadOnly(di, false, false, true), false)
        @Expect(checkReadOnly(di, false, true, false), false)
        @Expect(checkReadOnly(di, false, true, true), false)
        @Expect(checkReadOnly(di, true, false, false), false)
        @Expect(checkReadOnly(di, true, false, true), false)
        @Expect(checkReadOnly(di, true, true, false), false)
        @Expect(checkReadOnly(di, true, true, true), false)
    }
    func checkReadOnly(fi: FileInfo, r: Bool, w: Bool, e: Bool): Bool {
        fi.setReadable(r)
        fi.setWritable(w)
        fi.setExecutable(e)
        return fi.isReadOnly()
    }

    /*
     * Test description: Test fs::FileInfo
     * Test API:
     * public func setExecutable(executable: Bool): Bool
     */
    @TestCase
    func testInputValidSetExecutable(): Unit {
        var fi = FileInfo(dirFileNoOnlyRead)

        // ATTRIB +R
        @Expect(fi.setExecutable(false), false)
        @Expect(fi.canExecute(), false)

        fi = FileInfo(dirFileOnlyRead)
        @Expect(fi.setExecutable(false), false)

        @Expect(fi.canExecute(), false)

        fi = FileInfo("./utils/noextension")
        @Expect(fi.setExecutable(true), false)

        @Expect(fi.canExecute(), false)
    }

    /*
     * Test description: Test fs::FileInfo
     * Test API:
     * public func setReadable(readable: Bool): Bool
     */
    @TestCase
    func testInputValidSetReadable(): Unit {
        var fi = FileInfo(dirFileNoOnlyRead)

        // ATTRIB +R
        @Expect(fi.setReadable(true), true)
        @Expect(fi.canRead(), true)

        // ATTRIB -R
        fi = FileInfo(dirFileOnlyRead)
        @Expect(fi.setReadable(false), false)
        @Expect(fi.canRead(), true)

        fi = FileInfo("./utils/noextension")
        @Expect(fi.setReadable(false), false)
        @Expect(fi.canRead(), true)
    }

    /*
     * Test description: Test fs::FileInfo
     * Test API:
     * public func setWritable(writable: Bool): Bool
     */
    @TestCase
    func testInputValidSetWritable(): Unit {
        var fi = FileInfo(dirFileNoOnlyRead)

        // ATTRIB +R
        @Expect(fi.setWritable(false), true)
        @Expect(fi.canWrite(), false)

        // ATTRIB -R
        fi = FileInfo(dirFileOnlyRead)
        @Expect(fi.setWritable(true), true)
        @Expect(fi.canWrite(), true)

        fi = FileInfo("./utils/noextension")
        @Expect(fi.setWritable(false), true)
        @Expect(fi.canWrite(), false)
    }

    /**
     * Test description: Test fs::FileInfo
     * Test API:
     * public prop length: Int64
     */
    @TestCase
    func testInputValidLength(): Unit {
        let fileInfo1 = FileInfo("./data/file_info_test.txt")
        @Expect(fileInfo1.size, 38)

        // check dir file size.
        let dirPath = Path(Process.current.workingDirectory.toString())
        let fileInfo2 = FileInfo(dirPath)
        @Expect(fileInfo2.size > 0, true)
    }

    @TestCase
    func testBigfileLength() {
        let len = 1 << 33
        let data = Array<Byte>(1 << 16, repeat: b'a')
        // check big file or directory
        Directory.create("./tmpDir")
        let dirInfo = FileInfo("./tmpDir")
        @Expect(dirInfo.size, 0)

        let file = File.create("./tmpDir/bigfile.txt")
        let fileInfo = file.info
        @Expect(fileInfo.size, 0)

        for (_ in 0..1 << 17) {
            file.write(data)
        }
        @Expect(fileInfo.size, len)
        file.close()
        @Expect(dirInfo.size, len)
    }

    @TestCase
    func testConstructor() {
        var info = FileInfo("C:")
        @Expect(info.path.toString(), "C:")
        @Expect(info.parentDirectory?.path, None)

        info = FileInfo("C:\\")
        @Expect(info.path.toString(), "C:\\")
        @Expect(info.parentDirectory?.path, None)
    }
}

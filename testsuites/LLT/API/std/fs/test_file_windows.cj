/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Windows)EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Windows)EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args 

internal import std.fs.*
internal import std.io.*
internal import std.math.*
internal import std.runtime.*

/*
 * Test description: Test the funcs for File
 * Test class:
 * public class File <: Resource & IOStream
 */
@Test
class FileWindowsTest {
    /*
     * Test description: Test fs::File
     * Test API:
     * public func copyTo(out: OutputStream): Unit
     */
    @TestCase
    func testInputValidCopyTo(): Unit {
        var filePath = canonicalize(Path(".")).toString() + "\\测试.txt"
        var file = File(filePath, ReadWrite)
        var arr: Array<Byte> = Array<Byte>(10000, {i => UInt8(i % 256)})
        var arr1: Array<Byte> = arr.slice(5000, 5000).toArray()
        file.write(arr)
        file.seek(Begin(5000))
        var outputStream = ByteBuffer()
        copy(file, to: outputStream)
        var dataArray = readToEnd(outputStream)
        file.close()
        remove(filePath)
        @Expect(dataArray,arr1)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public static func create(path: String): File
           public static func exists(path: String): Bool
           public static func delete(path: Path): Unit
     */
    @TestCase
    func createAndExistsAndDelete(): Unit {
        let filePath01 = Path(canonicalize(Path(".")).toString() + "\\测试.txt")
        let file01 = File.create(filePath01)
        if (exists(filePath01)) {
            file01.close()
            remove(filePath01)
            @Expect(true)
        } else {
            @Expect(false)
        }

        let filePath02 = Path("\\\\?\\" + canonicalize(Path(".")).toString() + "\\测试.txt")
        let file02 = File.create(filePath02)
        if (exists(filePath02)) {
            file02.close()
            remove(filePath02)
            @Expect(true)
        } else {
            @Expect(false)
        }
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public static func createTemp(directoryPath: String): File
           public static func createTemp(directoryPath: String): File
     */
    @TestCase
    func createTemp(): Unit {
        let filePathStr01 = canonicalize(Path(".")).toString()
        let tempFile01 = File.createTemp(filePathStr01)
        let tempFilePath01 = tempFile01.info.path
        if (exists(tempFilePath01)) {
            remove(tempFilePath01)
            @Expect(true)
        } else {
            @Expect(false)
        }
        let filePathStr02 = ("\\\\?\\" + canonicalize(Path(".")).toString())
        let tempFile02 = File.createTemp(filePathStr02)
        let tempFilePath02 = tempFile02.info.path
        if (exists(tempFilePath02)) {
            remove(tempFilePath02)
            @Expect(true)
        } else {
            @Expect(false)
        }
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public static func move(sourcePath: String, destinationPath: String, overwrite: Bool): Unit
           public static func move(sourcePath: Path, destinationPath: Path, overwrite: Bool): Unit
           public static func copy(sourcePath: String, destinationPath: String, overwrite: Bool): Unit
           public static func copy(sourcePath: Path, destinationPath: Path, overwrite: Bool): Unit
     */
    @TestCase
    func moveCopy(): Unit {
        let filePathPath01 = Path(canonicalize(Path(".")).toString() + "\\测试.txt")
        let movedFilePath01 = Path(canonicalize(Path(".")).toString() + "\\测试_移动.txt")
        let copiedFilePath01 = Path(canonicalize(Path(".")).toString() + "\\测试_拷贝.txt")
        File(filePathPath01, ReadWrite).close()
        rename(filePathPath01, to: movedFilePath01, overwrite: true)
        if (!exists(movedFilePath01)) {
            @Expect(false)
        }
        copy(movedFilePath01, to: copiedFilePath01, overwrite: true)
        if (!exists(copiedFilePath01)) {
            @Expect(false)
        }
        remove(movedFilePath01)
        remove(copiedFilePath01)
        @Expect(true)

        let filePathPath02 = Path("\\\\?\\" + canonicalize(Path(".")).toString() + "\\测试.txt")
        let movedFilePath02 = Path("\\\\?\\" + canonicalize(Path(".")).toString() + "\\测试_移动.txt")
        let copiedFilePath02 = Path("\\\\?\\" + canonicalize(Path(".")).toString() + "\\测试_拷贝.txt")
        File(filePathPath02, ReadWrite).close()
        rename(filePathPath02, to: movedFilePath02, overwrite: true)
        if (!exists(movedFilePath02)) {
            @Expect(false)
        }
        copy(movedFilePath02, to: copiedFilePath02, overwrite: true)
        if (!exists(copiedFilePath02)) {
            @Expect(false)
        }
        remove(movedFilePath02)
        remove(copiedFilePath02)
        @Expect(true)

        let filePathPath03 = canonicalize(Path(".")).toString() + "\\测试.txt"
        let movedFilePath03 = canonicalize(Path(".")).toString() + "\\测试_移动.txt"
        let copiedFilePath03 = canonicalize(Path(".")).toString() + "\\测试_拷贝.txt"
        File(filePathPath03, ReadWrite).close()
        rename(filePathPath03, to: movedFilePath03, overwrite: true)
        if (!exists(movedFilePath03)) {
            @Expect(false)
        }
        copy(movedFilePath03, to: copiedFilePath03, overwrite: true)
        if (!exists(copiedFilePath03)) {
            @Expect(false)
        }
        remove(movedFilePath03)
        remove(copiedFilePath03)
        @Expect(true)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public func read(buffer: Array<Byte>): Int64
           public func write(buffer: Array<Byte>): Unit
           public func seek(sp: SeekPosition): Int64
     */
    @TestCase
    func fileReadWrite(): Unit {
        var filePath01 = Path(canonicalize(Path(".")).toString() + "\\测试.txt")
        var file01 = File(filePath01, ReadWrite)

        var writeArr01 = Array<Byte>(100, {i => UInt8(i % 256)})
        file01.seek(Begin(0))
        file01.write(writeArr01)

        var readArr01 = Array<Byte>(101, repeat: 0)
        file01.seek(Begin(0))
        var readNums01 = file01.read(readArr01)
        file01.close()
        remove(filePath01)
        @Expect(readNums01,100)
        @Expect(writeArr01,readArr01[0..readNums01])

        var filePath02 = Path("\\\\?\\" + canonicalize(Path(".")).toString() + "\\测试.txt")
        var file02 = File(filePath02, ReadWrite)

        var writeArr02 = Array<Byte>(100, {i => UInt8(i % 256)})
        file02.seek(Begin(0))
        file02.write(writeArr02)

        var readArr02 = Array<Byte>(101, repeat: 0)
        file02.seek(Begin(0))
        var readNums02 = file02.read(readArr02)
        file02.close()
        remove(filePath02)
        @Expect(readNums02,100)
        @Expect(writeArr02,readArr02[0..readNums02])

        var filePathStr03 = canonicalize(Path(".")).toString() + "\\测试.txt"
        var file03 = File(filePathStr03, ReadWrite)

        var writeArr03 = Array<Byte>(100, {i => UInt8(i % 256)})
        file03.seek(Begin(0))
        file03.write(writeArr03)

        var readArr03 = Array<Byte>(101, repeat: 0)
        file03.seek(Begin(0))
        var readNums03 = file03.read(readArr03)
        file03.close()
        remove(filePathStr03)
        @Expect(readNums03,100)
        @Expect(writeArr03,readArr03[0..readNums03])
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public static func readFrom(path: String): Array<Byte>
           public static func readFrom(path: Path): Array<Byte>
           public static func appendTo(path: String, buffer: Array<Byte>): Unit
           public static func appendTo(path: Path, buffer: Array<Byte>): Unit
     */
    @TestCase
    func readFromAndWriteTo(): Unit {
        let filePath01 = Path(canonicalize(Path(".")).toString() + "\\测试.txt")
        if (!exists(filePath01)) {
            File.create(filePath01).close()
        }
        var writeArr01 = "你好仓颉\n".toArray()
        File.appendTo(filePath01, writeArr01)
        var readArr01 = File.readFrom(filePath01)
        remove(filePath01)
        @Expect(writeArr01,readArr01)
        let filePath02 = Path("\\\\?\\" + canonicalize(Path(".")).toString() + "\\测试.txt")
        if (!exists(filePath02)) {
            File.create(filePath02).close()
        }
        var writeArr02 = "你好仓颉\n".toArray()
        File.appendTo(filePath02, writeArr02)
        var readArr02 = File.readFrom(filePath02)
        remove(filePath02)
        @Expect(writeArr02,readArr02)

        var filePathStr = canonicalize(Path(".")).toString() + "\\测试.txt"
        if (!exists(filePathStr)) {
            File.create(filePathStr).close()
        }
        var writeArr = "你好仓颉\n".toArray()
        File.appendTo(filePathStr, writeArr)
        var readArr = File.readFrom(filePathStr)
        remove(filePathStr)
        @Expect(writeArr,readArr)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public func seek(sp: SeekPosition): Int64
     */
    @TestCase
    func seek(): Unit {
        var filePath = canonicalize(Path(".")).toString() + "\\测试.txt"
        var file = File(filePath, ReadWrite)
        file.write("ABC".toArray())
        var offset = file.seek(Begin(3))
        @Expect(offset,3)
        file.write("DEFG".toArray())
        offset = file.seek(End(0))
        @Expect(offset,7)
        offset = file.seek(End(-2))
        @Expect(offset,5)
        offset = file.seek(Begin(2))
        @Expect(offset,2)
        remove(filePath)
        @Expect(true)
    }
    @TestCase
    func fileTooLong(): Unit {
        var countError = 0
        try {
            var oriFileName = canonicalize(Path(".")).toString() + "./aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.txt"
            let file = File(oriFileName, Write)
        } catch (e: FSException) {
            countError++
        }
        @Expect(countError,1)
    }
}

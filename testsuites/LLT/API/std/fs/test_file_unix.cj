/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./utils
// (Unix) EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Unix) EXEC: %run %run_opt %output %run_utest_opt
import std.fs.*
import std.io.SeekPosition
import std.math.*
import std.runtime.*
import std.io.*
import std.regex.*

/*
 * Test description: Test the funcs for File
 * Test class:
 * public class File <: Resource & IOStream
 */
@Test
class FileLinuxTest {
    /*
     * Test description: Test fs::File
     * Test API:
     * public init(path: String, openMode: OpenMode)
     * public init(path: Path, openMode: OpenMode)
     */
    @TestCase
    func testInputValidInit(): Unit {
        // test for string
        let fileName = "./testFile.txt"
        try (f = File(fileName, Write)) {
            println("[testInputValidInit] Write")
        }
        try (f = File(fileName, Read)) {
            println("[testInputValidInit] Read")
        }
        try (f = File(fileName, OpenMode.Append)) {
            println("[testInputValidInit] Append")
        }
        try (f = File(fileName, ReadWrite)) {
            println("[testInputValidInit] ReadWrite")
        }
        remove(fileName)

        // test for Path
        let path = Path("./testFile.txt")
        try (f = File(path, Write)) {
            println("[testInputValidInit] Write")
        }
        try (f = File(path, Read)) {
            println("[testInputValidInit] Read")
        }
        try (f = File(path, OpenMode.Append)) {
            println("[testInputValidInit] Append")
        }
        try (f = File(path, ReadWrite)) {
            println("[testInputValidInit] ReadWrite")
        }
        remove(fileName)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public init(path: String, openMode: OpenMode)
     * public init(path: Path, openMode: OpenMode)
     */
    @TestCase
    func testInputInValidInit(): Unit {
        var fileName1 = "./testFile.txt"
        var fileName2 = "./testFile2.txt"
        var fileName3 = "./testFile2.txt\0"
        if (!exists(fileName1)) {
            File.create(fileName1)
        }
        if (exists(fileName2)) {
            remove(fileName2)
        }
        var countError = 0

        try (file = File("", Read)) {} catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input path is empty.")
            countError++
            println("[testInputInValidInit] countError: ${countError}")
        }
        try (file = File(fileName3, Read)) {} catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input path value ${unsafe { fileName3.rawData() }} contains null character.")
            countError++
            println("[testInputInValidInit] countError: ${countError}")
        }
        try (file = File(Path(fileName2), Read)) {} catch (e: FSException) {
            @Assert(Regex("^The file `.*` does not exist or permission denied!$").matches(e.message))
            countError++
            println("[testInputInValidInit] countError: ${countError}")
        }
        try (file = File.create(fileName1)) {} catch (e: FSException) {
            @Expect(e.message, "The file `${fileName1}` is already exists.")
            countError++
            println("[testInputInValidInit] countError: ${countError}")
        }
        try (file = File(fileName2 + "/xxx", Read)) {} catch (e: FSException) {
            @Expect(e.message, "The input path 'parent' `${fileName2}` does not exist.")
            countError++
            println("[testInputInValidInit] countError: ${countError}")
        }

        @Expect(countError, 5)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public prop length: Int64
     */
    @TestCase
    func testFileLengthAndInfo(): Unit {
        var fileName1 = "./testFile2.txt"
        var file = File(fileName1, ReadWrite)
        @Expect(file.length is Int64,true)
        @Expect(file.info is FileInfo,true)
        file.close()

        var fileName2 = "./utils/NewFile.txt"
        file = File(fileName2, OpenMode.Append)
        @Expect(file.length,0)
        file.close()

        file = File(fileName2, Write)
        file.close()
        @Expect(file.length,-1)
        if (exists(fileName1)) {
            remove(fileName1)
        }
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public func read(buffer: Array<Byte>): Int64
     */
    @TestCase
    func testInputValidFileRead(): Unit {
        var fileName = "./testFile.txt"
        var file = File(fileName, Write)
        file.close()
        file = File(fileName, Read)
        var readArr = Array<Byte>(101, repeat: 0)
        @Expect(file.read(readArr) is Int64,true)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public func read(buffer: Array<Byte>): Int64
     */
    @TestCase
    func testInputInvalidFileRead(): Unit {
        var fileName = "./testFile.txt"
        var file = File(fileName, ReadWrite)
        var countError = 0
        try {
            var readArr = Array<Byte>()
            file.read(readArr)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The buffer is empty.")
            countError++
        }
        try {
            var readArr = Array<Byte>(101, repeat: 0)
            file.close()
            file.read(readArr)
        } catch (e: FSException) {
            @Assert(Regex("^The file `.*` not opened, can not to read.$").matches(e.message))
            countError++
        }
        try {
            file = File(fileName, Write)
            var readArr = Array<Byte>(101, repeat: 0)
            file.read(readArr)
        } catch (e: FSException) {
            @Assert(Regex("^The file `.*` does not have the read permission.$").matches(e.message))
            countError++
            file.close()
            remove(fileName)
        }
        @Expect(countError,3)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public func write(buffer: Array<Byte>): Unit
     */
    @TestCase
    func testInputValidWrite(): Unit {
        var fileName = "./testFile.txt"
        var file = File(fileName, Write)
        var writeArr = Array<Byte>(100, {i => UInt8(i % 256)})
        file.write(writeArr)
        writeArr = Array<Byte>()
        file.write(writeArr)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public func write(buffer: Array<Byte>): Unit
     */
    @TestCase
    func testInputInValidWrite(): Unit {
        var fileName = "./testFile.txt"
        var file = File(fileName, ReadWrite)
        var countError = 0
        try {
            var readArr = Array<Byte>(101, repeat: 0)
            file.close()
            file.write(readArr)
        } catch (e: FSException) {
            @Assert(Regex("^The file `.*` not opened, can not be written.$").matches(e.message))
            countError++
        }
        try {
            file = File(fileName, Read)
            var readArr = Array<Byte>(101, repeat: 0)
            file.write(readArr)
        } catch (e: FSException) {
            @Assert(Regex("^The file `.*` does not have the write permission.$").matches(e.message))
            countError++
            file.close()
            remove(fileName)
        }
        @Expect(countError,2)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public func seek(sp: SeekPosition): Int64
     */
    @TestCase
    func testInputValidSeek(): Unit {
        var fileName = "./testFile.txt"
        var file = File(fileName, ReadWrite)
        @Expect(file.seek(Begin(0)) is Int64,true)
        @Expect(file.seek(Current(0)) is Int64,true)
        @Expect(file.seek(End(0)) is Int64,true)
        file.close()
        remove(fileName)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public public func canRead(): Bool
     */
    @TestCase
    func testInputValidCanRead(): Unit {
        var fileName1 = "./testFile.txt"
        var fileName2 = "./testFile2.txt"
        if (!exists(fileName1)) {
            File.create(fileName1)
        }
        if (exists(fileName2)) {
            remove(fileName2)
        }
        var file1 = File(fileName1, Read)
        var file2 = File(fileName2, ReadWrite)
        var file3 = File(fileName2, OpenMode.Append)
        var file4 = File(fileName2, Write)
        @Expect(file1.canRead(), true)
        @Expect(file2.canRead(), true)
        @Expect(file3.canRead(), false)
        @Expect(file4.canRead(), false)

        file1.close()
        file2.close()
        @Expect(file1.canRead(), false)
        @Expect(file2.canRead(), false)
        file3.close()
        file4.close()
        remove(fileName1)
        remove(fileName2)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public public func canWrite(): Bool
     */
    @TestCase
    func testInputValidCanWrite(): Unit {
        var fileName1 = "./testFile.txt"
        var fileName2 = "./testFile2.txt"
        if (!exists(fileName1)) {
            File.create(fileName1)
        }
        if (exists(fileName2)) {
            remove(fileName2)
        }
        var file1 = File(fileName1, Read)
        var file2 = File(fileName2, ReadWrite)
        var file3 = File(fileName2, Write)
        var file4 = File(fileName2, OpenMode.Append)
        @Expect(file1.canWrite(), false)
        @Expect(file2.canWrite(), true)
        @Expect(file3.canWrite(), true)
        @Expect(file4.canWrite(), true)

        file2.close()
        file3.close()
        file4.close()
        @Expect(file2.canWrite() ,false)
        @Expect(file3.canWrite() ,false)
        @Expect(file4.canWrite() ,false)
        file1.close()
        remove(fileName1)
        remove(fileName2)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public func readToEnd(): Array<Byte>
     */
    @TestCase
    func testInputValidReadToEnd(): Unit {
        var fileName = "./testFile.txt"
        var file = File(fileName, ReadWrite)
        var writeArr = Array<Byte>(100, {i => UInt8(i % 256)})
        file.seek(Begin(0))
        file.write(writeArr)
        file.seek(Begin(0))
        var readArr1 = readToEnd(file)
        @Expect(readArr1 ,writeArr)
        file.seek(Begin(50))
        var readArr2 = readToEnd(file)
        file.close()
        remove(fileName)
        @Expect(readArr2 ,writeArr[50..100])
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public func readToEnd(): Array<Byte>
     */
    @TestCase
    func testInputInValidReadToEnd(): Unit {
        var fileName = "./testFile.txt"
        if (!exists(fileName)) {
            File.create(fileName)
        }

        var countError = 0
        var file1 = File(Path(fileName), Write)
        try {
            readToEnd(file1)
        } catch (e: FSException) {
            @Assert(Regex("^The file `.*` does not have the read permission.$").matches(e.message))
            countError++
        } finally {
            file1.close()
        }
        var file2 = File(Path(fileName), ReadWrite)
        try {
            file2.close()
            readToEnd(file2)
        } catch (e: FSException) {
            @Assert(Regex("^The file `.*` not opened, can not to read.$").matches(e.message))
            countError++
        }
        var file3 = File(".", Read)
        try {
            readToEnd(file3)
        } catch (e: FSException) {
            @Assert(Regex("^The file `.*` read error return -1 bytes.$").matches(e.message))
            countError++
        } finally {
            file3.close()
        }
        @Expect(countError,3)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public func copyTo(out: OutputStream): Unit
     */
    @TestCase
    func testInputValidCopyTo(): Unit {
        var fileName = "./testFile.txt"
        var fileName2 = "./testFile2.txt"

        if (!exists(fileName)) {
            File.create(fileName)
        }
        if (exists(fileName2)) {
            remove(fileName2)
        }
        var file1 = File(fileName, ReadWrite)
        var file2 = File(fileName2, ReadWrite)
        var file1Arr = Array<Byte>(100, {i => UInt8(i % 256)})
        file1.seek(Begin(0))
        file1.write(file1Arr)
        file1.seek(Begin(50))
        copy(file1, to: file2)
        file1.close()
        file2.close()
        remove(fileName)
        remove(fileName2)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public func copyTo(out: OutputStream): Unit
     */
    @TestCase
    func testInputInValidCopyTo(): Unit {
        var fileName = "./testFile.txt"
        var fileName2 = "./testFile2.txt"

        if (!exists(fileName)) {
            File.create(fileName)
        }
        if (exists(fileName2)) {
            remove(fileName2)
        }
        var file1 = File(Path(fileName), Write)
        var file2 = File(Path(fileName2), ReadWrite)
        var file3 = File(Path(fileName), ReadWrite)
        var file4 = File(Path(fileName2), ReadWrite)

        var countError = 0
        try {
            copy(file1, to: file2)
        } catch (e: FSException) {
            @Assert(Regex("^The file `.*` does not have the read permission.$").matches(e.message))
            countError++
        } finally {
            file1.close()
            file2.close()
        }

        try {
            file3.close()
            copy(file3, to: file4)
        } catch (e: FSException) {
            @Assert(Regex("^The file `.*` not opened, can not to read.$").matches(e.message))
            countError++
        } finally {
            file4.close()
        }
        remove(fileName)
        remove(fileName2)

        @Expect(countError,2)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public func close(): Unit
     */
    @TestCase
    func testInputValidClose(): Unit {
        var fileName = "./testFile.txt"
        if (!exists(fileName)) {
            File.create(fileName)
        }
        var file = File(fileName, ReadWrite)
        file.close()
        remove(fileName)
        @Expect(true)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public func isClosed(): Bool
     */
    @TestCase
    func testInputInValidIsClosed(): Unit {
        var fileName = "./testFile.txt"
        if (!exists(fileName)) {
            File.create(fileName)
        }
        var file = File(fileName, ReadWrite)
        @Expect(file.isClosed(),false)
        file.close()
        @Expect(file.isClosed(),true)
        remove(fileName)
        @Expect(true)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public static func exists(path: String): Bool
     */
    @TestCase
    func testInputInValidExists(): Unit {
        var fileName = "./testFile.txt"
        if (!exists(fileName)) {
            File.create(fileName)
        }
        @Expect(exists(Path(fileName)),true)
        @Expect(exists(Path("./")),true)
        remove(fileName)
        @Expect(true)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public static func create(path: String): File
     */
    @TestCase
    func testInputValidCreate(): Unit {
        var fileName = "./testFile.txt"
        if (!exists(fileName)) {
            File.create(fileName).close()
        }
        remove(fileName)
        if (!exists(fileName)) {
            File.create(Path(fileName)).close()
        }
        remove(fileName)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public static func create(path: String): File
     */
    @TestCase
    func testInputInValidCreate(): Unit {
        var countError = 0
        try {
            var fileName1 = "./testFile.txt"
            var fileName2 = ""
            var fileName3 = "./testFile.txt\0"
            if (!exists(fileName1)) {
                File.create(fileName1)
            }
            try {
                File.create(fileName1)
            } catch (e: FSException) {
                @Expect(e.message,"The file `${fileName1}` is already exists.")
                countError++
            }
            try {
                File.create(Path(fileName1))
            } catch (e: FSException) {
                @Expect(e.message,"The file `${fileName1}` is already exists.")
                countError++
            }
            try {
                File.create(fileName2)
            } catch (e: IllegalArgumentException) {
                @Expect(e.message,"The input path is empty.")
                countError++
            }
            try {
                File.create(Path(fileName2))
            } catch (e: IllegalArgumentException) {
                @Expect(e.message,"The input path is empty.")
                countError++
            }
            try {
                File.create(Path(fileName3))
            } catch (e: IllegalArgumentException) {
                @Expect(e.message,"The input path value ${unsafe { fileName3.rawData() }} contains null character.")
                countError++
            }
            remove(fileName1)
        } catch (_: Exception) {
            countError++
        }
        @Expect(countError,5)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public static func createTemp(directoryPath: String): File
     */
    @TestCase
    func testInputValidCreateTemp(): Unit {
        var dirName = "./"
        var file = File.createTemp(Path(dirName))
        remove(file.info.path)
        @Expect(file is File)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public static func createTemp(directoryPath: String): File
     */
    @TestCase
    func testInputInValidCreateTemp(): Unit {
        var countError = 0
        var dirName1 = "./testInputInValidCreateTemp"
        var dirName2 = ""
        if (exists(dirName1)) {
            remove(dirName1)
        }
        try {
            File.createTemp(dirName1)
        } catch (e: FSException) {
            @Expect(e.message,"Failed to canonical: the input path `${dirName1}` may not exist or permission denied!")
            countError++
        }
        try {
            File.createTemp(dirName2)
        } catch (e: IllegalArgumentException) {
            countError++
        }

        if (exists(dirName1)) {
            remove(dirName1)
        }
        @Expect(countError,2)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public static func readFrom(path: String): Array<Byte>
     */
    @TestCase
    func testInputValidReadFrom(): Unit {
        var fileName = "./testFile.txt"
        var file = File(fileName, ReadWrite)
        var writeArr = Array<Byte>(100, {i => UInt8(i % 256)})
        file.seek(Begin(0))
        file.write(writeArr)
        file.close()
        var fileAllBytes = File.readFrom(Path(fileName))
        remove(fileName)
        @Expect(writeArr,fileAllBytes)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public static func readFrom(path: String): Array<Byte>
     */
    @TestCase
    func testInputInValidReadFrom(): Unit {
        var countError = 0
        var fileName1 = "./testFil.txt"
        var fileName2 = ""
        var fileName3 = "./testFil.txt\0"
        try {
            File.readFrom(Path(fileName1))
        } catch (e: FSException) {
            @Assert(Regex("^The file `.*` does not exist or permission denied!$").matches(e.message))
            countError++
        }
        try {
            File.readFrom(Path(fileName2))
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The input path is empty.")
            countError++
        }
        try {
            File.readFrom(Path(fileName3))
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The input path value ${unsafe { fileName3.rawData() }} contains null character.")
            countError++
        }
        @Expect(countError,3)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public static func appendTo(path: Path, buffer: Array<Byte>): Unit
     */
    @TestCase
    func testInputValidAppendTo(): Unit {
        var fileName = "./testFile.txt"
        var writeArr = Array<Byte>(100, {i => UInt8(i % 256)})
        File.appendTo(Path(fileName), writeArr.slice(0, 50).toArray())
        File.appendTo(Path(fileName), writeArr.slice(50, 50).toArray())
        var readArr1 = File.readFrom(fileName)
        remove(fileName)
        @Expect(writeArr,readArr1)

        File.appendTo(Path(fileName), writeArr.slice(0, 50).toArray().toArray())
        File.writeTo(Path(fileName), writeArr)
        var readArr2 = File.readFrom(fileName)
        remove(fileName)
        @Expect(writeArr, readArr2)

        File.appendTo(Path(fileName), writeArr.slice(0, 100).toArray().toArray())
        var readArr3 = File.readFrom(fileName)
        remove(fileName)
        @Expect(writeArr,readArr3)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public static func appendTo(path: Path, buffer: Array<Byte>): Unit
     */
    @TestCase
    func testInputInValidAppendTo(): Unit {
        var countError = 0
        var fileName01 = "./testFile.txt"
        var fileName02 = "./testFile.txt\0"
        var writeArr = Array<Byte>(100, {i => UInt8(i % 256)})

        File.appendTo(Path(fileName01), writeArr)

        try {
            File.appendTo(Path(fileName02), Array<Byte>(100, repeat: 0))
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The input path value ${unsafe { fileName02.rawData() }} contains null character.")
            countError++
        }
        @Expect(countError, 1)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public static func delete(path: Path): Unit
     */
    @TestCase
    func testInputValidDelete(): Unit {
        var fileName = "./testFile.txt"
        var file = File(fileName, ReadWrite)
        var writeArr = Array<Byte>(100, {i => UInt8(i % 256)})
        file.seek(Begin(0))
        file.write(writeArr)
        file.close()
        File.readFrom(Path(fileName))
        remove(Path(fileName))
        @Expect(!exists(fileName))
        File(fileName, Write).close()
        File(fileName, OpenMode.Append).close()
        GC()
        sleep(Duration.millisecond * 200)
        remove(fileName)
        @Expect(!exists(fileName))
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public static func delete(path: Path): Unit
     */
    @TestCase
    func testInputInValidDelete(): Unit {
        var fileName01 = "./testFile.txt"
        var fileName02 = "./testFile1.txt"
        var countError = 0
        if (exists(fileName01)) {
            remove(Path(fileName01))
        }

        try {
            if (!exists(fileName02)) {
                File.create(fileName02)
            }
            remove(fileName02 + "no")
        } catch (e: FSException) {
            @Expect(e.message.contains("No such file or directory"))
            countError++
        } finally {
            if (exists(fileName02)) {
                remove(fileName02)
            }
        }
        try {
            remove(fileName01)
        } catch (e: FSException) {
            @Expect(e.message.contains("No such file or directory"))
            countError++
        }
        @Expect(countError,2)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public static func move(sourcePath: Path, destinationPath: Path, overwrite: Bool): Unit
     */
    @TestCase
    func testInputInValidMove(): Unit {
        var countError = 0
        var fileName1 = "./testFile1.txt"
        var fileName2 = "./utils/testFile1.txt"
        var fileName3 = "./utils/testFile3.txt"
        if (!exists(fileName1)) {
            File(fileName1, ReadWrite).close()
        }
        if (!exists(fileName2)) {
            File(fileName2, ReadWrite).close()
        }
        try {
            rename(Path(fileName1), to: Path(fileName2), overwrite: false)
        } catch (e: FSException) {
            @Expect(e.message,"Destination path 'to' `${fileName2}` is already exists and overwrite is false.")
            countError++
        }
        try {
            rename(Path(fileName3), to: Path(fileName1 + "noexist"), overwrite: false)
        } catch (e: FSException) {
            @Expect(e.message,"Failed to rename `./utils/testFile3.txt` to `./testFile1.txtnoexist` return -2:\"No such file or directory\".")
            countError++
        }
        try {
            rename(Path(fileName1), to: Path(""), overwrite: false)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The input path 'to' is empty.")
            countError++
        }
        var fileName4 = ""

        for (_ in 0..4100) {
            fileName4 += "a"
        }
        try {
            rename(fileName1, to: fileName4, overwrite: false)
        } catch (e: FSException) {
            @Expect(e.message.contains("File name too long"))
            countError++
        }
        if (exists(fileName1)) {
            remove(Path(fileName1))
        }
        if (exists(fileName2)) {
            remove(Path(fileName2))
        }
        if (exists(fileName3)) {
            remove(Path(fileName3))
        }
        @Expect(countError,4)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public static func copy(sourcePath: String, destinationPath: String, overwrite: Bool): Unit
     */
    @TestCase
    func testInputValidCopy(): Unit {
        var fileName1 = "./testFile1.txt"
        if (!exists(fileName1)) {
            File(fileName1, ReadWrite).close()
        }
        var fileName2 = "./testFile2.txt"
        copy(fileName1, to: fileName2, overwrite: false)
        @Expect(exists(fileName1))
        @Expect(exists(fileName2))
        if (exists(fileName1)) {
            remove(Path(fileName1))
        }
        if (exists(fileName2)) {
            remove(Path(fileName2))
        }

        var dirpath = canonicalize(Path("./")).join("tmp").toString()
        var dirpaths = ["./tmp/file1.txt", "./tmp/file2.txt"]
        Directory.create(dirpath)
        File.create(dirpaths[0]).close()
        File.create(dirpaths[1]).close()
        var src = FileInfo(dirpaths[0])
        src.setExecutable(true)
        src.setReadable(true)
        src.setWritable(true)
        @Expect(src.canExecute(), true)
        @Expect(src.canRead(), true)
        @Expect(src.canWrite(), true)

        var dst = FileInfo(dirpaths[1])
        dst.setExecutable(true)
        dst.setReadable(true)
        dst.setWritable(false)
        @Expect(dst.canExecute(), true)
        @Expect(dst.canRead(), true)
        @Expect(dst.canWrite(), false)
        remove(dirpath, recursive: true)

        Directory.create(dirpath)
        File.create(dirpaths[0]).close()
        File.create(dirpaths[1]).close()
        src = FileInfo(dirpaths[0])
        src.setExecutable(true)
        src.setReadable(false)
        src.setWritable(true)
        @Expect(src.canExecute(), true)
        @Expect(src.canRead(), false)
        @Expect(src.canWrite(), true)

        dst = FileInfo(dirpaths[1])
        dst.setExecutable(true)
        dst.setReadable(true)
        dst.setWritable(true)
        @Expect(dst.canExecute(), true)
        @Expect(dst.canRead(), true)
        @Expect(dst.canWrite(), true)
        remove(dirpath, recursive: true)

        Directory.create(dirpath)
        var srcFile = File.create(dirpaths[0])
        srcFile.write("123".toArray())
        var dstFile = File.create(dirpaths[1])
        src = FileInfo(dirpaths[0])
        src.setExecutable(false)
        src.setReadable(true)
        src.setWritable(false)
        @Expect(src.canExecute(), false)
        @Expect(src.canRead(), true)
        @Expect(src.canWrite(), false)

        dst = FileInfo(dirpaths[1])
        dst.setExecutable(false)
        dst.setReadable(false)
        dst.setWritable(true)
        @Expect(dst.canExecute(), false)
        @Expect(dst.canRead(), false)
        @Expect(dst.canWrite(), true)
        copy(dirpaths[0], to: dirpaths[1], overwrite: true)
        @Expect(dstFile.length, "123".size)
        srcFile.close()
        dstFile.close()
        remove(dirpath, recursive: true)
        @Expect(true)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public static func copy(sourcePath: String, destinationPath: String, overwrite: Bool): Unit
     */
    @TestCase
    func testInputInValidCopy(): Unit {
        var countError = 0
        var fileName1 = "./testFile1.txt"
        var fileName2 = "./utils/testFile1.txt"
        var dirpath = canonicalize(Path("./")).join("tmp").toString()
        var dirpaths = ["./tmp/file1.txt", "./tmp/file2.txt"]
        Directory.create(dirpath)
        if (!exists(fileName1)) {
            File(fileName1, ReadWrite).close()
        }
        if (!exists(fileName2)) {
            File.create(fileName2)
            File(fileName2, Read).close()
        }
        try {
            File(fileName1, Write).close()
            copy(Path(fileName1), to: Path(fileName2), overwrite: false)
        } catch (e: FSException) {
            countError++
        }
        try {
            rename(Path(fileName1), to: Path(""), overwrite: false)
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            rename(Path(fileName1), to: Path("./testFile1.txt"), overwrite: false)
        } catch (e: IllegalArgumentException | FSException) {
            countError++
        }
        try {
            var src = FileInfo(dirpaths[0])
            src.setExecutable(true)
            src.setReadable(true)
            src.setWritable(true)
            var dst = FileInfo(dirpaths[1])
            dst.setExecutable(true)
            dst.setReadable(true)
            dst.setWritable(false)
            copy(dirpaths[0], to: dirpaths[1], overwrite: true)
        } catch (e: FSException) {
            @Expect(e.message,"The input path `./tmp/file1.txt` does not exist.")
            countError++
        }
        try {
            var src = FileInfo(dirpaths[0])
            src.setExecutable(true)
            src.setReadable(false)
            src.setWritable(true)
            var dst = FileInfo(dirpaths[1])
            dst.setExecutable(true)
            dst.setReadable(true)
            dst.setWritable(true)
            copy(dirpaths[0], to: dirpaths[1], overwrite: true)
        } catch (e: FSException) {
            @Expect(e.message,"The input path `./tmp/file1.txt` does not exist.")
            countError++
        } finally {
            if (exists(dirpath)) {
                remove(dirpath, recursive: true)
            }
        }

        if (exists(fileName1)) {
            remove(Path(fileName1))
        }
        if (exists(fileName2)) {
            remove(Path(fileName2))
        }
        @Expect(countError,5)
    }

    /*
     * Test description: Test fs::File
     * Test API:
     * public func flush(): Unit
     */
    @TestCase
    func testInputValidFlush(): Unit {
        var fileName = "./testFile.txt"
        var file = File(fileName, ReadWrite)
        file.flush()
        file.close()
        remove(fileName)
        @Expect(!exists(fileName))
    }
}

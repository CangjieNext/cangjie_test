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
// (Windows)EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args 

internal import std.fs.*
internal import std.io.SeekPosition
internal import std.math.*
internal import std.runtime.*
internal import std.collection.*

/*
 * Test description: Test the funcs for Directory
 * Test class:
 * public class Directory <: Iterable<FileInfo>
 */
@Test
class DirectoryWindowsTest {
    let dirPath1 = Path("./Tem11")
    let dirPath2 = Path("./Tem22")
    let dirPath3 = Path("./Tem33")
    let tempFileName: String = "1.txt"
    let MAX_DIR_PATH_SIZE: Int64 = 247
    let dirLen = 240

    /*
     * Test description: Test fs::Directory
     * Test API:
     * public static func isEmpty(path: String): Bool
     */
    @TestCase
    func testInputValidIsEmpty(): Unit {
        if (Directory.isEmpty("./data/directory")) {
            @Expect(false)
        }
        let currentPath: String = canonicalize(Path(".")).toString()
        let dosPath = "\\\\?\\" + currentPath
        Directory.create(dosPath + "\\测试仓颉directory123", recursive: true)
        if (!Directory.isEmpty(dosPath + "\\测试仓颉directory123")) {
            remove(dosPath + "\\测试仓颉directory123", recursive: true)
            @Expect(false)
        }
        remove(dosPath + "\\测试仓颉directory123", recursive: true)
        @Expect(true)
    }

    /*
     * Test description: Test fs::Directory
     * Test API:
     * public static func isEmpty(path: String): Bool
     */
    @TestCase
    func testInputInValidIsEmpty(): Unit {
        var countError = 0
        try {
            var dirname = "./data/directory/yur"
            if (!exists(dirname)) {
                Directory.create(dirname)
            }

            remove(dirname, recursive: true)
            Directory.isEmpty(dirname)
        } catch (e: FSException) {
            @Expect(e.message,"The path `./data/directory/yur` does not exist.")
            countError++
        }
        @Expect(countError,1)
    }

    /*
     * Test description: Test fs::Directory
     * Test API:
     * public static func walk(path: String, f: (FileInfo)->Bool): Unit
     */
    @TestCase
    func testInputValidWalk(): Unit {
        let fn = Box<Int64>(0)
        let dn = Box<Int64>(0)
        Directory.walk("./data/directory") {
            info =>
            if (info.isRegular()) {
                fn.value++
            }
            if (info.isDirectory()) {
                dn.value++
            }
            true
        }
        if (fn.value != 2 || dn.value != 2) {
            @Expect(false)
        }
        @Expect(true)
    }

    /*
     * Test description: Test fs::Directory
     * Test API:
     * public static func readFrom(path: String): Array<FileInfo>
     */
    @TestCase
    func testInputValidReadFrom(): Unit {
        var fn = 0
        var dn = 0
        for (f in Directory.readFrom("./data/directory")) {
            if (f.isRegular()) {
                fn++
            }
            if (f.isDirectory()) {
                dn++
            }
        }
        if (fn != 2 || dn != 2) {
            @Expect(false)
        }
    }

    /*
     * Test description: Test fs::Directory
     * Test API:
     * public static func readFrom(path: String): Array<FileInfo>
     */
    @TestCase
    func testInputValidDirectories(): Unit {
        var fn = 0
        var dn = 0
        for (f in Directory.readFrom("./data/directory").iterator().filter({info => info.isDirectory()})) {
            if (f.isRegular()) {
                fn++
            }
            if (f.isDirectory()) {
                dn++
            }
        }
        if (fn != 0 || dn != 2) {
            @Expect(false)
        }
        @Expect(true)
    }

    /*
     * Test description: Test fs::Directory
     * Test API:
     * public static func readFrom(path: String): Array<FileInfo>
     */
    @TestCase
    func testInputValidFiles(): Unit {
        var fn = 0
        var dn = 0
        for (f in Directory.readFrom("./data/directory").iterator().filter({info => info.isRegular()})) {
            if (f.isRegular()) {
                fn++
            }
            if (f.isDirectory()) {
                dn++
            }
        }
        if (fn != 2 || dn != 0) {
            @Expect(false)
        }
        @Expect(true)
    }

    /*
     * Test description: Test fs::Directory
     * Test API:
     * public static func exists(path: String): Bool
     */
    @TestCase
    func testInputValidExists(): Unit {
        if (!exists("./data/directory")) {
            @Expect(false)
        }
        if (exists("./data/directory2")) {
            @Expect(false)
        }
        if (!exists(Path("./data/directory"))) {
            @Expect(false)
        }
        if (exists(Path("./data/directory2"))) {
            @Expect(false)
        }
        @Expect(true)
    }

    /*
     * Test description: Test fs::Directory
     * Test API:
     * public static func create(path: String, recursive!: Bool = false): Unit
     */
    @TestCase
    func testInputValidCreate(): Unit {
        let currentPath: String = canonicalize(Path(".")).toString()
        let dosPath = "\\\\?\\" + currentPath
        let pathList: Array<(String, Bool)> = [
            (dosPath + "\\测试仓颉directory", true),
            ("./创建", false),
            ("./创建/aab", true)
        ]
        for ((item, recursive) in pathList) {
            var path = Path(item)
            if (exists(path)) {
                remove(path, recursive: true)
            }
            Directory.create(path, recursive: recursive)
            var isExist = exists(path)
            if (isExist) {
                remove(path)
            } else {
                @Expect(false)
            }
        }
        @Expect(true)
    }

    /*
     * Test description: Test fs::Directory
     * Test API:
     * public static func create(path: String, recursive!: Bool = false): Unit
     */
    @TestCase
    func testInputInValidCreate(): Unit {
        var countError = 0
        var path = ./aaa/bbb"
        try {
            Directory.create(path)
        } catch (e: FSException) {
            @Expect(e.message,"Failed to create directory `${path}`, parent directory: `./aaa` does not exist.")
            countError++
        }
        path = "./data/directory/qwe"
        try {
            if (exists(path)) {
                Directory.create(path)
            } else {
                Directory.create(path)
                Directory.create(path)
            }
        } catch (e: FSException) {
            @Expect(e.message,"The path `${path}` is already exists.")
            countError++
        } finally {
            if (exists(path)) {
                remove(path)
            }
        }
        path = ""
        try {
            Directory.create(path)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"Invalid path `${path}`, failed to create directory.")
            countError++
        }
        path = "/"
        try {
            Directory.create(path)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"Invalid path `${path}`, failed to create directory.")
            countError++
        }
        path = "./data/directory/qwe\0"
        try {
            Directory.create(path)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"Invalid path `${path}`, failed to create directory.")
            countError++
        }
        path = "C://aabcdefghijklmnopqrstuvwxyz_abcdefghijklmnopqrstuvwxyz_abcdefghijklmnopqrstuvwxyz_abcdefghijklmnopqrstuvwxyz_abcdefghijklmnopqrstuvwxyz_abcdefghijklmnopqrstuvwxyz_abcdefghijklmnopqrstuvwxyz_abcdefghijklmnopqrstuvwxyz_abcdefghijklmnopqrstuvwxyz_abcdefghijklmnopqrstuvwxyzaabcdefghijklmnopqrstuvwxyz_abcdefghijklmnopqrstuvwxyz_abcdefghijklmnopqrstuvwxyz_abcdefghijklmnopqrstuvwxyz_abcdefghijklmnopqrstuvwxyz_abcdefghijklmnopqrstuvwxyz_abcdefghijklmnopqrstuvwxyz_abcdefghijklmnopqrstuvwxyz_abcdefghijklmnopqrstuvwxyz_abcdefghijklmnopqrstuvwxyz"
        try {
            Directory.create(path, recursive: true)
        } catch (e: FSException) {
            countError++
        }
        @Expect(countError,6)
    }

    /*
     * Test description: Test fs::Directory
     * Test API:
     * public static func createTemp(directoryPath: String): Path
     */
    @TestCase
    func testInputValidCreateTemp(): Unit {
        let pathList: Array<String> = ["./", "./创建/aab"]
        Directory.create("./创建/aab", recursive: true)
        for (item in pathList) {
            let tempDirPath: Path = Directory.createTemp(item)
            if (exists(tempDirPath)) {
                remove(tempDirPath)
            }
        }
        remove("./创建", recursive: true)
        @Expect(true)
    }

    /*
     * Test description: Test fs::Directory
     * Test API:
     * public static func createTemp(directoryPath: String): Path
     */
    @TestCase
    func testInputInValidCreateTemp(): Unit {
        var countError = 0
        var path = "./aaa/bbb"
        try {
            Directory.createTemp(path)
        } catch (e: FSException) {
            @Expect(e.message,"Failed to canonical: the path `${path}` may not exist or permission denied!")
            countError++
        }

        try {
            Directory.createTemp("")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The rawPath is an empty string.")
            countError++
        }
        try {
            Directory.createTemp("\0")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The rawPath value [0] contains null character.")
            countError++
        }
        @Expect(countError,3)
    }

    /*
     * Test description: Test fs::Directory
     * Test API:
     * public static func delete(path: Path, recursive!: Bool = false): Unit
     */
    @TestCase
    func testInputValidDelete(): Unit {
        var path = "./data/directory/qwe"
        Directory.create(path, recursive: true)
        if (!exists(path)) {
            @Expect(false)
        } else {
            remove(path)
            if (exists(path)) {
                @Expect(false)
            }
        }
        path = "data/directory/qwe"
        Directory.create(path)
        if (!exists(path)) {
            @Expect(false)
        } else {
            remove(path)
            if (exists(path)) {
                @Expect(false)
            }
        }

        Directory.create("./data/directory/qwe/asd/aasd/qwe/asd/afs", recursive: true)
        if (!exists("./data/directory/qwe/asd/aasd/qwe/asd/afs")) {
            @Expect(false)
        } else {
            remove("./data/directory/qwe", recursive: true)
            if (exists("./data/directory/qwe/asd/aasd/qwe/asd/afs")) {
                @Expect(false)
            }
        }
        let curPath = canonicalize(Path("./"))
        let tempDir = curPath.join("Temp")
        var dirPath1 = tempDir
        var dirPath2 = tempDir
        var remainingSize: Int64 = MAX_DIR_PATH_SIZE - tempDir.toString().size
        if (exists(tempDir)) {
            remove(tempDir, recursive: true)
        }
        while (remainingSize >= 4) {
            dirPath1 = dirPath1.join("tem")
            dirPath2 = dirPath2.join("xem")
            remainingSize -= 4
        }
        Directory.create(dirPath1, recursive: true)
        if (!exists(dirPath1)) {
            @Expect(false)
        }
        Directory.create(dirPath2, recursive: true)
        if (!exists(dirPath2)) {
            @Expect(false)
        }
        let filePath = dirPath1.join(tempFileName)
        File(filePath, ReadWrite).close()
        if (!exists(filePath)) {
            @Expect(false)
        }
        remove(tempDir, recursive: true)
        @Expect(true)
    }

    /*
     * Test description: Test fs::Directory
     * Test API:
     * public static func move(sourceDirPath: Path, destinationDirPath: Path, overwrite: Bool): Unit
     */
    @TestCase
    func testInputInValidMove(): Unit {
        var countError = 0
        let sourcePath = "C:\\test1"
        let subSrcFile = sourcePath + "/test1.txt"
        let targetPath = "C:\\test2"

        // 1. target path empty
        try {
            rename("", to: "", overwrite: true)
        } catch (e: IllegalArgumentException) {
            countError++
        }

        // 2. target path contains r'\0'
        try {
            rename("", to: "123\0123", overwrite: true)
        } catch (e: IllegalArgumentException) {
            countError++
        }

        // 3. source path not exists
        try {
            rename("C:\\rtghj", to: targetPath, overwrite: true)
        } catch (e: FSException) {
            countError++
        }
        if (exists(sourcePath)) {
            remove(sourcePath, recursive: true)
        }
        Directory.create(sourcePath)
        File.create(subSrcFile).close()
        if (exists(targetPath)) {
            remove(targetPath, recursive: true)
        }
        Directory.create(targetPath)

        // 4. target exists and overwrite is false
        try {
            rename(sourcePath, to: targetPath, overwrite: false)
        } catch (e: FSException) {
            countError++
        } finally {
            if (exists(sourcePath)) {
                remove(sourcePath, recursive: true)
            }
            if (exists(targetPath)) {
                remove(targetPath, recursive: true)
            }
        }
        @Expect(countError,4)
    }

    /*
     * Test description: Test fs::Directory
     * Test API:
     * public static func copy(sourceDirPath: Path, destinationDirPath: Path, overwrite: Bool): Unit
     */
    @TestCase
    func testInputValidCopy(): Unit {
        deleteFile()
        let path1 = dirPath1.join("tem1")
        let path2 = dirPath2.join("tem2")
        Directory.create(path1, recursive: true)
        Directory.create(path2, recursive: true)
        let file = File(path1.join("1.txt"), ReadWrite)
        file.close()
        copy(dirPath1, to: dirPath2, overwrite: true)
        if (!exists("./Tem22/tem1/1.txt")) {
            @Expect(false)
        }
        try {
            copy(dirPath1, to: dirPath1, overwrite: true)
        } catch (_: FSException) {
            return
        }
        @Expect(false)
    }

    /*
     * Test description: Test fs::Directory
     * Test API:
     * public static func copy(sourceDirPath: Path, destinationDirPath: Path, overwrite: Bool): Unit
     */
    @TestCase
    func testCopyToExistFile(): Unit {
        deleteFile()
        let path1 = dirPath1.join("tem1")
        let path2 = dirPath2.join("tem1")
        Directory.create(path1, recursive: true)
        Directory.create(path2, recursive: true)
        let f1 = File(path1.join("1.txt"), ReadWrite)
        let f2 = File(path2.join("1.txt"), ReadWrite)
        f1.write("1".toArray())
        f2.write("2".toArray())
        f1.close()
        f2.close()
        copy(dirPath1, to: dirPath2, overwrite: true)
        let t1 = String.fromUtf8(File.readFrom(path1.join("1.txt")))
        let t2 = String.fromUtf8(File.readFrom(path2.join("1.txt")))
        if (t1 != "1" || t2 != "1") {
            @Expect(false)
        }
        @Expect(true)
    }

    /*
     * Test description: Test fs::Directory
     * Test API:
     * public static func copy(sourceDirPath: Path, destinationDirPath: Path, overwrite: Bool): Unit
     */
    @TestCase
    func testFileAccess(): Unit {
        deleteFile()
        let path1 = Path("./Tem11/tem1")
        let path2 = Path("./Tem22")
        Directory.create(path1, recursive: true)
        Directory.create(path2, recursive: true)
        let srcFile = File(path1.join("1.txt"), ReadWrite)
        let srcFileInfo = srcFile.info
        srcFileInfo.setExecutable(!srcFileInfo.canExecute())
        srcFile.close()
        copy(dirPath1, to: dirPath2, overwrite: true)
        let destFile = File("./Tem22/tem1/1.txt", ReadWrite)
        let destFileInfo = destFile.info
        destFile.close()
        if (destFileInfo.canRead() != srcFileInfo.canRead()) {
            @Expect(false)
        }
        if (destFileInfo.canWrite() != srcFileInfo.canWrite()) {
            @Expect(false)
        }
        if (destFileInfo.canExecute() != srcFileInfo.canExecute()) {
            @Expect(false)
        }
        @Expect(true)
    }

    /*
     * Test description: Test fs::Directory
     * Test API:
     * public static func copy(sourceDirPath: Path, destinationDirPath: Path, overwrite: Bool): Unit
     */
    @TestCase
    func testDirectoryCopyStress(): Unit {
        var dirPath1 = Path("./TemCopy1")
        var dirPath2 = Path("./TemCopy2")
        var dirPath3 = Path("./TemCopy3")
        var depth = 0
        deletePath(dirPath1, true)
        deletePath(dirPath2, true)
        deletePath(dirPath3, true)
        // current path length
        Directory.create(dirPath1, recursive: true)
        var len = canonicalize(dirPath1).toString().size + 1
        while (len + 2 < dirLen) {
            len += 2
            depth++
            dirPath1 = dirPath1.join("1")
            dirPath2 = dirPath2.join("2")
            dirPath3 = dirPath3.join("3")
        }
        deletePath(dirPath1, true)
        deletePath(dirPath2, true)
        deletePath(dirPath3, true)
        Directory.create(dirPath1, recursive: true)
        Directory.create(dirPath2, recursive: true)
        Directory.create(dirPath3, recursive: true)
        @Expect(stressDirectoryCopy(dirPath1, dirPath2, depth),0)
        deletePath(dirPath1, true)
        deletePath(dirPath2, true)
        deletePath(dirPath3, true)
        @Expect(true)
    }

    /*
     * Test description: Test fs::Directory
     * Test API:
     * public static func copy(sourceDirPath: Path, destinationDirPath: Path, overwrite: Bool): Unit
     */
    @TestCase
    func testDirectoryCopySameprefix(): Unit {
        var dirpath = canonicalize(Path("./")).join("tmp")
        var destPath = canonicalize(Path("./")).join("tmp3")
        if (exists(dirpath)) {
            remove(dirpath, recursive: true)
        }
        if (exists(destPath)) {
            remove(destPath, recursive: true)
        }
        Directory.create(dirpath, recursive: true)
        File.create(dirpath.join("temp.txt"))
        copy(dirpath, to: destPath, overwrite: false)
        if (!exists(destPath.join("temp.txt"))) {
            @Expect(false)
        }
        if (exists(dirpath)) {
            remove(dirpath, recursive: true)
        }
        if (exists(destPath)) {
            remove(destPath, recursive: true)
        }
        @Expect(true)
    }

    /*
     * Test description: Test fs::Directory
     * Test API:
     * public static func copy(sourceDirPath: Path, destinationDirPath: Path, overwrite: Bool): Unit
     */
    @TestCase
    func testInputInValidCopy(): Unit {
        var countError = 0
        deleteFile()
        try {
            copy("\0", to: "\0", overwrite: true)
        } catch (e: IllegalArgumentException | FSException) {
            countError++
        }
        try {
            copy(dirPath1, to: dirPath2, overwrite: true)
        } catch (e: FSException) {
            countError++
        }
        try {
            Directory.create(dirPath1, recursive: true)
            Directory.create(dirPath2, recursive: true)
            copy(dirPath1, to: dirPath2, overwrite: false)
        } catch (e: FSException) {
            countError++
        } finally {
            deleteFile()
        }
        try {
            let subDirPath = dirPath1.join("tem1")
            Directory.create(subDirPath, recursive: true)
            copy(dirPath1, to: subDirPath, overwrite: true)
        } catch (e: FSException) {
            countError++
        } finally {
            deleteFile()
        }
        @Expect(countError,4)
    }

    func deleteFile() {
        if (exists(dirPath1)) {
            remove(dirPath1, recursive: true)
        }
        if (exists(dirPath2)) {
            remove(dirPath2, recursive: true)
        }
        if (exists(dirPath3)) {
            remove(dirPath3, recursive: true)
        }
    }

    func stressDirectoryCopy(dirPath1: Path, dirPath2: Path, depth: Int64): Int64 {
        var countError = 0
        try {
            var filePath = dirPath2.join("1.txt")
            var f1 = File(filePath, ReadWrite)
            f1.close()
            copy(Path("./TemCopy2"), to: Path("./TemCopy1"), overwrite: true)

            if (!exists(dirPath1)) {
                countError++
            }
            if (!exists(dirPath2)) {
                countError++
            }
            var dirPath3 = Path("./TemCopy1")
            for (_ in 0..depth) {
                dirPath3 = dirPath3.join("2")
            }
            var filePath1 = dirPath3.join("1.txt")
            if (!exists(dirPath3)) {
                countError++
            }
            if (!exists(filePath1)) {
                countError++
            }
        } catch (_: Exception) {
            countError++
        } finally {
            deletePath(Path("./TemCopy1"), true)
            deletePath(Path("./TemCopy2"), true)
            deletePath(Path("./TemCopy3"), true)
        }
        return countError
    }

    func deletePath(dirPath: Path, recur: Bool) {
        if (exists(dirPath)) {
            remove(dirPath, recursive: recur)
        }
    }
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./data
// (Linux) EXEC: rm -f fake_link real_link
// (Linux) EXEC: ln -s nofile fake_link
// (Linux) EXEC: %touch ifile && %lnfile ifile real_link
// (Linux) EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Linux) EXEC: %run %run_opt %output %run_utest_opt
// (Linux)ASSERT: scan \测试
// ASSERT: scan \\?\
// ASSERT: scan ./
// ASSERT: scan ./创建
// ASSERT: scan ./创建/aab
// ASSERT: scan \\\\?\\
// ASSERT: scan ./创建/测试仓颉.txt
// (Linux) EXEC: rm -f fake_link real_link
import std.fs.*
import std.io.SeekPosition
import std.math.*
import std.runtime.*
import std.collection.*

@When[os == "macOS"]
const ERRNO_ENAMETOOLONG = 63
@When[os == "macOS"]
const ERRNO_ENOTEMPTY = 66
@When[os == "macOS"]
const MAX_PATH_LENGTH = 1024
@When[os != "macOS"]
const ERRNO_ENAMETOOLONG = 36
@When[os != "macOS"]
const ERRNO_ENOTEMPTY = 39
@When[os != "macOS"]
const MAX_PATH_LENGTH = 4096

foreign func system(command: CString): Int32

/*
 * Test description: Test the funcs for Directory
 * Test class:
 * public class Directory <: Iterable<FileInfo>
 */
@Test
class DirectoryLinuxTest {
    let dirPath1 = Path("./Tem1")
    let dirPath2 = Path("./Tem2")
    let dirPath3 = Path("./Tem3")
    let tempFileName: String = "1.txt"
    let MAX_DIR_PATH_SIZE: Int64 = MAX_PATH_LENGTH - 1 - (tempFileName.size + 1)
    let dirLen = 1000

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
        let subDir3 = Directory.create(dosPath + "\\测试仓颉directory123", recursive: true)
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
            var dirname01 = "./data/directory/yur"
            if (!exists(dirname01)) {
                Directory.create(dirname01)
            }

            remove(dirname01, recursive: true)
            Directory.isEmpty(FileInfo(dirname01).path)
        } catch (e: FSException) {
            @Expect(e.message,"The input path `./data/directory/yur` does not exist.")
            countError++
        }
        try {
            var dirname02 = "mytestdir0001"
            if (exists(dirname02)) {
                remove(dirname02, recursive: true)
            }
            Directory.create(dirname02)
            remove(dirname02, recursive: true)
            Directory.isEmpty(dirname02)
        } catch (e: FSException) {
            @Expect(e.message, "The input path `mytestdir0001` does not exist.")
            countError++
        }
        @Expect(countError,2)
    }

    /*
     * Test description: Test fs::Directory
     * Test API:
     * public static func walk(path: String, f: (entry: FileInfo)->Bool): Unit
     */
    @TestCase
    func testInputValidIterator(): Unit {
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
    func testInputValidEntryList(): Unit {
        var fn = 0
        var dn = 0
        for (f in Directory.readFrom(FileInfo("./data/directory").path)) {
            println("f.path: ${f.path}")
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

        let set = HashSet<String>()
        let fileInfos = Directory.readFrom(".")
        for (fi in fileInfos where fi.isSymbolicLink()) {
            set.add(fi.path.fileName)
        }
        @Expect(set.contains("real_link"))
        @Expect(set.contains("fake_link"))
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
        for (f in Directory.readFrom("./data/directory").iterator().filter {info => info.isDirectory()}) {
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
     * public static func create(path: String, recursive!: Bool = false): Unit
     */
    @TestCase
    func testInputValidCreate(): Unit {
        let currentPath: String = canonicalize(Path(".")).toString()
        let dosPath = "\\\\?\\" + currentPath
        let pathList: Array<(String, Bool)> = [
            (dosPath + "\\测试仓颉directory", true),
            ("\\测试", false),
            ("./创建", false),
            ("./创建/aab", true)
        ]
        for ((item, recursive) in pathList) {
            var path = Path(item)
            Directory.create(path, recursive: recursive)
            var isExist = exists(path)
            if (isExist) {
                remove(path)
            } else {
                @Expect(false)
            }
        }
        let pathsL1 = ["a", ".a", "./a", "a/", "a.", "a./"]
        let pathsL2 = ["a/b", ".a/b", "./a/b", "a/b/", "a/b.", "a/b./"]
        for (path in pathsL1) {
            Directory.create(path)
            if (exists(path)) {
                remove(path)
            } else {
                @Expect(false)
            }
        }
        Directory.create("a")
        Directory.create(".a")
        for (path in pathsL2) {
            Directory.create(path)
            if (exists(path)) {
                remove(path)
            } else {
                @Expect(false)
            }
        }
        remove("a")
        remove(".a")
        let currentP: Path = canonicalize(Path("."))
        let path = currentP.join("aaa/bbb/ccc")
        if (exists(path)) {
            remove(path)
        }
        Directory.create(path, recursive: true)
        if (!exists(path)) {
            @Expect(false)
        }
        remove(path)
        remove(currentP.join("aaa/bbb"))
        remove(currentP.join("aaa"))

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
        var path = "./aaa/bbb"
        try {
            Directory.create(path)
        } catch (e: FSException) {
            @Expect(e.message,"Failed to create directory `${path}`, parent directory `./aaa` does not exist.")
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
            @Expect(e.message,"The input path `${path}` is already exists.")
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
        path = "./"
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
        path = "_abcdefghijklmnopqrstuvwxyz_abcdefghijklmnopqrstuvwxyz_abcdefghijklmnopqrstuvwxyz_abcdefghijklmnopqrstuvwxyz_abcdefghijklmnopqrstuvwxyz_abcdefghijklmnopqrstuvwxyz_abcdefghijklmnopqrstuvwxyz_abcdefghijklmnopqrstuvwxyz_abcdefghijklmnopqrstuvwxyz_abcdefghijklmnopqrstuvwxyz"
        try {
            Directory.create(path)
        } catch (e: FSException) {
            @Expect(e.message,"Failed to create directory `${path}` return -36: \"File name too long\".")
            countError++
        }
        path = "//"
        try {
            Directory.create(path)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"Invalid path `${path}`, failed to create directory.")
            countError++
        }
        @Expect(countError,8)
    }

    /*
     * Test description: Test fs::Directory
     * Test API:
     * public static func createTemp(directoryPath: String): Path
     */
    @TestCase
    func testInputValidCreateTemp(): Unit {
        let pathList = ["./", "./创建/aab"]
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
        let path = "./aaa/bbb"
        try {
            Directory.createTemp(path)
        } catch (e: FSException) {
            @Expect(e.message,"Failed to canonical: the input path `${path}` may not exist or permission denied!")
            countError++
        }

        try {
            Directory.createTemp("")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            Directory.createTemp("\0")
        } catch (e: IllegalArgumentException) {
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
        Directory.create(path)
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
     * public static func delete(path: Path, recursive!: Bool = false): Unit
     */
    @TestCase
    func testInputInValidDelete(): Unit {
        let currentPath: String = canonicalize(Path(".")).toString()
        let dosPath = "\\\\?\\" + currentPath
        let pathList: Array<(String, Bool, String)> = [
            (dosPath + "\\测试仓颉directory", true, "The directory does not exist."),
            ("./创建", false, "Failed to delete directory: \"Directory not empty\"."),
            ("./创建/aab", false, "Failed to delete directory: \"Directory not empty\".")
        ]
        var countError = 0

        if (!exists("./创建")) {
            Directory.create("./创建", recursive: false)
        }
        if (!exists("./创建/aab/test")) {
            Directory.create("./创建/aab/test", recursive: true)
        }
        for ((item, recursive, errorStr) in pathList) {
            try {
                remove(Path(item), recursive: recursive)
            } catch (e: Exception) {
                countError++
            }
        }
        var path = "./创建/aab/test\0"
        try {
            Directory.create(path, recursive: true)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"Invalid path `${path}`, failed to create directory.")
            countError++
        }
        path = "./data/directory/qwe"
        var subPath = path + "/test"
        try {
            if (!exists(subPath)) {
                Directory.create(subPath, recursive: true)
            }
            remove(path)
        } catch (e: FSException) {
            countError++
        } finally {
            if (exists(path)) {
                remove(path, recursive: true)
            }
        }
        try {
            Directory.create("", recursive: true)
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            remove(String(Array(4096, repeat: r'0')))
        } catch (e: IllegalArgumentException | FSException) {
            countError++
        }

        @Expect(countError,7)
    }

    /*
     * Test description: Test fs::Directory
     * Test API:
     * public static func move(sourceDirPath: Path, destinationDirPath: Path, overwrite: Bool): Unit
     */
    @TestCase
    func testInputValidMove(): Unit {
        let sourcePath = "./data/directory/qwe"
        let subSrcFile = sourcePath + "/1.txt"
        let subSrcPath = sourcePath + "/asd"

        let targetPath = "./data/directory/qwe2"
        let subDstFile = targetPath + "/1.txt"
        let subDstPath = targetPath + "/asd"
        if (!exists(sourcePath)) {
            Directory.create(sourcePath)
            File.create(subSrcFile).close()
            Directory.create(subSrcPath)
        }
        if (exists(targetPath)) {
            remove(targetPath, recursive: true)
        }

        rename(sourcePath, to: targetPath, overwrite: true)
        if (!exists(targetPath) || !exists(subDstFile) || !exists(subDstPath)) {
            @Expect(false)
        }
        remove(targetPath, recursive: true)
        if (exists(targetPath) || exists(subDstFile) || exists(subDstPath)) {
            @Expect(false)
        }
        Directory.create(sourcePath)
        if (!exists(sourcePath)) {
            @Expect(false)
        }
        let currentPath: String = canonicalize(Path(".")).toString()
        let dosPath = "\\\\?\\" + currentPath
        let pathList: Array<(String, Bool)> = [(dosPath + "\\测试仓颉directory", true), ("./创建", false),
            ("./创建/aab", true)]
        let tempDirPath: Path = Directory.createTemp(Path("./"))
        var i = 0
        for ((item, recursive) in pathList) {
            var path = Path(item)
            var overwrite = recursive
            if (exists(path)) {
                remove(path, recursive: true)
            }
            Directory.create(path, recursive: recursive)
            var destinationDir = tempDirPath.join("${i}dir_新")
            if (exists(destinationDir)) {
                remove(destinationDir, recursive: true)
            }
            rename(path, to: destinationDir, overwrite: overwrite)
            if (!exists(destinationDir)) {
                @Expect(false)
            }
            i++
        }
        var destinationDir = tempDirPath.join("0dir_新")
        let file = Directory.create("./创建/测试仓颉.txt")
        rename(Path("./创建"), to: destinationDir, overwrite: true)
        if (!exists(destinationDir) || !exists(destinationDir.join("测试仓颉.txt"))) {
            @Expect(false)
        }
        if (exists(tempDirPath)) {
            remove(tempDirPath, recursive: true)
        }
        if (exists(sourcePath)) {
            remove(sourcePath, recursive: true)
        }
        if (exists(targetPath)) {
            remove(targetPath, recursive: true)
        }

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
        let sourcePath = "testSrc"
        let subSrcFile = sourcePath + "/subSrcfile"
        let targetPath = "testTarget"

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
            rename("", to: targetPath, overwrite: true)
        } catch (e: FSException | IllegalArgumentException) {
            countError++
        }
        if (exists(sourcePath)) {
            remove(sourcePath)
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
        }

        // teardown
        remove(targetPath, recursive: true)
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
        if (!exists("./Tem2/tem1/1.txt")) {
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
        let path1 = Path("./Tem1/tem1")
        let path2 = Path("./Tem2")
        Directory.create(path1, recursive: true)
        Directory.create(path2, recursive: true)
        let srcFile = File(path1.join("1.txt"), ReadWrite)
        let srcFileInfo = srcFile.info
        srcFileInfo.setExecutable(!srcFileInfo.canExecute())
        srcFile.close()
        copy(dirPath1, to: dirPath2, overwrite: true)
        let destFile = File("./Tem2/tem1/1.txt", ReadWrite)
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
        var dirPath1 = Path("./Tem1")
        var dirPath2 = Path("./Tem2")
        var dirPath3 = Path("./Tem3")
        var depth = 0
        if (exists(dirPath1)) {
            remove(dirPath1, recursive: true)
        }
        if (exists(dirPath2)) {
            remove(dirPath2, recursive: true)
        }

        // current path length
        Directory.create(dirPath1)
        var len = canonicalize(dirPath1).toString().size + 1
        remove(dirPath1, recursive: true)
        while (len + 2 < 500) {
            len += 2
            depth++
            dirPath1 = dirPath1.join("1")
            dirPath2 = dirPath2.join("2")
            dirPath3 = dirPath3.join("3")
        }
        Directory.create(dirPath1, recursive: true)
        Directory.create(dirPath2, recursive: true)
        Directory.create(dirPath3, recursive: true)
        @Expect(stressDirectoryCopy(dirPath1, dirPath2, depth),0)
        if (exists(dirPath1)) {
        }
        if (exists(dirPath2)) {
        }
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
        try {
            Directory.create(dirpath)
            Directory.create(dirpath.join("temp.txt"))
        } catch (_: Exception) {
        }

        copy(dirpath, to: destPath, overwrite: false)
        if (!exists(destPath.join("temp.txt"))) {
            @Expect(false)
        }
        remove(destPath, recursive: true)
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
            copy(Path("./Tem2"), to: Path("./Tem1"), overwrite: true)

            if (!exists(dirPath1)) {
                println(dirPath1)
                countError++
            }
            if (!exists(dirPath2)) {
                countError++
            }
            var dirPath3 = Path("./Tem1")
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
        }
        return countError
    }
}

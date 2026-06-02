/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Windows) DEPENDENCE: ./utils
// (Windows)EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Windows)EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args
internal import std.fs.*

/*
 * Test description: Test the funcs for Path
 * Test class:
 * public struct Path <: Equatable<Path> & Hashable & ToString
 */
@Test
class PathWindowsTest {
    /*
     * Test description: Test fs::Path
     * Test API:
     * public prop parent: Path
     */
    @TestCase
    func InputValidParent(): Unit {
        var path = Path("C:")
        @Expect(path.parent, Path("C:"))
        path = Path("\\\\?\\D:\\")
        @Expect(path.parent, Path("\\\\?\\D:\\"))
        path = Path("\\\\?\\D:\\app\\linktoNewDir")
        @Expect(path.parent, Path("\\\\?\\D:\\app"))
        path = Path("\\\\?\\D:\\app")
        @Expect(path.parent, Path("\\\\?\\D:\\"))
        path = Path("\\\\127.0.0.1\\monthlyImage\\a\\b\\abc.txt")
        @Expect(path.parent, Path("\\\\127.0.0.1\\monthlyImage\\a\\b"))
        path = Path("\\\\127.0.0.1\\monthlyImage\\a\\b")
        @Expect(path.parent, Path("\\\\127.0.0.1\\monthlyImage\\a"))
        path = Path("\\\\127.0.0.1\\monthlyImage")
        @Expect(path.parent, Path("\\\\127.0.0.1\\monthlyImage"))
    }

    /*
     * Test description: Test fs::Path
     * Test API:
     * public prop parent: Path
     */
    @TestCase
    func InputInValidPathParent(): Unit {
        var countError = 0
        try {
            Path("").parent
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The path is empty.")
            countError++
        }
        try {
            Path("\0").parent
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The path value [0] contains null character.")
            countError++
        }
        @Expect(countError,2)
    }

    /*
     * Test description: Test fs:Path
     * Test API:
     * public prop fileName: Option<String>
     */
    @TestCase
    func InputValidPathFileName(): Unit {
        // "C:"
        var path = Path("C:")
        @Expect(path.fileName, "")
        path = Path("c:\\")
        @Expect(path.fileName, "")
        path = Path("c:\\\\x\\")
        @Expect(path.fileName, "x")
        path = Path(
            "D:\\XXXXXXXX\\Matters\\01_Required_actions\\ra-2023\\01_Academic\\XX.XX_XXX_仓颉X\\CJ\\仓颉仓\\4_仓颉仓颉.pdf")
        @Expect(path.fileName, "4_仓颉仓颉.pdf")
        // "\\\\?\\"
        path = Path("\\\\?")
        @Expect(path.fileName, "")
        path = Path("\\\\?\\")
        @Expect(path.fileName, "")
        path = Path("\\\\?\\C:")
        @Expect(path.fileName, "")
        path = Path("\\\\?\\C:\\xx\\")
        @Expect(path.fileName, "xx")
        path = Path("\\\\.\\\\xx\\")
        @Expect(path.fileName, "xx")
        path = Path("\\\\?\\UNC\\Server\\Share\\")
        @Expect(path.fileName, "")
        path = Path("\\\\?\\UNC\\Server\\Share\\xx")
        @Expect(path.fileName, "xx")
        path = Path("\\\\.\\UNC\\\\\\xx")
        @Expect(path.fileName, "xx")
        // "\\\\"
        path = Path("\\\\Server\\Share\\")
        @Expect(path.fileName, "")
        path = Path("\\\\127.0.0.1\\monthlyImage\\a\\b\\abc.txt")
        @Expect(path.fileName, "abc.txt")
        // slash
        path = Path("c:/x/y")
        @Expect(path.fileName, "y")
    }

    /*
     * Test description: Test fs::Path
     * Test API:
     * public prop fileName: Option<String>
     */
    @TestCase
    func InputInValidPathFileName(): Unit {
        var countError = 0
        try {
            Path("").fileName
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The path is empty.")
            countError++
        }
        try {
            Path("\0").fileName
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The path value [0] contains null character.")
            countError++
        }
        @Expect(countError,2)
    }

    /*
     * Test description: Test fs:Path
     * Test API:
     * public prop extensionName: String
     */
    @TestCase
    func InputValidExtensionName(): Unit {
        var path = Path("C:")
        @Expect(path.extensionName, "")
        path = Path("\\\\?\\D:\\app\\linktoNewDir")
        @Expect(path.extensionName, "")
        path = Path("\\\\?\\D:\\app")
        @Expect(path.extensionName, "")
        path = Path("\\\\127.0.0.1\\monthlyImage\\a\\b\\abc.txt")
        @Expect(path.extensionName, "txt")
        path = Path(".")
        @Expect(path.extensionName, "")
    }

    /*
     * Test description: Test fs:Path
     * Test API:
     * public prop extensionName: String
     */
    @TestCase
    func InputInValidExtensionName(): Unit {
        var countError = 0
        try {
            Path("").extensionName
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The path is empty.")
            countError++
        }
        try {
            Path("\0").extensionName
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The path value [0] contains null character.")
            countError++
        }
        @Expect(countError,2)
    }

    /*
     * Test description: Test fs:Path
     * Test API:
     * public prop fileNameWithoutExtension: String
     */
    @TestCase
    func InputValidFileNameWithoutExtension(): Unit {
        var path = Path("C:")
        @Expect(path.fileNameWithoutExtension, "")
        path = Path(
            "D:\\XXXXXXXX\\Matters\\01_Required_actions\\ra-2023\\01_Academic\\XX.XX_XXX_仓颉X\\CJ\\仓颉仓\\4_仓颉仓颉.pdf")
        @Expect(path.fileNameWithoutExtension, "4_仓颉仓颉")
        path = Path("C:NewFile.txt")
        @Expect(path.fileNameWithoutExtension, "NewFile")
        path = Path("\\\\?\\D:\\app")
        @Expect(path.fileNameWithoutExtension, "app")
        path = Path("\\a.b.c")
        @Expect(path.fileNameWithoutExtension, "a.b")
        path = Path("\\NewDir\\")
        @Expect(path.fileNameWithoutExtension, "NewDir")
    }

    /*
     * Test description: Test fs:Path
     * Test API:
     * public prop fileNameWithoutExtension: String
     */
    @TestCase
    func InputInValidFileNameWithoutExtension(): Unit {
        var countError = 0
        try {
            Path("").fileNameWithoutExtension
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The path is empty.")
            countError++
        }
        try {
            Path("\0").fileNameWithoutExtension
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The path value [0] contains null character.")
            countError++
        }
        @Expect(countError,2)
    }

    /*
     * Test description: Test fs:Path
     * Test API:
     * public func isAbsolute(): Bool
     */
    @TestCase
    func InputValidIsAbsolute(): Unit {
        let pathList: Array<(String, Bool)> = [
            ("C:\\", true),
            ("C:/", true),
            ("D:\\\\", true),
            ("f:\\", true),
            ("\\\\127.0.0.1\\abc\\efg", true),
            ("\\\\?\\D:\\abc\\efg", true)
        ]
        for (kv in pathList) {
            var path = Path(kv[0])
            @Expect(path.isAbsolute(), kv[1])
        }
    }

    /*
     * Test description: Test fs:Path
     * Test API:
     * public func isAbsolute(): Bool
     */
    @TestCase
    func InputInValidIsAbsolute(): Unit {
        var countError = 0
        try {
            Path("").isAbsolute()
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The path is empty.")
            countError++
        }
        try {
            Path("\0").isAbsolute()
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The path value [0] contains null character.")
            countError++
        }
        @Expect(countError,2)
    }

    /*
     * Test description: Test fs:Path
     * Test API:
     * public func isRelative(): Bool
     */
    @TestCase
    func InputValidIsRelative(): Unit {
        let pathList: Array<(String, Bool)> = [("C:/", false), ("C://", false), ("C:///", false)]
        for (kv in pathList) {
            var path = Path(kv[0])
            @Expect(path.isRelative(), kv[1])
        }
    }

    /*
     * Test description: Test fs:Path
     * Test API:
     * public func isRelative(): Bool
     */
    @TestCase
    func InputInValidIsRelative(): Unit {
        var countError = 0
        try {
            Path("").isRelative()
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The path is empty.")
            countError++
        }
        try {
            Path("\0").isRelative()
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The path value [0] contains null character.")
            countError++
        }
        @Expect(countError,2)
    }

    /*
     * Test description: Test fs:Path
     * Test API:
     * public func join(path: Path): Path
     */
    @TestCase
    func InputValidJoin(): Unit {
        var path = Path("a\\b")
        @Expect(path.join(Path("c")), Path("a\\b\\c"))
        @Expect(path.join("c"), Path("a\\b\\c"))
        path = Path("a")
        @Expect(path.join(Path("b\\c")), Path("a\\b\\c"))
        @Expect(path.join("b\\c"), Path("a\\b\\c"))
        path = Path("\\a")
        @Expect(path.join(Path("b\\c")), Path("\\a\\b\\c"))
        @Expect(path.join("b\\c"), Path("\\a\\b\\c"))
        @Expect(path.join(""), Path("\\a\\"))
    }

    /*
     * Test description: Test fs:Path
     * Test API:
     * public func join(path: Path): Path
     */
    @TestCase
    func InputInValidJoin(): Unit {
        var countError = 0
        try {
            Path("\\a").join(Path("C:\\"))
        } catch (e: FSException) {
            @Expect(e.message,"The input path `C:\\` cannot be an absolute path!")
            countError++
        }
        try {
            Path("").join(Path(""))
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The path is empty.")
            countError++
        }
        try {
            Path("\\a").join(Path("\0"))
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The input path value [0] contains null character.")
            countError++
        }
        @Expect(countError,3)
    }

    /*
     * Test description: Test fs:Path
     * Test API:
     * public func canonicalize(path: Path): Path
     * public func canonicalize(path: String): Path
     */
    @TestCase
    func InputValidCanonicalize(): Unit {
        let pathList: Array<(String, String)> = [("C:/", "C:\\"), ("c:/", "c:\\"), ("\\\\?\\c:\\", "\\\\?\\c:\\"),
            ("\\\\.\\c:\\", "\\\\.\\c:\\")]
        for ((k, v) in pathList) {
            @Expect(canonicalize(k), canonicalize(Path(v)))
            var path = Path(k)
            @Expect(canonicalize(path), canonicalize(Path(v)))
        }
    }

    /*
     * Test description: Test fs:Path
     * Test API:
     * public func canonicalize(path: Path): Path
     * public func canonicalize(path: String): Path
     */
    @TestCase
    func InputInValidCanonicalize(): Unit {
        var countError = 0
        try {
            canonicalize(Path(""))
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The input path is empty.")
            countError++
        }
        try {
            canonicalize("")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The input path is empty.")
            countError++
        }
        var path = "C:\\yysssw20230926"
        try {
            canonicalize(Path(path))
        } catch (e: FSException) {
            @Expect(e.message,"Failed to canonical: the input path `${path}` may not exist or permission denied!")
            countError++
        }
        path = "C:\\yysssw20230926"
        try {
            canonicalize(path)
        } catch (e: FSException) {
            @Expect(e.message,"Failed to canonical: the input path `${path}` may not exist or permission denied!")
            countError++
        }
        @Expect(countError, 4)
    }

    /*
     * Test description: Test fs:Path
     * Test API:
     * public operator func ==(that: Path): Bool
     */
    @TestCase
    func InputValidEqual(): Unit {
        var p1 = Path("C:\\a")
        var p2 = Path("C:\\a")
        if (p1 != p2) {
            @Expect(true,false)
        } else {
            @Expect(true,true)
        }
        var p3 = Path("C:\\p.")
        var p4 = Path("C:\\p.*12()*?$#@!~-_+=|<>,")
        if (p3 == p4) {
            @Expect(true,false)
        } else {
            @Expect(true,true)
        }
        var p5 = Path("C:\\新文件夹p")
        var p6 = Path("C:\\新文件夹p")
        if (p5 != p6) {
            @Expect(true,false)
        } else {
            @Expect(true,true)
        }
    }

    /*
     * Test description: Test fs:Path
     * Test API:
     * public func hashCode(): Int64
     * windows 下 "/home/" 路径不存在，所以会直接用该字符串的 hash code, 但是 linux 下是存在的会使用归一化后的绝对路径字符串的 hash code;
     * 后四个用例因为文件都不存在在所以都是使用当前字符串的 hash code 值，所以两边一致
     * windows 经过适配，'/' 路径存在，会返回当前执行文件的根盘符路径，故去除 hashcode,因为测试用例盘符路径未知，暂不写 '/'的 hashcode
     */
    @TestCase
    func InputValidHashCode(): Unit {
        let pathList: Array<(String, Int64)> = [
            ("/home/", #"\home"#.hashCode()),
            ("./noextension", "noextension".hashCode())
        ]
        for (kv in pathList) {
            var path = Path(kv[0])
            @Expect(path.hashCode(), kv[1])
        }
    }

    /*
     * Test description: Test fs:Path
     * Test API:
     * public func toString(): String
     */
    @TestCase
    func InputValidToString(): Unit {
        let pathList: Array<(String, String)> = [("C:/", "C:/"), ("C://", "C://"), ("..", ".."),
            ("./utils/link", "./utils/link"), ("()", "()")]
        for (kv in pathList) {
            var path = Path(kv[0])
            @Expect(path.toString(), kv[1])
        }
    }

    @TestCase
    func testSeparator(): Unit {
        @Expect(Path.Separator == "\\")
        @Expect(Path.ListSeparator == ";")
    }

    @TestCase
    func testIsEmpty(): Unit {
        var path = Path("")
        @Expect(path.isEmpty())
        path = Path(".")
        @Expect(!path.isEmpty())
    }

    @TestCase
    func testNormalize(): Unit {
        // skip redundant slasshes
        var path = Path("c:\\\\a\\b\\\\c\\")
        @Expect(path.normalize().toString(), "c:\\a\\b\\c")
        path = Path("\\\\x\\y\\z\\\\")
        @Expect(path.normalize().toString(), "\\\\x\\y\\z")
        path = Path("\\\\.\\c:\\y")
        @Expect(path.normalize().toString(), "\\\\.\\c:\\y")
        path = Path("\\\\.\\UNC\\")
        @Expect(path.normalize().toString(), "\\\\.\\UNC\\")
        // process . ..
        path = Path(".\\..\\..\\a\\")
        @Expect(path.normalize().toString(), "..\\..\\a")
        path = Path("\\..\\.\\..\\a")
        @Expect(path.normalize().toString(), "\\a")
        path = Path("\\\\.\\c:\\")
        @Expect(path.normalize().toString(), "\\\\.\\c:\\")
        path = Path("\\\\\\\\..\\.\\")
        @Expect(path.normalize().toString(), "\\\\\\\\")
        // empty path
        path = Path("")
        @Expect(path.normalize().toString(), ".")
        path = Path("a\\..\\b\\.\\..\\")
        @Expect(path.normalize().toString(), ".")
        // transfer slashes
        path = Path("//server/share\\x/y")
        @Expect(path.normalize().toString(), "\\\\server\\share\\x\\y")
        // mixed
        path = Path("\\\\.\\c:\\.\\..\\a\\\\..\\b\\\\\\..\\")
        @Expect(path.normalize().toString(), "\\\\.\\c:\\")
    }

    // CVE-2023-45283
    @TestCase
    func testSpecialPrefix(): Unit {
        var countError = 0

        var path = Path(#"\a\..\??\b"#)
        try {
            println(path.normalize())
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Path `\\??\\b` cannot contain `\\??\\`!")
            countError++
        }

        try {
            println(Path(#"\"#).join(Path(#"??"#)).join("b"))
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Path `\\??\\b` cannot contain `\\??\\`!")
            countError++
        }

        @Expect(countError, 2)
    }

    // CVE-2022-41722
    @TestCase
    func testPathContainsVolumeName() {
        let path = Path("a/../c:/b").normalize()
        @Expect(path.toString(), #".\c:\b"#)
    }
}

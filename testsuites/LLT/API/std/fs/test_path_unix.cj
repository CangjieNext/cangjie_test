/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./utils
// (Unix)EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Unix) EXEC: %touch create_an_empty_file_here
// (Unix) EXEC: %lnfile create_an_empty_file_here a_link
// (Unix) EXEC: %run %run_opt %output %run_utest_opt
import std.fs.*

/*
 * Test description: Test the funcs for Path
 * Test class:
 * public struct Path <: Equatable<Path> & Hashable & ToString
 */
@Test
class PathLinuxTest {
    /*
     * Test description: Test fs::Path
     * Test API:
     * public init(s: String)
     */
    @TestCase
    func testPathInit(): Unit {
        Path("")
        Path("p2")
        Path("11/p3")
        Path("p4.*12()*?$#@!~-_+=|<>,")
        Path("新文件夹p5")
        Path("/")
        Path("\\\\?\\d:\\")
        Path("\\\\127.0.0.1\\monthlyImage\\config.cfg")
        Path("\\\\UNC\\127.0.0.1\\monthlyImage\\config.cfg")
        Path("\\\\.\\d:\\")
        @Expect(true)
    }

    /*
     * Test description: Test fs::Path
     * Test API:
     * public prop parent: Path
     */
    @TestCase
    func InputValidPathParent(): Unit {
        var path = Path("/a/b/c")
        @Expect(path.parent, Path("/a/b"))
        path = Path("/a/b/")
        @Expect(path.parent, Path("/a"))
        path = Path("/a/b")
        @Expect(path.parent, Path("/a"))
        path = Path("/a")
        @Expect(path.parent, Path("/"))
        path = Path("/")
        @Expect(path.parent, Path("/"))
        path = Path("./a/b")
        @Expect(path.parent, Path("./a"))
        path = Path("./")
        @Expect(path.parent, Path(""))
        path = Path(".")
        @Expect(path.parent, Path(""))
        path = Path(".gitignore")
        @Expect(path.parent, Path(""))
        path = Path("a.txt")
        @Expect(path.parent, Path(""))
        path = Path("///a//")
        @Expect(path.parent, Path("/"))
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
            @Expect(e.message,"The rawPath is an empty string.")
            countError++
        }
        try {
            Path("\0").parent
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The rawPath value [0] contains null character.")
            countError++
        }
        @Expect(countError,2)
    }

    /*
     * Test description: Test fs::Path
     * Test API:
     * public prop fileName: Option<String>
     */
    @TestCase
    func InputValidPathFileName(): Unit {
        var path = Path("./NewFile.txt")
        @Expect(path.fileName, "NewFile.txt")
        path = Path("./.gitignore")
        @Expect(path.fileName, ".gitignore")
        path = Path("./noextension")
        @Expect(path.fileName, "noextension")
        path = Path("./a.b.c")
        @Expect(path.fileName, "a.b.c")
        path = Path(
            "D:/XXXXXXXX/Matters/01_Required_actions/ra-2023/01_Academic/XX.XX_XXX_仓颉X/CJ/仓颉仓/4_仓颉仓颉.pdf")
        @Expect(path.fileName, "4_仓颉仓颉.pdf")
        path = Path("./NewDir/")
        @Expect(path.fileName, "NewDir")
        path = Path("./")
        @Expect(path.fileName, ".")
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
            @Expect(e.message,"The rawPath is an empty string.")
            countError++
        }
        try {
            Path("\0").fileName
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The rawPath value [0] contains null character.")
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
        var path = Path("./NewFile.txt")
        @Expect(path.extensionName, "txt")
        path = Path("./.gitignore")
        @Expect(path.extensionName, "gitignore")
        path = Path("./noextension")
        @Expect(path.extensionName, "")
        path = Path("./a.b.c")
        @Expect(path.extensionName, "c")
        path = Path("./NewDir/")
        @Expect(path.extensionName, "")
        path = Path("./NewDir/NewFile.")
        @Expect(path.extensionName, "")
        path = Path(".")
        @Expect(path.extensionName, "")
        path = Path("**")
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
            @Expect(e.message,"The rawPath is an empty string.")
            countError++
        }
        try {
            Path("\0").extensionName
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The rawPath value [0] contains null character.")
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
        var path = Path("./NewFile.txt")
        @Expect(path.fileNameWithoutExtension, "NewFile")
        path = Path(
            "D:/XXXXXXXX/Matters/01_Required_actions/ra-2023/01_Academic/XX.XX_XXX_仓颉X/CJ/仓颉仓/4_仓颉仓颉.pdf")
        @Expect(path.fileNameWithoutExtension, "4_仓颉仓颉")
        path = Path("./.gitignore")
        @Expect(path.fileNameWithoutExtension, "")
        path = Path("./noextension")
        @Expect(path.fileNameWithoutExtension, "noextension")
        path = Path("./a.b.c")
        @Expect(path.fileNameWithoutExtension, "a.b")
        path = Path("./NewDir/")
        @Expect(path.fileNameWithoutExtension, "NewDir")
    }

    /*
     * Test description: Test fs:Path
     * Test API:
     * public prop fileNameWithoutExtension: Option<String>
     */
    @TestCase
    func InputInValidFileNameWithoutExtension(): Unit {
        var countError = 0
        try {
            Path("").fileNameWithoutExtension
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The rawPath is an empty string.")
            countError++
        }
        try {
            Path("\0").fileNameWithoutExtension
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The rawPath value [0] contains null character.")
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
        let pathList: Array<(String, Bool)> = [("./NewFile.txt", false), ("./a.b.c.txt", false), ("/", true),
            ("//", true), ("///", true)]
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
            @Expect(e.message,"The rawPath is an empty string.")
            countError++
        }
        try {
            Path("\0").isAbsolute()
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The rawPath value [0] contains null character.")
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
        let pathList: Array<(String, Bool)> = [("./NewFile.txt", true), ("./a.b.c.txt", true), ("/", false),
            ("//", false), ("///", false)]
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
            @Expect(e.message,"The rawPath is an empty string.")
            countError++
        }
        try {
            Path("\0").isRelative()
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The rawPath value [0] contains null character.")
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
        var path = Path("./NewFile.txt")
        @Expect(path.join(Path("append.file")), Path("./NewFile.txt/append.file"))
        @Expect(path.join("append.file"), Path("./NewFile.txt/append.file"))
        path = Path("./.gitignore")
        @Expect(path.join(Path("append/file")), Path("./.gitignore/append/file"))
        @Expect(path.join("append/file"), Path("./.gitignore/append/file"))
        path = Path("noextension")
        @Expect(path.join(Path("append.file")), Path("noextension/append.file"))
        @Expect(path.join("append.file"), Path("noextension/append.file"))
        path = Path("./a.b.c")
        @Expect(path.join(Path("append.file")), Path("./a.b.c/append.file"))
        @Expect(path.join("append.file"), Path("./a.b.c/append.file"))
        path = Path("a/b")
        @Expect(path.join(Path("c")), Path("a/b/c"))
        @Expect(path.join("c"), Path("a/b/c"))
        path = Path("a")
        @Expect(path.join(Path("b/c")), Path("a/b/c"))
        @Expect(path.join("b/c"), Path("a/b/c"))
        path = Path("/a")
        @Expect(path.join(Path("b/c")), Path("/a/b/c"))
        @Expect(path.join("b/c"), Path("/a/b/c"))
        @Expect(path.join(""), Path("/a/"))
        path = Path("中w/tx")
        @Expect(path.join("测试"), Path("中w/tx/测试"))
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
            Path("/a").join(Path("/b"))
        } catch (e: FSException) {
            @Expect(e.message,"The path `/b` cannot be an absolute path!")
            countError++
        }
        try {
            Path("").join(Path(""))
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The rawPath is an empty string.")
            countError++
        }
        try {
            Path("/a").join(Path("\0"))
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"The path value [0] contains null character.")
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
        let pathList: Array<(String, String)> = [("/", "/"), ("a_link", "create_an_empty_file_here")]
        for ((k, v) in pathList) {
            @Expect(canonicalize(k), canonicalize(Path(v)))
            @Expect(canonicalize(Path(k)), canonicalize(v))
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
            countError++
        }
        try {
            canonicalize("")
        } catch (e: IllegalArgumentException) {
            countError++
        }
        try {
            canonicalize(Path("./yysssw20230926"))
        } catch (e: FSException) {
            countError++
        }
        try {
            canonicalize("./yysssw20230926")
        } catch (e: FSException) {
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
        var p1 = Path("/a")
        var p2 = Path("/a")
        if (p1 != p2) {
            @Expect(true,false)
        } else {
            @Expect(true,true)
        }
        var p3 = Path("/p.")
        var p4 = Path("/p.*12()*?$#@!~-_+=|<>,")
        if (p3 == p4) {
            @Expect(true,false)
        } else {
            @Expect(true,true)
        }
        var p5 = Path("/新文件夹p")
        var p6 = Path("/新文件夹p")
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
     */
    @TestCase
    func InputValidHashCode(): Unit {
        let pathList: Array<(String, Int64)> = [
            ("/", "/".hashCode()),
            ("/utils/abc", "/utils/abc".hashCode()),
            ("a/b", "a/b".hashCode()),
            ("a/", "a".hashCode()),
            ("/home", "/home".hashCode())
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
        let pathList: Array<(String, String)> = [
            ("./utils/NewFile.txt", "./utils/NewFile.txt"),
            ("./utils/.gitignore", "./utils/.gitignore"),
            ("./utils/noextension", "./utils/noextension"),
            ("./utils/a.b.c", "./utils/a.b.c"),
            ("./utils/NewDir/", "./utils/NewDir/"),
            ("/", "/"),
            ("//", "//"),
            ("///", "///"),
            ("../", "../"),
            ("..", ".."),
            ("./utils/link", "./utils/link"),
            ("()", "()")
        ]
        for (kv in pathList) {
            var path = Path(kv[0])
            @Expect(path.toString(), kv[1])
        }
    }

    @TestCase
    func testSeparator(): Unit {
        @Expect(Path.Separator == "/")
        @Expect(Path.ListSeparator == ":")
    }

    @TestCase
    func testIsEmpty(): Unit {
        var path = Path("")
        @Expect(path.isEmpty())
        path = Path(".")
        @Expect(!path.isEmpty())
    }

    @TestCase
    func testnormalize(): Unit {
        // skip redundant slashes
        var path = Path("//root///code//")
        @Expect(path.normalize().toString(), "/root/code")
        path = Path("code//a")
        @Expect(path.normalize().toString(), "code/a")
        // process . ..
        path = Path("/root/code/a/../b/./c/")
        @Expect(path.normalize().toString(), "/root/code/b/c")
        path = Path("/root/../.././../")
        @Expect(path.normalize().toString(), "/")
        path = Path("../.././../a")
        @Expect(path.normalize().toString(), "../../../a")
        // non acsii runes
        path = Path("../仓颉//目录///./你、//的//../\\///世界")
        @Expect(path.normalize().toString(), "../仓颉/目录/你、/\\/世界")
        // empty path
        path = Path("")
        @Expect(path.normalize().toString(), ".")
        path = Path("a/../b/./../")
        @Expect(path.normalize().toString(), ".")
        // mixed
        path = Path("../a世界//./仓//..///仓颉b////cc/..")
        @Expect(path.normalize().toString(), "../a世界/仓颉b")
    }
}

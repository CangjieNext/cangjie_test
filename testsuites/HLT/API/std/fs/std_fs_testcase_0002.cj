/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.unittest.* //testfame
import std.unittest.testmacro.* //macro_Defintion
import std.fs.*

@Test
class TestPath {
    private var path = Path("/home")

    public override func afterEach(): Unit {
        path = Path("/home")
    }

    @TestCase
    func test_init(): Unit {
        // init不做入参合法性检查，在后续的API中联合验证，不单独测试
    }

    @TestCase
    func test_init_neg(): Unit {
        let illegalArguments = [
            ("空字符串非法", "", IllegalArgumentException()),
            ("包含'\0'字符非法", "\0", IllegalArgumentException())
            // ("字符长度超过4096非法", String.fromUtf8(Array<UInt8>(4096, repeat: 99)), IllegalArgumentException()) // 不在这里进行限制
        ]

        let allPathAPIs: Array<(String, (Path) -> Any)> = [
            ("parent", {path: Path => path.parent}),
            ("fileName", {path: Path => path.fileName}),
            ("extensionName", {path: Path => path.extensionName}),
            ("fileNameWithoutExtension", {path: Path => path.fileNameWithoutExtension}),
            ("isAbsolute", {path: Path => path.isAbsolute()}),
            ("isRelative", {path: Path => path.isRelative()}),
            ("join", {path: Path => path.join("/")}),
            ("join", {path: Path => path.join(Path("/"))})
        ]

        for ((brief, path, ex) in illegalArguments) {
            var p = Path(path)
            for ((apiName, callAPI) in allPathAPIs) {
                try {
                    callAPI(p)
                    @Expect("It can't be reached", "when API is ${apiName}, test ${brief}")
                } catch (e: IllegalArgumentException) {
                }
            }
        }

        path = Path("/unExists")
        let apis: Array<(String, (Path) -> Any)> = [("canonicalize", {path: Path => canonicalize(path)})]
        for ((apiName, api) in apis) {
            try {
                api(path)
                @Expect("It can't be reached", "when API is ${apiName}, path is not exists")
            } catch (e: FSException) {
            }
        }
    }

    @TestCase
    func test_extension(): Unit {
        var cases: Array<(String, Path, String, String)> = [
            ("最后一个.位于字符串中间,有文件名, ./NewFile.txt", Path("./NewFile.txt"), "txt", "NewFile"),
            ("最后一个.位于字符串中间,无文件名， .///.gitignore", Path(".///.gitignore"), "gitignore", ""),
            ("最后一个.位于字符串开头，无文件名和后缀名，./noextension", Path("./noextension"), "", "noextension"),
            ("存在多个., ./a.b.c", Path("./a.b.c"), "c", "a.b"),
            ("最后一个.位于字符串开头，且只有., .", Path("."), "", ""),
            ("存在多个., ..", Path(".."), "", "."),
            ("存在多个., ...", Path("..."), "", "..")
        ]

        for ((brief, path, extensionName, fileNameWithoutExtension) in cases) {
            expectEqual("check extensionName", brief, path.extensionName, extensionName)
            expectEqual("check fileNameWithoutExtension", brief, path.fileNameWithoutExtension, fileNameWithoutExtension)
        }
    }
}

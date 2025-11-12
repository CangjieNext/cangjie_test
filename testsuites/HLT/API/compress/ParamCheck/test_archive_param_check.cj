/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: test_example.tar.gz, test_example.tar, test_example, test_example.zip, no_permission, no_permission.tar.gz
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import std.fs.*
import std.io.*
import stdx.compress.*
import stdx.compress.tar.*

let illegalFiles = [
    ("空字符串非法", "", IllegalArgumentException("The file path cannot be empty.")),
    ("包含'\0'字符非法", "\0", IllegalArgumentException("The file path cannot contain null character.")),
    ("目录路径", "./test_example", FSException("Failed to open the file. Is a directory")),
    ("文件无权限", "no_permission.tar.gz", FSException("Failed to open the file. Permission denied")),
    ("文件长度超过最大值", StringBuilder(r'a', 8192).toString(), FSException("Failed to open the file. File name too long"))

]

let legalFiles = [
    ("合法相对路径", "./test_example.tar.gz", ()),
    ("合法绝对路径", canonicalize("./test_example.tar.gz").toString(), ())
]

let illegalDirs = [
    ("空字符串非法", "", IllegalArgumentException("The path cannot be empty!")),
    ("包含'\0'字符非法", "\0", IllegalArgumentException("The path cannot contain null character!")),
    ("文件路径", "test_example.tar.gz", TarException("From directory is not a directory: test_example.tar.gz.")),
    ("目录无权限", "no_permission", FSException("Failed to get number of subFiles in directory.")), 
    ("目录长度超过最大值", StringBuilder(r'a', 8192).toString(), TarException("From directory not exists: ${StringBuilder(r'a', 8192).toString()}."))
]

let legalDirs = [
    ("合法相对路径", "./test_example", ()),
    ("合法绝对路径", canonicalize("./test_example").toString(), ())
]

@Test
class test_TarGzip_archive_param {
    @BeforeAll
    public func setup() {
        let f1 = FileInfo("no_permission")
        let f2 = FileInfo("no_permission.tar.gz")
        f1.setReadable(false)
        f1.setWritable(false)
        f2.setReadable(false)
        f2.setWritable(false)
    }

    // 测试 String, String, Bool 参数的压缩函数的参数检查
    @TestCase
    func test_archive_neg_param_str_str_bool(): Unit {
        var apis: Array<(String ,(String, String, Bool) -> Any)> = [
            ("TarGzip.archive" ,{fromDir: String, destFile: String, includes: Bool => TarGzip.archive(fromDir: fromDir, destFile: destFile, includeBaseDirectory: includes)}),
            ("Tar.archive" ,{fromDir: String, destFile: String, includes: Bool => Tar.archive(fromDir: fromDir, destFile: destFile, includeBaseDirectory: includes)})
        ]

        for ((brief, path, ex) in illegalFiles) {
            for ((apiName, callAPI) in apis) {
                try {
                    callAPI("./test_example", path, true)
                    callAPI("./test_example", path, false)
                    @Expect("should raise exception", "when API is ${apiName}, test ${brief}")
                } catch (e: IllegalArgumentException | FSException) {
                    @Expect(e.toString(), ex.toString())
                }
            }
        }

        for ((brief, path, ex) in illegalDirs) {
            for ((apiName, callAPI) in apis) {
                try {
                    let tar_str = if (apiName.contains("TarGzip")) { "test_example.tar.gz" } else { "test_example.tar" }
                    callAPI(path, tar_str, true)
                    callAPI(path, tar_str, false)
                    @Expect("should raise exception", "when API is ${apiName}, test ${brief}")
                } catch (e: IllegalArgumentException | FSException | TarException) {
                    @Expect(e.toString(), ex.toString())
                }
            }
        }
    }

    // 测试 String, T, Bool 参数的压缩函数的参数检查
    @TestCase
    func test_archive_neg_param_str_t_bool(): Unit {
        let byteBuffer = ByteBuffer()
        var apis: Array<(String ,(String, ByteBuffer, Bool) -> Any)> = [
            ("TarGzip.archive" ,{fromDir: String, destStream: ByteBuffer, includes: Bool => TarGzip.archive(fromDir: fromDir, destStream: destStream, includeBaseDirectory: includes)}),
            ("Tar.archive" ,{fromDir: String, destStream: ByteBuffer, includes: Bool => Tar.archive(fromDir: fromDir, destStream: destStream, includeBaseDirectory: includes)})
        ]

        for ((brief, path, ex) in illegalDirs) {
            for ((apiName, callAPI) in apis) {
                try {
                    callAPI(path, byteBuffer, true)
                    callAPI(path, byteBuffer, false)
                    @Expect("should raise exception", "when API is ${apiName}, test ${brief}")
                } catch (e: IllegalArgumentException | FSException | TarException) {
                    @Expect(e.toString(), ex.toString())
                }
            }
        }
    }

    // 测试 String, (String) -> Bool, String, Bool 参数的压缩函数的参数检查
    @TestCase
    func test_archive_neg_param_str_filter_str_bool(): Unit {
        let filter = { str: String => str.contains("example")}
        var apis: Array<(String ,(String, (String) -> Bool, String, Bool) -> Any)> = [
            ("TarGzip.archive" ,{fromDir: String, filter: (String) -> Bool, destFile: String, includes: Bool => TarGzip.archive(fromDir: fromDir, filter: filter, destFile: destFile, includeBaseDirectory: includes)}),
            ("Tar.archive" ,{fromDir: String, filter: (String) -> Bool, destFile: String, includes: Bool => Tar.archive(fromDir: fromDir, filter: filter, destFile: destFile, includeBaseDirectory: includes)})
        ]

        for ((brief, path, ex) in illegalFiles) {
            for ((apiName, callAPI) in apis) {
                try {
                    callAPI("./test_example", filter, path, true)
                    @Expect("should raise exception", "when API is ${apiName}, test ${brief}")
                } catch (e: IllegalArgumentException | FSException) {
                    @Expect(e.toString(), ex.toString())
                }
            }
        }

        for ((brief, path, ex) in illegalDirs) {
            for ((apiName, callAPI) in apis) {
                try {
                    let tar_str = if (apiName.contains("TarGzip")) { "test_example.tar.gz" } else { "test_example.tar" }
                    callAPI(path, filter, tar_str, true)
                    @Expect("should raise exception", "when API is ${apiName}, test ${brief}")
                } catch (e: IllegalArgumentException | FSException | TarException) {
                    @Expect(e.toString(), ex.toString())
                }
            }
        }
    }

    @TestCase
    func test_positive_params(): Unit {
        var apis: Array<(String ,(String, String, Bool) -> Any)> = [
            ("TarGzip.archive" ,{fromDir: String, destFile: String, includes: Bool => TarGzip.archive(fromDir: fromDir, destFile: destFile, includeBaseDirectory: includes)}),
            ("Tar.archive" ,{fromDir: String, destFile: String, includes: Bool => Tar.archive(fromDir: fromDir, destFile: destFile, includeBaseDirectory: includes)})
        ]

        for ((brief, path, ex) in legalFiles) {
            for ((apiName, callAPI) in apis) {
                try {
                    callAPI("./test_example", path, true)
                    callAPI("./test_example", path, false)
                } catch (e: IllegalArgumentException | FSException) {
                    @Expect("should not raise exception", "when API is ${apiName}, test ${brief}")
                }
            }
        }

        for ((brief, path, ex) in legalDirs) {
            for ((apiName, callAPI) in apis) {
                try {
                    let tar_str = if (apiName.contains("TarGzip")) { "test_example.tar.gz" } else { "test_example.tar" }
                    callAPI(path, tar_str, true)
                    callAPI(path, tar_str, false)
                } catch (e: IllegalArgumentException | FSException) {
                    @Expect("should not raise exception", "when API is ${apiName}, test ${brief}")
                }
            }
        }
    }
}
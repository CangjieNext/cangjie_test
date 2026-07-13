/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Unix) EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Unix) EXEC: %run %run_opt %output %run_utest_opt

import std.fs.*

/*
 * Incremental coverage for std.fs path.cj and directory.cj on Unix.
 * Complements test_path_unix.cj and test_fs_coverage_unix.cj.
 */
@Test
class FsPathDirectoryCoverageTest {
    let baseDir: String = "./cov_tmp_fs_path_dir"

    @BeforeAll
    func setupAll(): Unit {
        removeIfExists(baseDir, recursive: true)
        Directory.create(baseDir)
    }

    @AfterAll
    func tearDownAll(): Unit {
        removeIfExists(baseDir, recursive: true)
    }

    func p(name: String): String {
        "${baseDir}/${name}"
    }

    func cleanup(name: String): Unit {
        removeIfExists(p(name), recursive: true)
    }

    @TestCase
    func testPathNormalizeDotDotChains(): Unit {
        @Expect(Path("a/../../b").normalize().toString(), "../b")
        @Expect(Path("foo/../bar/../baz").normalize().toString(), "baz")
        @Expect(Path("a/b/../../..").normalize().toString(), "..")
        @Expect(Path("/a/b/../../..").normalize().toString(), "/")
        @Expect(Path("a/b/./c").normalize().toString(), "a/b/c")
        @Expect(Path("..").normalize().toString(), "..")
        @Expect(Path(".").normalize().toString(), ".")
        @Expect(Path("a/..").normalize().toString(), ".")
    }

    @TestCase
    func testPathJoinAndExtensionEdges(): Unit {
        let trailing = Path("parent/")
        @Expect(trailing.join("").toString(), "parent/")
        @Expect(trailing.join("child").toString(), "parent/child")
        @Expect(Path("x/./y") == Path("x/y"), true)
        @Expect(Path("x/y").hashCode() == Path("x/./y").hashCode(), true)

        @Expect(Path("a/b/c.txt").extensionName, "txt")
        @Expect(Path("a/b/c.d.e").extensionName, "e")
        @Expect(Path("a/b/noext").extensionName, "")
        @Expect(Path(".hidden").extensionName, "hidden")
        @Expect(Path("name.").extensionName, "")
        @Expect(Path("name.").fileNameWithoutExtension, "name")
        @Expect(Path(".hidden").fileNameWithoutExtension, "")

        @ExpectThrows[IllegalArgumentException](Path("parent").join("\0"))
        @ExpectThrows[IllegalArgumentException](canonicalize("\0"))
    }

    @TestCase
    func testPathCanonicalizeRelative(): Unit {
        let rel = p("canon_rel.txt")
        cleanup("canon_rel.txt")
        File.writeTo(rel, "c".toArray())
        let canon = canonicalize(Path(rel))
        @Expect(canon.toString().size > 0, true)
        @Expect(exists(canon), true)
        cleanup("canon_rel.txt")
    }

    @TestCase
    func testDirectoryCreateRecursiveAndReadFrom(): Unit {
        let deep = p("deep/a/b/c")
        cleanup("deep")
        Directory.create(deep, recursive: true)
        @Expect(exists(deep), true)

        let multi = p("read_from_dir")
        cleanup("read_from_dir")
        Directory.create(multi)
        File.writeTo("${multi}/one.txt", "1".toArray())
        File.writeTo("${multi}/two.txt", "2".toArray())
        let infos = Directory.readFrom(multi)
        @Expect(infos.size, 2)
        let infosPath = Directory.readFrom(Path(multi))
        @Expect(infosPath.size, 2)

        cleanup("deep")
        cleanup("read_from_dir")
    }

    @TestCase
    func testDirectoryIsEmptyAndWalkStop(): Unit {
        let empty = p("walk_empty")
        cleanup("walk_empty")
        Directory.create(empty)
        @Expect(Directory.isEmpty(Path(empty)), true)

        let withFiles = p("walk_stop")
        cleanup("walk_stop")
        Directory.create(withFiles)
        File.writeTo("${withFiles}/a.txt", "a".toArray())
        File.writeTo("${withFiles}/b.txt", "b".toArray())

        let count = Box<Int64>(0)
        Directory.walk(withFiles) {
            _ =>
                count.value++
                false
        }
        @Expect(count.value, 1)

        let filePath = p("walk_stop/a.txt")
        @ExpectThrows[FSException](Directory.walk(filePath) { _ => true })
        @ExpectThrows[FSException](Directory.readFrom(filePath))

        cleanup("walk_empty")
        cleanup("walk_stop")
    }

    @TestCase
    func testDirectoryCopyErrorPaths(): Unit {
        let src = p("copy_src_dir")
        let dst = p("copy_dst_dir")
        cleanup("copy_src_dir")
        cleanup("copy_dst_dir")
        cleanup("copy_sub_in_src")

        @ExpectThrows[FSException](copy(p("copy_missing_src"), to: p("copy_missing_dst")))

        Directory.create(src)
        File.writeTo("${src}/f.txt", "f".toArray())
        @ExpectThrows[FSException](copy(src, to: "${src}/copy_sub_in_src"))

        Directory.create(dst)
        @ExpectThrows[FSException](copy(src, to: dst, overwrite: false))
        copy(src, to: dst, overwrite: true)

        cleanup("copy_src_dir")
        cleanup("copy_dst_dir")
        cleanup("copy_sub_in_src")
    }

    @TestCase
    func testDirectoryCreateParentMissing(): Unit {
        @ExpectThrows[FSException](Directory.create(p("no_parent/child"), recursive: false))
        cleanup("no_parent")
    }

    @TestCase
    func testDirectoryCopyWithNestedSymlink(): Unit {
        let target = p("nested_link_target.txt")
        let srcDir = p("nested_src")
        let dstDir = p("nested_dst")
        cleanup("nested_link_target.txt")
        cleanup("nested_src")
        cleanup("nested_dst")

        File.writeTo(target, "t".toArray())
        Directory.create(srcDir)
        Directory.create("${srcDir}/sub")
        SymbolicLink.create("${srcDir}/sub/link", to: target)
        File.writeTo("${srcDir}/sub/file.txt", "x".toArray())

        copy(srcDir, to: dstDir)
        @Expect(FileInfo("${dstDir}/sub/link").isSymbolicLink(), true)
        @Expect(exists("${dstDir}/sub/file.txt"), true)

        cleanup("nested_link_target.txt")
        cleanup("nested_src")
        cleanup("nested_dst")
    }

    @TestCase
    func testDirectoryCreateAlreadyExists(): Unit {
        let d = p("dup_dir")
        cleanup("dup_dir")
        Directory.create(d)
        @ExpectThrows[FSException](Directory.create(d))
        cleanup("dup_dir")
    }

    @TestCase
    func testDirectoryCreateInvalidPaths(): Unit {
        @ExpectThrows[IllegalArgumentException](Directory.create(""))
        @ExpectThrows[IllegalArgumentException](Directory.create("./"))
        @ExpectThrows[IllegalArgumentException](Directory.create("/"))
    }

    @TestCase
    func testDirectoryIsEmptyNonEmpty(): Unit {
        let d = p("not_empty_dir")
        cleanup("not_empty_dir")
        Directory.create(d)
        File.writeTo("${d}/inside.txt", "x".toArray())
        @Expect(Directory.isEmpty(d), false)
        @Expect(Directory.isEmpty(Path(d)), false)
        cleanup("not_empty_dir")
    }

    @TestCase
    func testDirectoryWalkAllEntries(): Unit {
        let d = p("walk_all")
        cleanup("walk_all")
        Directory.create(d)
        File.writeTo("${d}/one.txt", "1".toArray())
        File.writeTo("${d}/two.txt", "2".toArray())
        let count = Box<Int64>(0)
        Directory.walk(d) {
            _ =>
                count.value++
                true
        }
        @Expect(count.value, 2)
        cleanup("walk_all")
    }

    @TestCase
    func testDirectoryCopyDestExistsNoOverwrite(): Unit {
        let src = p("copy_exist_src")
        let dst = p("copy_exist_dst")
        cleanup("copy_exist_src")
        cleanup("copy_exist_dst")
        Directory.create(src)
        File.writeTo("${src}/a.txt", "a".toArray())
        Directory.create(dst)
        @ExpectThrows[FSException](copy(src, to: dst, overwrite: false))
        cleanup("copy_exist_src")
        cleanup("copy_exist_dst")
    }

    @TestCase
    func testPathParentFileNameAndCanonicalizeMissing(): Unit {
        @Expect(Path("dir/sub/file.txt").fileName, "file.txt")
        @Expect(Path("dir/sub/file.txt").parent.toString(), "dir/sub")
        @Expect(Path("solo.txt").fileName, "solo.txt")
        @ExpectThrows[FSException](canonicalize(p("missing_canon_target")))
    }
}

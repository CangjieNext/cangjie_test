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
import std.io.SeekPosition
import std.process.*
import std.time.*

/*
 * Additional coverage cases for std.fs on Unix:
 * FileInfo props/permissions, OpenMode, symlink copy, Path normalize/join edges,
 * Directory walk/copy with symlinks, File descriptor/temp/error paths.
 */
@Test
class FsCoverageUnixTest {
    let baseDir: String = "./cov_tmp_fs"

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
    func testOpenModeEquatableAndToString(): Unit {
        @Expect(Read == Read, true)
        @Expect(Write == Write, true)
        @Expect(Append == Append, true)
        @Expect(ReadWrite == ReadWrite, true)
        @Expect(Read == Write, false)
        @Expect(Write == Append, false)
        @Expect(Append == ReadWrite, false)
        @Expect(ReadWrite == Read, false)
        @Expect(Read != Write, true)
        @Expect(Write != Write, false)
        @Expect(Read.toString(), "Read")
        @Expect(Write.toString(), "Write")
        @Expect(Append.toString(), "Append")
        @Expect(ReadWrite.toString(), "ReadWrite")
    }

    @TestCase
    func testFileInfoPropertiesAndPermissions(): Unit {
        let filePath = p("info_file.txt")
        cleanup("info_file.txt")
        File.writeTo(filePath, "hello-info".toArray())

        let fi = FileInfo(filePath)
        @Expect(fi.name, "info_file.txt")
        @Expect(fi.path.toString().contains("info_file.txt"), true)
        @Expect(fi.size >= 0, true)
        let _ct = fi.creationTime
        let _at = fi.lastAccessTime
        let _mt = fi.lastModificationTime
        @Expect(fi.isRegular(), true)
        @Expect(fi.isDirectory(), false)
        @Expect(fi.isSymbolicLink(), false)
        @Expect(fi.isHidden(), false)
        @Expect(fi.canRead(), true)

        match (fi.parentDirectory) {
            case Some(parent) =>
                @Expect(parent.isDirectory(), true)
                @Expect(parent == parent, true)
            case None => @Expect(false, true)
        }

        @Expect(fi.setReadable(true), true)
        @Expect(fi.canRead(), true)
        @Expect(fi.setWritable(true), true)
        @Expect(fi.canWrite(), true)
        fi.setExecutable(true)
        @Expect(fi.canExecute(), true)
        fi.setExecutable(false)
        @Expect(fi.canExecute(), false)
        fi.setWritable(false)
        @Expect(fi.canWrite(), false)
        @Expect(fi.isReadOnly(), true)
        @Expect(fi.setWritable(true), true)

        let hiddenPath = p(".hidden_file")
        cleanup(".hidden_file")
        File.writeTo(hiddenPath, "h".toArray())
        @Expect(FileInfo(hiddenPath).isHidden(), true)

        @ExpectThrows[FSException](FileInfo(p("no_such_file_info")))
        cleanup("info_file.txt")
        cleanup(".hidden_file")
    }

    @TestCase
    func testFileInfoRootParentNone(): Unit {
        let root = FileInfo("/")
        @Expect(root.parentDirectory?.path, None<Path>)
        @Expect(root.isDirectory(), true)
    }

    @TestCase
    func testCopySymbolicLinkBranches(): Unit {
        let target = p("link_target.txt")
        let link = p("sym_src")
        let linkDst = p("sym_dst")
        let regular = p("regular_for_link")
        cleanup("link_target.txt")
        cleanup("sym_src")
        cleanup("sym_dst")
        cleanup("regular_for_link")

        File.writeTo(target, "t".toArray())
        SymbolicLink.create(link, to: target)
        File.writeTo(regular, "r".toArray())

        copy(link, to: linkDst)
        @Expect(FileInfo(linkDst).isSymbolicLink(), true)

        @ExpectThrows[FSException](copy(link, to: linkDst))
        @ExpectThrows[FSException](copy(link, to: regular, overwrite: true))

        SymbolicLink.create(p("sym_dst2"), to: target)
        copy(link, to: p("sym_dst2"), overwrite: true)
        @Expect(FileInfo(p("sym_dst2")).isSymbolicLink(), true)

        // directory containing a symlink
        let srcDir = p("dir_with_link")
        let dstDir = p("dir_with_link_dst")
        cleanup("dir_with_link")
        cleanup("dir_with_link_dst")
        Directory.create(srcDir)
        SymbolicLink.create("${srcDir}/inside_link", to: target)
        File.writeTo("${srcDir}/inside_file.txt", "x".toArray())
        copy(srcDir, to: dstDir)
        @Expect(exists("${dstDir}/inside_file.txt"), true)
        @Expect(FileInfo("${dstDir}/inside_link").isSymbolicLink(), true)

        cleanup("link_target.txt")
        cleanup("sym_src")
        cleanup("sym_dst")
        cleanup("sym_dst2")
        cleanup("regular_for_link")
        cleanup("dir_with_link")
        cleanup("dir_with_link_dst")
    }

    @TestCase
    func testCopyTypeMismatchOverwrite(): Unit {
        let fileA = p("type_a")
        let dirB = p("type_b_dir")
        cleanup("type_a")
        cleanup("type_b_dir")
        File.writeTo(fileA, "a".toArray())
        Directory.create(dirB)
        @ExpectThrows[FSException](copy(fileA, to: dirB, overwrite: true))
        @ExpectThrows[FSException](copy(dirB, to: fileA, overwrite: true))
        @ExpectThrows[FSException](copy(fileA, to: fileA))
        cleanup("type_a")
        cleanup("type_b_dir")
    }

    @TestCase
    func testPathNormalizeAndJoinEdges(): Unit {
        @Expect(Path("").normalize().toString(), ".")
        @Expect(Path("a/./b/../c").normalize().toString(), "a/c")
        @Expect(Path("a/b/../..").normalize().toString(), ".")
        @Expect(Path("a/b/../../..").normalize().toString().contains(".."), true)
        @Expect(Path("../..").normalize().toString(), "../..")
        @Expect(Path("a/../..").normalize().toString(), "..")
        @Expect(Path("/../a").normalize().toString(), "/a")
        @Expect(Path("/a/b/../..").normalize().toString(), "/")
        @Expect(Path("/").normalize().toString(), "/")
        @Expect(Path("//").normalize().toString(), "/")
        @Expect(Path("/a/../b/.").normalize().toString(), "/b")
        @Expect(Path("a/b/c.txt").extensionName, "txt")
        @Expect(Path("a/b/c.txt").fileNameWithoutExtension, "c")
        @Expect(Path("a/b/noext").extensionName, "")
        @Expect(Path("a/b/noext").fileNameWithoutExtension, "noext")
        @Expect(Path("a/b/c.d.e").extensionName, "e")
        @Expect(Path("rel").isRelative(), true)
        @Expect(Path("/abs").isAbsolute(), true)

        // parent / fileName with trailing slashes
        @Expect(Path("a/b///").parent.toString(), "a")
        @Expect(Path("a/b/").fileName, "b")
        @Expect(Path("a///").fileName, "a")
        @Expect(Path("plain").parent.toString(), "")
        @Expect(Path("plain").fileName, "plain")
        @Expect(Path("/a/").parent.toString(), "/")
        @Expect(Path("/a/").fileName, "a")

        let joined = Path("parent/").join("child")
        @Expect(joined.toString(), "parent/child")
        let joined2 = Path("parent").join("")
        @Expect(joined2.toString().endsWith("/"), true)
        let joined3 = Path("parent/").join("")
        @Expect(joined3.toString(), "parent/")
        @ExpectThrows[FSException](Path("parent").join("/abs"))
        @Expect(Path("parent").join(Path("child")).toString().contains("child"), true)

        let hp = Path("a.B.c")
        @Expect(hp.hashCode() == Path("a.B.c").hashCode(), true)
        @Expect(Path("x/y") == Path("x/./y"), true)
        @Expect(Path("").isEmpty(), true)
        @Expect(Path("x").isEmpty(), false)
        @Expect(Path.Separator, "/")
        @Expect(Path.ListSeparator, ":")
    }

    @TestCase
    func testDirectoryEdges(): Unit {
        let emptyDir = p("empty_dir")
        let notEmpty = p("not_empty")
        cleanup("empty_dir")
        cleanup("not_empty")
        Directory.create(emptyDir)
        Directory.create(notEmpty)
        File.writeTo("${notEmpty}/f.txt", "1".toArray())

        @Expect(Directory.isEmpty(Path(emptyDir)), true)
        @Expect(Directory.isEmpty(emptyDir), true)
        @Expect(Directory.isEmpty(notEmpty), false)
        @ExpectThrows[FSException](Directory.isEmpty(p("no_dir_is_empty")))
        @ExpectThrows[FSException](Directory.isEmpty("${notEmpty}/f.txt"))

        let walked = Box<Int64>(0)
        Directory.walk(notEmpty) {
            info =>
                walked.value++
                false
        }
        @Expect(walked.value, 1)

        let walkedAll = Box<Int64>(0)
        Directory.walk(Path(notEmpty)) {
            info =>
                walkedAll.value++
                true
        }
        @Expect(walkedAll.value >= 1, true)

        @ExpectThrows[FSException](
            Directory.create(emptyDir)
        )
        @ExpectThrows[IllegalArgumentException](
            Directory.create("")
        )
        @ExpectThrows[IllegalArgumentException](
            Directory.create("/")
        )
        @ExpectThrows[IllegalArgumentException](
            Directory.create("./")
        )
        @ExpectThrows[FSException](
            Directory.create(p("missing_parent/sub"), recursive: false)
        )

        let tempDir = Directory.createTemp(emptyDir)
        @Expect(exists(tempDir), true)
        remove(tempDir, recursive: true)

        let destExists = p("dest_exists")
        cleanup("dest_exists")
        Directory.create(destExists)
        @ExpectThrows[FSException](copy(notEmpty, to: destExists))
        copy(notEmpty, to: destExists, overwrite: true)

        cleanup("empty_dir")
        cleanup("not_empty")
        cleanup("dest_exists")
    }

    @TestCase
    func testFileApiEdges(): Unit {
        let fpath = p("file_api.txt")
        cleanup("file_api.txt")

        let created = File.create(fpath)
        @Expect(created.length >= 0, true)
        let fd = created.fileDescriptor
        @Expect(fd.fileHandle > 0, true)
        let info = created.info
        @Expect(info.isRegular(), true)
        created.write("abc".toArray())
        created.write(Array<Byte>())
        created.flush()
        created.setLength(1)
        @ExpectThrows[IllegalArgumentException](created.setLength(-1))
        created.close()
        @Expect(created.isClosed(), true)
        @Expect(created.canRead(), false)
        @Expect(created.canWrite(), false)
        @ExpectThrows[FSException](created.write("x".toArray()))
        created.close()

        @ExpectThrows[FSException](File.create(fpath))

        let bytes = File.readFrom(Path(fpath))
        @Expect(bytes.size >= 1, true)
        File.writeTo(Path(fpath), "xyz".toArray())

        let temp = File.createTemp(baseDir)
        @Expect(temp.info.isRegular(), true)
        temp.write("t".toArray())
        let tempPath = temp.info.path.toString()
        temp.close()
        remove(tempPath)

        try (f = File(fpath, ReadWrite)) {
            f.seek(Begin(0))
            var buf = Array<Byte>(8, repeat: 0)
            let n = f.read(buf)
            @Expect(n >= 0, true)
            @ExpectThrows[IllegalArgumentException](f.read(Array<Byte>()))
        }

        let src = p("copy_src.txt")
        let dst = p("copy_dst.txt")
        cleanup("copy_src.txt")
        cleanup("copy_dst.txt")
        File.writeTo(src, "copy-me".toArray())
        copy(src, to: dst)
        copy(src, to: dst, overwrite: true)
        @ExpectThrows[FSException](copy(src, to: dst))

        cleanup("file_api.txt")
        cleanup("copy_src.txt")
        cleanup("copy_dst.txt")
    }

    @TestCase
    func testRemoveRenameExistsEdges(): Unit {
        let f1 = p("rm1.txt")
        let f2 = p("rm2.txt")
        let d1 = p("rm_dir")
        cleanup("rm1.txt")
        cleanup("rm2.txt")
        cleanup("rm_dir")

        File.writeTo(f1, "1".toArray())
        File.writeTo(f2, "2".toArray())
        @Expect(removeIfExists(f1), true)
        @Expect(removeIfExists(f1), false)
        @Expect(removeIfExists(Path(f1)), false)

        File.writeTo(f1, "1".toArray())
        rename(f1, to: p("rm1_renamed.txt"))
        @Expect(exists(p("rm1_renamed.txt")), true)
        @ExpectThrows[FSException](rename(p("rm1_renamed.txt"), to: f2))
        rename(p("rm1_renamed.txt"), to: f2, overwrite: true)
        @ExpectThrows[FSException](rename(f2, to: f2))
        @ExpectThrows[FSException](rename(p("no_src_rename"), to: p("no_dst_rename")))

        Directory.create(d1)
        File.writeTo("${d1}/inner.txt", "i".toArray())
        @ExpectThrows[FSException](remove(d1))
        remove(d1, recursive: true)

        @ExpectThrows[IllegalArgumentException](exists(""))
        @ExpectThrows[IllegalArgumentException](remove(""))

        let link = p("hard_src")
        let hard = p("hard_dst")
        cleanup("hard_src")
        cleanup("hard_dst")
        File.writeTo(link, "h".toArray())
        HardLink.create(hard, to: link)
        @ExpectThrows[FSException](HardLink.create(hard, to: link))
        @ExpectThrows[FSException](SymbolicLink.create(hard, to: link))
        @ExpectThrows[IllegalArgumentException](SymbolicLink.readFrom(link))

        cleanup("rm1.txt")
        cleanup("rm2.txt")
        cleanup("rm_dir")
        cleanup("hard_src")
        cleanup("hard_dst")
        cleanup("rm1_renamed.txt")
    }

    @TestCase
    func testAppendTempFailAndUnsupportedType(): Unit {
        let fpath = p("append_file.txt")
        cleanup("append_file.txt")
        File.writeTo(fpath, "a".toArray())
        File.appendTo(fpath, "b".toArray())
        File.appendTo(Path(fpath), "c".toArray())
        let data = File.readFrom(fpath)
        @Expect(data.size >= 3, true)

        // createTemp against a regular file should fail
        @ExpectThrows[FSException](File.createTemp(fpath))
        @ExpectThrows[FSException](Directory.createTemp(fpath))

        // directory create trailing slash and already-exists via Path overload
        let d = p("trail_dir")
        cleanup("trail_dir")
        Directory.create(Path("${d}/"))
        @ExpectThrows[FSException](Directory.create("${d}/"))
        Directory.readFrom(d)
        Directory.readFrom(Path(d))

        // FIFO is neither file/dir/symlink → unsupported type on copy
        let fifo = p("my_fifo")
        cleanup("my_fifo")
        let fifoDst = p("my_fifo_dst")
        cleanup("my_fifo_dst")
        execute("mkfifo", [fifo])
        @ExpectThrows[FSException](copy(fifo, to: fifoDst))
        cleanup("my_fifo")
        cleanup("my_fifo_dst")
        cleanup("append_file.txt")
        cleanup("trail_dir")
    }

    @TestCase
    func testCanonicalizeFailureAndBrokenLink(): Unit {
        @ExpectThrows[FSException](canonicalize(p("missing_for_canon")))
        @ExpectThrows[FSException](canonicalize(Path(p("missing_for_canon2"))))

        let target = p("real_for_recur")
        let link = p("recur_link")
        cleanup("real_for_recur")
        cleanup("recur_link")
        File.writeTo(target, "r".toArray())
        let absTarget = canonicalize(target).toString()
        SymbolicLink.create(link, to: absTarget)
        let recur = SymbolicLink.readFrom(link, recursive: true)
        @Expect(recur.toString().size > 0, true)

        let dangling = p("dangling_link")
        cleanup("dangling_link")
        SymbolicLink.create(dangling, to: p("no_real_target"))
        @Expect(exists(dangling), true)
        @ExpectThrows[FSException](SymbolicLink.readFrom(dangling, recursive: true))
        let direct = SymbolicLink.readFrom(dangling)
        @Expect(direct.toString().contains("no_real_target"), true)

        cleanup("real_for_recur")
        cleanup("recur_link")
        cleanup("dangling_link")
    }
}

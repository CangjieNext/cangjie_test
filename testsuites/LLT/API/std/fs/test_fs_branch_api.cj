/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt


import std.fs.*
import std.io.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class FsBranchApiTest {

    // ===== OpenMode.== and != edge cases =====

    @TestCase
    func test_openmode_eq_same(): Unit {
        @Assert(OpenMode.Read == OpenMode.Read)
        @Assert(OpenMode.Write == OpenMode.Write)
        @Assert(OpenMode.Append == OpenMode.Append)
        @Assert(OpenMode.ReadWrite == OpenMode.ReadWrite)
    }

    @TestCase
    func test_openmode_eq_different(): Unit {
        @Assert(!(OpenMode.Read == OpenMode.Write))
        @Assert(!(OpenMode.Read == OpenMode.Append))
        @Assert(!(OpenMode.Read == OpenMode.ReadWrite))
        @Assert(!(OpenMode.Write == OpenMode.Append))
        @Assert(!(OpenMode.Write == OpenMode.ReadWrite))
        @Assert(!(OpenMode.Append == OpenMode.ReadWrite))
    }

    @TestCase
    func test_openmode_neq(): Unit {
        @Assert(OpenMode.Read != OpenMode.Write)
        @Assert(OpenMode.Write != OpenMode.Append)
        @Assert(OpenMode.Append != OpenMode.ReadWrite)
        @Assert(!(OpenMode.Read != OpenMode.Read))
        @Assert(!(OpenMode.Write != OpenMode.Write))
    }

    // ===== File.setLength error paths =====

    @TestCase
    func test_setLength_negative(): Unit {
        let path = "/tmp/cj_branch_setlen_neg.txt"
        File.writeTo(path, [65, 66, 67])
        try {
            let f = File(path, OpenMode.ReadWrite)
            try {
                f.setLength(-1)
                @Assert(false)
            } catch (e: IllegalArgumentException) {
                @Assert(true)
            }
            f.close()
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_setLength_readonly(): Unit {
        let path = "/tmp/cj_branch_setlen_ro.txt"
        File.writeTo(path, [65, 66, 67])
        try {
            let f = File(path, OpenMode.Read)
            try {
                f.setLength(0)
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
            f.close()
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_setLength_append_mode(): Unit {
        let path = "/tmp/cj_branch_setlen_append.txt"
        File.writeTo(path, [65, 66, 67])
        try {
            let f = File(path, OpenMode.Append)
            try {
                f.setLength(1)
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
            f.close()
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_setLength_closed_file(): Unit {
        let path = "/tmp/cj_branch_setlen_closed.txt"
        File.writeTo(path, [65, 66, 67])
        try {
            let f = File(path, OpenMode.ReadWrite)
            f.close()
            try {
                f.setLength(1)
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_setLength_valid_truncate(): Unit {
        let path = "/tmp/cj_branch_setlen_trunc.txt"
        File.writeTo(path, [65, 66, 67, 68, 69])
        try {
            let f = File(path, OpenMode.ReadWrite)
            f.setLength(2)
            @Expect(f.length, 2)
            f.close()
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_setLength_valid_expand(): Unit {
        let path = "/tmp/cj_branch_setlen_expand.txt"
        File.writeTo(path, [65, 66])
        try {
            let f = File(path, OpenMode.ReadWrite)
            f.setLength(10)
            @Expect(f.length, 10)
            f.close()
        } finally {
            remove(path)
        }
    }

    // ===== File.close() edge cases =====

    @TestCase
    func test_close_already_closed(): Unit {
        let path = "/tmp/cj_branch_close_twice.txt"
        File.writeTo(path, [65])
        try {
            let f = File(path, OpenMode.Read)
            f.close()
            f.close() // should not throw
            @Assert(true)
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_close_invalid_handle(): Unit {
        let path = "/tmp/cj_branch_close_inv.txt"
        File.writeTo(path, [65])
        try {
            let f = File(path, OpenMode.Read)
            f.close()
            @Assert(f.isClosed())
            @Assert(!f.canRead())
            @Assert(!f.canWrite())
        } finally {
            remove(path)
        }
    }

    // ===== File.read error paths =====

    @TestCase
    func test_read_closed_file(): Unit {
        let path = "/tmp/cj_branch_read_closed.txt"
        File.writeTo(path, [65, 66, 67])
        try {
            let f = File(path, OpenMode.Read)
            f.close()
            try {
                let buf = Array<Byte>(3, repeat: 0)
                let _ = f.read(buf)
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_read_writeonly_file(): Unit {
        let path = "/tmp/cj_branch_read_wo.txt"
        try {
            let f = File(path, OpenMode.Write)
            try {
                let buf = Array<Byte>(3, repeat: 0)
                let _ = f.read(buf)
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
            f.close()
        } finally {
            removeIfExists(path)
        }
    }

    @TestCase
    func test_read_empty_buffer(): Unit {
        let path = "/tmp/cj_branch_read_empty.txt"
        File.writeTo(path, [65, 66, 67])
        try {
            let f = File(path, OpenMode.Read)
            try {
                let _ = f.read(Array<Byte>())
                @Assert(false)
            } catch (e: IllegalArgumentException) {
                @Assert(true)
            }
            f.close()
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_read_zero_bytes(): Unit {
        let path = "/tmp/cj_branch_read_zero.txt"
        File.writeTo(path, [65, 66, 67])
        try {
            let f = File(path, OpenMode.Read)
            let _ = f.seek(SeekPosition.End(0))
            let buf = Array<Byte>(3, repeat: 0)
            let n = f.read(buf)
            @Expect(n, 0)
            f.close()
        } finally {
            remove(path)
        }
    }

    // ===== File.write error paths =====

    @TestCase
    func test_write_closed_file(): Unit {
        let path = "/tmp/cj_branch_write_closed.txt"
        File.writeTo(path, [65])
        try {
            let f = File(path, OpenMode.ReadWrite)
            f.close()
            try {
                f.write([66])
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_write_readonly_file(): Unit {
        let path = "/tmp/cj_branch_write_ro.txt"
        File.writeTo(path, [65])
        try {
            let f = File(path, OpenMode.Read)
            try {
                f.write([66])
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
            f.close()
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_write_empty_buffer(): Unit {
        let path = "/tmp/cj_branch_write_empty.txt"
        try {
            let f = File(path, OpenMode.ReadWrite)
            f.write(Array<Byte>()) // should not throw
            f.close()
            @Assert(true)
        } finally {
            remove(path)
        }
    }

    // ===== File.seek error paths =====

    @TestCase
    func test_seek_closed_file(): Unit {
        let path = "/tmp/cj_branch_seek_closed.txt"
        File.writeTo(path, [65, 66, 67])
        try {
            let f = File(path, OpenMode.ReadWrite)
            f.close()
            try {
                let _ = f.seek(SeekPosition.Begin(0))
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_seek_append_mode(): Unit {
        let path = "/tmp/cj_branch_seek_append.txt"
        File.writeTo(path, [65, 66, 67])
        try {
            let f = File(path, OpenMode.Append)
            try {
                let _ = f.seek(SeekPosition.Begin(0))
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
            f.close()
        } finally {
            remove(path)
        }
    }

    // ===== Directory.walk() error paths =====

    @TestCase
    func test_walk_nonexistent_path(): Unit {
        try {
            Directory.walk("/tmp/cj_nonexistent_dir_99999") { _ => true }
            @Assert(false)
        } catch (e: FSException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_walk_on_file_not_dir(): Unit {
        let path = "/tmp/cj_branch_walk_file.txt"
        File.writeTo(path, [65, 66])
        try {
            try {
                Directory.walk(path) { _ => true }
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_walk_empty_dir(): Unit {
        let dirPath = "/tmp/cj_branch_walk_empty_dir"
        if (exists(dirPath)) {
            remove(dirPath, recursive: true)
        }
        Directory.create(dirPath)
        try {
            let counter = Box<Int64>(0)
            Directory.walk(dirPath) { _ =>
                counter.value++
                true
            }
            @Expect(counter.value, 0)
        } finally {
            remove(dirPath, recursive: true)
        }
    }

    @TestCase
    func test_walk_with_false_callback(): Unit {
        let dirPath = "/tmp/cj_branch_walk_false_cb"
        if (exists(dirPath)) {
            remove(dirPath, recursive: true)
        }
        Directory.create(dirPath)
        File.writeTo(dirPath + "/a.txt", [65])
        File.writeTo(dirPath + "/b.txt", [66])
        try {
            let counter = Box<Int64>(0)
            Directory.walk(dirPath) { _ =>
                counter.value++
                false // stop after first
            }
            @Expect(counter.value, 1)
        } finally {
            remove(dirPath, recursive: true)
        }
    }

    @TestCase
    func test_walk_with_true_callback(): Unit {
        let dirPath = "/tmp/cj_branch_walk_true_cb"
        if (exists(dirPath)) {
            remove(dirPath, recursive: true)
        }
        Directory.create(dirPath)
        File.writeTo(dirPath + "/a.txt", [65])
        File.writeTo(dirPath + "/b.txt", [66])
        try {
            let counter = Box<Int64>(0)
            Directory.walk(dirPath) { _ =>
                counter.value++
                true
            }
            @Expect(counter.value, 2)
        } finally {
            remove(dirPath, recursive: true)
        }
    }

    // ===== Directory.create() error cases =====

    @TestCase
    func test_create_already_exists(): Unit {
        let dirPath = "/tmp/cj_branch_create_exists"
        if (exists(dirPath)) {
            remove(dirPath, recursive: true)
        }
        Directory.create(dirPath)
        try {
            try {
                Directory.create(dirPath)
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
        } finally {
            remove(dirPath, recursive: true)
        }
    }

    @TestCase
    func test_create_nonrecursive_no_parent(): Unit {
        let dirPath = "/tmp/cj_branch_no_parent/sub"
        try {
            try {
                Directory.create(dirPath, recursive: false)
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
        } finally {
            removeIfExists("/tmp/cj_branch_no_parent", recursive: true)
        }
    }

    @TestCase
    func test_create_recursive_success(): Unit {
        let dirPath = "/tmp/cj_branch_recursive/a/b/c"
        if (exists("/tmp/cj_branch_recursive")) {
            remove("/tmp/cj_branch_recursive", recursive: true)
        }
        try {
            Directory.create(dirPath, recursive: true)
            @Assert(exists(dirPath))
        } finally {
            removeIfExists("/tmp/cj_branch_recursive", recursive: true)
        }
    }

    @TestCase
    func test_create_invalid_empty_path(): Unit {
        try {
            try {
                Directory.create("")
                @Assert(false)
            } catch (e: IllegalArgumentException) {
                @Assert(true)
            }
        } finally {}
    }

    @TestCase
    func test_create_invalid_null_byte(): Unit {
        try {
            try {
                Directory.create("bad\0path")
                @Assert(false)
            } catch (e: IllegalArgumentException) {
                @Assert(true)
            }
        } finally {}
    }

    @TestCase
    func test_create_current_dir_path(): Unit {
        try {
            try {
                Directory.create("./")
                @Assert(false)
            } catch (e: IllegalArgumentException) {
                @Assert(true)
            }
        } finally {}
    }

    @TestCase
    func test_create_root_path(): Unit {
        try {
            try {
                Directory.create("/")
                @Assert(false)
            } catch (e: IllegalArgumentException) {
                @Assert(true)
            }
        } finally {}
    }

    // ===== Directory.exists() edge cases =====

    @TestCase
    func test_directory_exists_nonexistent(): Unit {
        @Assert(!exists("/tmp/cj_nonexist_99999_xyz"))
    }

    @TestCase
    func test_directory_exists_empty_path(): Unit {
        try {
            let _ = exists("")
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_directory_exists_null_byte(): Unit {
        try {
            let _ = exists("bad\0path")
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(true)
        }
    }

    // ===== copy() error paths =====

    @TestCase
    func test_copy_same_path(): Unit {
        let path = "/tmp/cj_branch_copy_same.txt"
        File.writeTo(path, [65, 66])
        try {
            try {
                copy(path, to: path)
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_copy_dest_exists_no_overwrite(): Unit {
        let src = "/tmp/cj_branch_copy_src.txt"
        let dst = "/tmp/cj_branch_copy_dst.txt"
        File.writeTo(src, [65])
        File.writeTo(dst, [66])
        try {
            try {
                copy(src, to: dst)
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
        } finally {
            removeIfExists(src)
            removeIfExists(dst)
        }
    }

    @TestCase
    func test_copy_dest_exists_with_overwrite(): Unit {
        let src = "/tmp/cj_branch_copy_ovw_src.txt"
        let dst = "/tmp/cj_branch_copy_ovw_dst.txt"
        File.writeTo(src, [65, 66, 67])
        File.writeTo(dst, [66])
        try {
            copy(src, to: dst, overwrite: true)
            let data = File.readFrom(dst)
            @Expect(data.size, 3)
            @Expect(data[0], 65)
        } finally {
            removeIfExists(src)
            removeIfExists(dst)
        }
    }

    @TestCase
    func test_copy_file_to_dir_type_mismatch(): Unit {
        let src = "/tmp/cj_branch_copy_fm_src.txt"
        let dstDir = "/tmp/cj_branch_copy_fm_dst"
        File.writeTo(src, [65])
        if (!exists(dstDir)) {
            Directory.create(dstDir)
        }
        try {
            try {
                copy(src, to: dstDir, overwrite: true)
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
        } finally {
            removeIfExists(src)
            removeIfExists(dstDir, recursive: true)
        }
    }

    @TestCase
    func test_copy_dir_to_file_type_mismatch(): Unit {
        let srcDir = "/tmp/cj_branch_copy_dm_src"
        let dstFile = "/tmp/cj_branch_copy_dm_dst.txt"
        if (!exists(srcDir)) {
            Directory.create(srcDir)
        }
        File.writeTo(dstFile, [65])
        try {
            try {
                copy(srcDir, to: dstFile, overwrite: true)
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
        } finally {
            removeIfExists(srcDir, recursive: true)
            removeIfExists(dstFile)
        }
    }

    @TestCase
    func test_copy_nonexistent_source(): Unit {
        try {
            try {
                copy("/tmp/cj_nonexist_src_99999.txt", to: "/tmp/cj_nonexist_dst_99999.txt")
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
        } finally {}
    }

    @TestCase
    func test_copy_empty_source_path(): Unit {
        try {
            try {
                copy("", to: "/tmp/cj_branch_copy_empty.txt")
                @Assert(false)
            } catch (e: IllegalArgumentException) {
                @Assert(true)
            }
        } finally {}
    }

    @TestCase
    func test_copy_null_byte_source_path(): Unit {
        try {
            try {
                copy("bad\0src", to: "/tmp/cj_branch_copy_nb.txt")
                @Assert(false)
            } catch (e: IllegalArgumentException) {
                @Assert(true)
            }
        } finally {}
    }

    // ===== remove() paths =====

    @TestCase
    func test_remove_nonexistent(): Unit {
        try {
            try {
                remove("/tmp/cj_nonexist_remove_99999")
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
        } finally {}
    }

    @TestCase
    func test_remove_empty_path(): Unit {
        try {
            try {
                remove("")
                @Assert(false)
            } catch (e: IllegalArgumentException) {
                @Assert(true)
            }
        } finally {}
    }

    @TestCase
    func test_remove_null_byte_path(): Unit {
        try {
            try {
                remove("bad\0path")
                @Assert(false)
            } catch (e: IllegalArgumentException) {
                @Assert(true)
            }
        } finally {}
    }

    @TestCase
    func test_remove_nonempty_dir_nonrecursive(): Unit {
        let dirPath = "/tmp/cj_branch_remove_nonempty"
        if (exists(dirPath)) {
            remove(dirPath, recursive: true)
        }
        Directory.create(dirPath)
        File.writeTo(dirPath + "/file.txt", [65])
        try {
            try {
                remove(dirPath, recursive: false)
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
        } finally {
            removeIfExists(dirPath, recursive: true)
        }
    }

    // ===== removeIfExists() paths =====

    @TestCase
    func test_removeIfExists_existing(): Unit {
        let path = "/tmp/cj_branch_rife_exist.txt"
        File.writeTo(path, [65])
        try {
            let result = removeIfExists(path)
            @Assert(result)
            @Assert(!exists(path))
        } finally {
            removeIfExists(path)
        }
    }

    @TestCase
    func test_removeIfExists_nonexisting(): Unit {
        let result = removeIfExists("/tmp/cj_nonexist_rife_99999.txt")
        @Assert(!result)
    }

    @TestCase
    func test_removeIfExists_recursive(): Unit {
        let dirPath = "/tmp/cj_branch_rife_recur"
        if (exists(dirPath)) {
            remove(dirPath, recursive: true)
        }
        Directory.create(dirPath)
        File.writeTo(dirPath + "/file.txt", [65])
        try {
            let result = removeIfExists(dirPath, recursive: true)
            @Assert(result)
            @Assert(!exists(dirPath))
        } finally {
            removeIfExists(dirPath, recursive: true)
        }
    }

    @TestCase
    func test_removeIfExists_empty_path(): Unit {
        try {
            try {
                let _ = removeIfExists("")
                @Assert(false)
            } catch (e: IllegalArgumentException) {
                @Assert(true)
            }
        } finally {}
    }

    // ===== exists() paths =====

    @TestCase
    func test_exists_existing_file(): Unit {
        let path = "/tmp/cj_branch_exists_file.txt"
        File.writeTo(path, [65])
        try {
            @Assert(exists(path))
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_exists_existing_dir(): Unit {
        let dirPath = "/tmp/cj_branch_exists_dir"
        if (exists(dirPath)) {
            remove(dirPath, recursive: true)
        }
        Directory.create(dirPath)
        try {
            @Assert(exists(dirPath))
        } finally {
            remove(dirPath, recursive: true)
        }
    }

    @TestCase
    func test_exists_path_overload(): Unit {
        let path = "/tmp/cj_branch_exists_path.txt"
        File.writeTo(path, [65])
        try {
            @Assert(exists(Path(path)))
            @Assert(!exists(Path("/tmp/cj_nonexist_path_99999.txt")))
        } finally {
            remove(path)
        }
    }

    // ===== FileInfo.== with different files =====

    @TestCase
    func test_fileinfo_eq_same_file(): Unit {
        let path = "/tmp/cj_branch_fi_eq_same.txt"
        File.writeTo(path, [65])
        try {
            let info1 = FileInfo(path)
            let info2 = FileInfo(path)
            @Assert(info1 == info2)
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_fileinfo_eq_different_files(): Unit {
        let path1 = "/tmp/cj_branch_fi_eq_a.txt"
        let path2 = "/tmp/cj_branch_fi_eq_b.txt"
        File.writeTo(path1, [65])
        File.writeTo(path2, [66])
        try {
            let info1 = FileInfo(path1)
            let info2 = FileInfo(path2)
            @Assert(!(info1 == info2))
        } finally {
            remove(path1)
            remove(path2)
        }
    }

    @TestCase
    func test_fileinfo_eq_different_dir_file(): Unit {
        let dirPath = "/tmp/cj_branch_fi_eq_dir"
        let filePath = "/tmp/cj_branch_fi_eq_file2.txt"
        if (!exists(dirPath)) {
            Directory.create(dirPath)
        }
        File.writeTo(filePath, [65])
        try {
            let dirInfo = FileInfo(dirPath)
            let fileInfo = FileInfo(filePath)
            @Assert(!(dirInfo == fileInfo))
        } finally {
            removeIfExists(dirPath, recursive: true)
            removeIfExists(filePath)
        }
    }

    // ===== Path edge cases =====

    @TestCase
    func test_path_empty_isEmpty(): Unit {
        let p = Path("")
        @Assert(p.isEmpty())
    }

    @TestCase
    func test_path_nonempty_isEmpty(): Unit {
        let p = Path("/some/path")
        @Assert(!p.isEmpty())
    }

    @TestCase
    func test_path_normalize_empty(): Unit {
        let p = Path("")
        @Expect(p.normalize().toString(), ".")
    }

    @TestCase
    func test_path_normalize_dot(): Unit {
        let p = Path("./a/./b/..")
        let result = p.normalize().toString()
@Expect(result, "a")
    }

    @TestCase
    func test_path_normalize_dotdot(): Unit {
        let p = Path("/a/b/../c")
        @Expect(p.normalize().toString(), "/a/c")
    }

    @TestCase
    func test_path_join_empty_path(): Unit {
        let p = Path("/tmp")
        let result = p.join("")
        @Assert(result.toString() == "/tmp/" || result.toString() == "/tmp")
    }

    @TestCase
    func test_path_join_absolute_path(): Unit {
        let p = Path("/tmp")
        try {
            try {
                let _ = p.join("/absolute")
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
        } finally {}
    }

    @TestCase
    func test_path_parent_root(): Unit {
        let p = Path("/")
        @Expect(p.parent.toString(), "/")
    }

    @TestCase
    func test_path_parent_empty_throws(): Unit {
        try {
            try {
                let _ = Path("").parent
                @Assert(false)
            } catch (e: IllegalArgumentException) {
                @Assert(true)
            }
        } finally {}
    }

    @TestCase
    func test_path_parent_null_byte_throws(): Unit {
        try {
            try {
                let _ = Path("bad\0path").parent
                @Assert(false)
            } catch (e: IllegalArgumentException) {
                @Assert(true)
            }
        } finally {}
    }

    @TestCase
    func test_path_fileName_empty_throws(): Unit {
        try {
            try {
                let _ = Path("").fileName
                @Assert(false)
            } catch (e: IllegalArgumentException) {
                @Assert(true)
            }
        } finally {}
    }

    @TestCase
    func test_path_fileName_null_byte_throws(): Unit {
        try {
            try {
                let _ = Path("bad\0path").fileName
                @Assert(false)
            } catch (e: IllegalArgumentException) {
                @Assert(true)
            }
        } finally {}
    }

    @TestCase
    func test_path_isAbsolute_empty_throws(): Unit {
        try {
            try {
                let _ = Path("").isAbsolute()
                @Assert(false)
            } catch (e: IllegalArgumentException) {
                @Assert(true)
            }
        } finally {}
    }

    @TestCase
    func test_path_isRelative_empty_throws(): Unit {
        try {
            try {
                let _ = Path("").isRelative()
                @Assert(false)
            } catch (e: IllegalArgumentException) {
                @Assert(true)
            }
        } finally {}
    }

    @TestCase
    func test_path_eq_normalize(): Unit {
        let p1 = Path("/a/b/../c")
        let p2 = Path("/a/c")
        @Assert(p1 == p2)
    }

    // ===== File.create error paths =====

    @TestCase
    func test_file_create_already_exists(): Unit {
        let path = "/tmp/cj_branch_create_exists.txt"
        File.writeTo(path, [65])
        try {
            try {
                let _ = File.create(path)
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_file_create_empty_path(): Unit {
        try {
            try {
                let _ = File.create("")
                @Assert(false)
            } catch (e: IllegalArgumentException) {
                @Assert(true)
            }
        } finally {}
    }

    @TestCase
    func test_file_open_empty_path(): Unit {
        try {
            try {
                let _ = File("", OpenMode.Read)
                @Assert(false)
            } catch (e: IllegalArgumentException) {
                @Assert(true)
            }
        } finally {}
    }

    @TestCase
    func test_file_open_null_byte_path(): Unit {
        try {
            try {
                let _ = File("bad\0path", OpenMode.Read)
                @Assert(false)
            } catch (e: IllegalArgumentException) {
                @Assert(true)
            }
        } finally {}
    }

    @TestCase
    func test_file_open_nonexistent_read(): Unit {
        try {
            try {
                let _ = File("/tmp/cj_nonexist_open_99999.txt", OpenMode.Read)
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
        } finally {}
    }

    @TestCase
    func test_file_open_parent_not_exist(): Unit {
        try {
            try {
                let _ = File("/tmp/cj_nonexist_parent_99999/file.txt", OpenMode.ReadWrite)
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
        } finally {}
    }

    // ===== File.canRead/canWrite/canSeek =====

    @TestCase
    func test_canread_canwrite_read_mode(): Unit {
        let path = "/tmp/cj_branch_crw_read.txt"
        File.writeTo(path, [65])
        try {
            let f = File(path, OpenMode.Read)
            @Assert(f.canRead())
            @Assert(!f.canWrite())
            f.close()
            @Assert(!f.canRead())
            @Assert(!f.canWrite())
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_canread_canwrite_write_mode(): Unit {
        let path = "/tmp/cj_branch_crw_write.txt"
        try {
            let f = File(path, OpenMode.Write)
            @Assert(!f.canRead())
            @Assert(f.canWrite())
            f.close()
        } finally {
            removeIfExists(path)
        }
    }

    @TestCase
    func test_canread_canwrite_readwrite_mode(): Unit {
        let path = "/tmp/cj_branch_crw_rw.txt"
        File.writeTo(path, [65])
        try {
            let f = File(path, OpenMode.ReadWrite)
            @Assert(f.canRead())
            @Assert(f.canWrite())
            f.close()
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_canread_canwrite_append_mode(): Unit {
        let path = "/tmp/cj_branch_crw_append.txt"
        File.writeTo(path, [65])
        try {
            let f = File(path, OpenMode.Append)
            @Assert(!f.canRead())
            @Assert(f.canWrite())
            f.close()
        } finally {
            remove(path)
        }
    }

    // ===== File.length on closed file =====

    @TestCase
    func test_length_closed_file(): Unit {
        let path = "/tmp/cj_branch_len_closed.txt"
        File.writeTo(path, [65, 66, 67])
        try {
            let f = File(path, OpenMode.ReadWrite)
            f.close()
            @Expect(f.length, -1)
        } finally {
            remove(path)
        }
    }

    // ===== Directory.isEmpty error paths =====

    @TestCase
    func test_dir_isempty_nonexistent(): Unit {
        try {
            try {
                let _ = Directory.isEmpty("/tmp/cj_nonexist_empty_99999")
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
        } finally {}
    }

    @TestCase
    func test_dir_isempty_on_file(): Unit {
        let path = "/tmp/cj_branch_isempty_file.txt"
        File.writeTo(path, [65])
        try {
            try {
                let _ = Directory.isEmpty(path)
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_dir_isempty_empty_dir(): Unit {
        let dirPath = "/tmp/cj_branch_isempty_empty"
        if (exists(dirPath)) {
            remove(dirPath, recursive: true)
        }
        Directory.create(dirPath)
        try {
            @Assert(Directory.isEmpty(dirPath))
        } finally {
            remove(dirPath, recursive: true)
        }
    }

    @TestCase
    func test_dir_isempty_nonempty_dir(): Unit {
        let dirPath = "/tmp/cj_branch_isempty_nonempty"
        if (exists(dirPath)) {
            remove(dirPath, recursive: true)
        }
        Directory.create(dirPath)
        File.writeTo(dirPath + "/file.txt", [65])
        try {
            @Assert(!Directory.isEmpty(dirPath))
        } finally {
            remove(dirPath, recursive: true)
        }
    }

    // ===== Directory.copy error paths =====

    @TestCase
    func test_dir_copy_source_not_exist(): Unit {
        try {
            try {
                copy(Path("/tmp/cj_nonexist_dir_copy_99999"), to: Path("/tmp/cj_branch_copy_dst_dir"))
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
        } finally {
            removeIfExists("/tmp/cj_branch_copy_dst_dir", recursive: true)
        }
    }

    @TestCase
    func test_dir_copy_dest_in_source(): Unit {
        let srcDir = "/tmp/cj_branch_copy_src_outer"
        if (exists(srcDir)) {
            remove(srcDir, recursive: true)
        }
        Directory.create(srcDir, recursive: true)
        let destDir = srcDir + "/inner"
        try {
            try {
                copy(srcDir, to: destDir, overwrite: true)
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
        } finally {
            removeIfExists(srcDir, recursive: true)
        }
    }

    // ===== Directory.createTemp =====

    @TestCase
    func test_createTemp_valid(): Unit {
        let tmpDir = Directory.createTemp("/tmp")
        @Assert(exists(tmpDir))
        remove(tmpDir, recursive: true)
        @Assert(!exists(tmpDir))
    }

    @TestCase
    func test_createTemp_nonexistent_parent(): Unit {
        try {
            try {
                let _ = Directory.createTemp("/tmp/cj_nonexist_tmp_parent_99999")
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
        } finally {}
    }

    // ===== File.createTemp =====

    @TestCase
    func test_file_createTemp_valid(): Unit {
        let f = File.createTemp("/tmp")
        @Assert(f.fileDescriptor.fileHandle > 0)
        f.write([1, 2, 3])
        f.close()
        remove(f.info.path.toString())
        @Assert(true)
    }

    // ===== FileInfo edge cases =====

    @TestCase
    func test_fileinfo_nonexistent_throws(): Unit {
        try {
            try {
                let _ = FileInfo("/tmp/cj_nonexist_fi_99999.txt")
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
        } finally {}
    }

    @TestCase
    func test_fileinfo_isRegular_isDirectory(): Unit {
        let filePath = "/tmp/cj_branch_fi_file.txt"
        let dirPath = "/tmp/cj_branch_fi_dir"
        File.writeTo(filePath, [65])
        if (!exists(dirPath)) {
            Directory.create(dirPath)
        }
        try {
            let fi = FileInfo(filePath)
            @Assert(fi.isRegular())
            @Assert(!fi.isDirectory())

            let di = FileInfo(dirPath)
            @Assert(di.isDirectory())
            @Assert(!di.isRegular())
        } finally {
            removeIfExists(filePath)
            removeIfExists(dirPath, recursive: true)
        }
    }

    @TestCase
    func test_fileinfo_size(): Unit {
        let path = "/tmp/cj_branch_fi_size.txt"
        File.writeTo(path, [65, 66, 67, 68, 69])
        try {
            let info = FileInfo(path)
            @Expect(info.size, 5)
        } finally {
            remove(path)
        }
    }

    // ===== rename error paths =====

    @TestCase
    func test_rename_same_path(): Unit {
        let path = "/tmp/cj_branch_rename_same.txt"
        File.writeTo(path, [65])
        try {
            try {
                rename(path, to: path)
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
        } finally {
            remove(path)
        }
    }

    @TestCase
    func test_rename_dest_exists_no_overwrite(): Unit {
        let src = "/tmp/cj_branch_rename_src.txt"
        let dst = "/tmp/cj_branch_rename_dst.txt"
        File.writeTo(src, [65])
        File.writeTo(dst, [66])
        try {
            try {
                rename(src, to: dst)
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
        } finally {
            removeIfExists(src)
            removeIfExists(dst)
        }
    }

    @TestCase
    func test_rename_empty_path(): Unit {
        try {
            try {
                rename("", to: "/tmp/cj_branch_rename_empty.txt")
                @Assert(false)
            } catch (e: IllegalArgumentException) {
                @Assert(true)
            }
        } finally {}
    }

    // ===== canonicalize error paths =====

    @TestCase
    func test_canonicalize_nonexistent(): Unit {
        try {
            try {
                let _ = canonicalize("/tmp/cj_nonexist_canon_99999")
                @Assert(false)
            } catch (e: FSException) {
                @Assert(true)
            }
        } finally {}
    }

    @TestCase
    func test_canonicalize_empty_path(): Unit {
        try {
            try {
                let _ = canonicalize("")
                @Assert(false)
            } catch (e: IllegalArgumentException) {
                @Assert(true)
            }
        } finally {}
    }

    // ===== OpenMode.toString =====

    @TestCase
    func test_openmode_tostring(): Unit {
        @Expect(OpenMode.Read.toString(), "Read")
        @Expect(OpenMode.Write.toString(), "Write")
        @Expect(OpenMode.Append.toString(), "Append")
        @Expect(OpenMode.ReadWrite.toString(), "ReadWrite")
    }
}

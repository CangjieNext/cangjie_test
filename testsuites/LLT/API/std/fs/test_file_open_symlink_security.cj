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
 * Security regression test for CJ-002 (CWE-59/CWE-367, symlink following /
 * TOCTOU in CJ_FS_OpenFile).
 *
 * CJ_FS_OpenFile() resolves the path with realpath() first. When realpath()
 * fails with ENOENT it falls back to the caller-supplied path and calls open()
 * directly. Before the fix that open() had no O_NOFOLLOW/O_EXCL, so a symbolic
 * link planted at the path was followed and a create operation would
 * materialize/write through the link at the attacker-chosen target.
 *
 * A dangling symbolic link makes realpath() fail with ENOENT deterministically,
 * so this test exercises the vulnerable fallback branch without relying on a
 * race window:
 *   - before the fix: open() follows the link, the create succeeds and the
 *     dangling target file is created -> the assertions below FAIL;
 *   - after the fix:  the create is rejected (O_CREAT|O_EXCL|O_NOFOLLOW) with
 *     an FSException and the target file is never created -> PASS.
 */
@Test
class FileOpenSymlinkSecurityTest {
    @TestCase
    func testCreateRejectsDanglingSymlink(): Unit {
        let base = canonicalize(Path("./")).toString()
        var checked = 0
        for (mode in [OpenMode.Write, OpenMode.ReadWrite, OpenMode.Append]) {
            let tag = mode.toString()
            let dir = "${base}/cj_symlink_sec_${tag}"
            let victim = "${dir}/upload.log"
            let target = "${dir}/payload.txt"

            if (exists(dir)) {
                remove(dir, recursive: true)
            }
            Directory.create(dir)
            SymbolicLink.create(victim, to: target)

            var followedLink = false
            try {
                let f = File(victim, mode)
                f.write("pwned".toArray())
                f.close()
                followedLink = true
            } catch (_: FSException) {}

            // The create must never go through the planted symbolic link.
            @Expect(!followedLink)
            @Expect(!exists(target))

            if (exists(dir)) {
                remove(dir, recursive: true)
            }
            checked++
        }
        @Expect(checked, 3)
    }
}

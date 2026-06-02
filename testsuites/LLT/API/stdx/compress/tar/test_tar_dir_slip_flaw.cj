/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./expected
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt %f -o %output %cmp_utest_opt
// (Unix) EXEC-PIPE: export cjHeapSize=16GB && %set_stdx_path %run %run_opt %output %run_utest_opt %run_args
// (Windows) EXEC-PIPE: (set cjHeapSize=16GB) && %set_stdx_path %run %run_opt %output %run_utest_opt %run_args

import std.unittest.*
import std.unittest.testmacro.*
import stdx.compress.tar.*
import std.fs.*

@Test
public class TarDirSlipFlawTest {

    @TestCase
    public func testTarDirSlipFlaw(): Unit {
        let base = "./poc_cwe22_tar"
        removeIfExists(base, recursive: true)

        let tmpDir     = "${base}/tmp"
        let tarFile    = "${base}/payload.tar"
        let destDir    = "${base}/dest"
        let escapeZone = "${base}/escape"

        // ================================================================
        // Phase 1 — Craft a tar with ONLY "aaa/link/pwned_dir/" entry.
        //
        // Crucially, no entries for "aaa/" or "aaa/link/" exist in the tar.
        // This means Tar.extract will never process "aaa/link" as its own
        // entry, so a pre-existing symlink at that path survives extraction.
        // ================================================================
        Directory.create(Path("${tmpDir}/d"), recursive: true)

        let outFile = File(tarFile, Write)
        var writer = TarWriter(outFile)
        writer.write(Path("${tmpDir}/d"), entryName: "aaa/link/pwned_dir")
        writer.finish()
        outFile.close()

        println("[1] tar created with single entry: 'aaa/link/pwned_dir/' (Directory)")

        // ================================================================
        // Phase 2 — Prepare the extraction target
        //
        //   dest/
        //     aaa/                        ← real directory (pre-existing)
        //       link -> ../../escape      ← symlink (NOT in the tar!)
        //   escape/                       ← outside extraction root
        // ================================================================
        Directory.create(Path("${destDir}/aaa"), recursive: true)
        Directory.create(Path(escapeZone), recursive: true)
        SymbolicLink.create(Path("${destDir}/aaa/link"), to: Path("../../escape"))

        println("[2] filesystem prepared:")
        println("    dest/aaa/          (real dir)")
        println("    dest/aaa/link -> ../../escape  (symlink, NOT in tar)")
        println("    escape/            (outside extraction root)")

        // ================================================================
        // Phase 3 — Call the real Tar.extract
        //
        //   Entry "aaa/link/pwned_dir/":
        //     tar.cj:111  normalize() = dest/aaa/link/pwned_dir → within root ✓
        //     tar.cj:127  Directory.create() follows symlink in "aaa/link"
        //                 → actually creates escape/pwned_dir/  ← ESCAPE!
        //
        //   The Directory branch (tar.cj:125-128) has NO canonicalize() check.
        //   The RegularFile branch (tar.cj:135,144) DOES have one via
        //   ensureRegularFileParentWithinDirectory().
        // ================================================================
        println("[3] calling Tar.extract(overwrite: true)...")
        try {
            Tar.extract(fromTar: tarFile, destDir: destDir, overwrite: true)
        } catch (e: Exception) {
            println("    exception: ${e}")
        }

        // ================================================================
        // Phase 4 — Verify: was a directory created outside the root?
        // ================================================================
        let escapedPath = "${escapeZone}/pwned_dir"
        let exists = exists(Path(escapedPath))
        if (exists) {
            println("")
            println("[+] ====== CWE-22 PATH TRAVERSAL CONFIRMED ======")
            println("[+] Directory created OUTSIDE extraction root:")
            println("[+]   ${escapedPath}")
            println("[+]")
            println("[+] tar.cj:111 lexical normalize() said path is within root,")
            println("[+] but OS followed symlink ancestor 'aaa/link' to escape/.")
            println("[+] Directory branch (tar.cj:125-128) lacks canonicalize().")
        } else {
            println("[-] escape did not occur: ${escapedPath}")
        }
        @Assert(exists, false)

        removeIfExists(base, recursive: true)
    }
}

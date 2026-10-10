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

const VICTIM_FILE_NAME = "victim.txt"
const VICTIM_CONTENT = "KEEP-ME-SAFE"

extend String {
    func removeIfExists() {
        if (isExists) {
            if (isDirectory) {
                remove(this, recursive: true)
            } else {
                remove(this)
            }
        }
    }

    prop isExists: Bool {
        get() { exists(this) }
    }

    prop isDirectory: Bool {
        get() { FileInfo(this).isDirectory() }
    }
}

@Test
public class TarParentSymlinkFlawTest {

    private func writeTextFile(path: String, content: String): Unit {
        let f = File(path, Write)
        f.write(content.toArray())
        f.close()
    }

    // Craft a tar whose ONLY entry is `entryName`, sourcing the bytes (or link
    // info) from `sourcePath`.
    private func makeTar(tarPath: String, sourcePath: String, entryName: String): Unit {
        let outFile = File(tarPath, Write)
        var writer = TarWriter(outFile)
        writer.write(Path(sourcePath), entryName: entryName)
        writer.finish()
        outFile.close()
    }

    /**
     * Flaw 1: overwrite:true deletion redirected by a symlinked parent.
     *
     *   dest/sub -> ../escape   (pre-existing symlink, NOT in the tar)
     *   escape/victim.txt          (pre-existing file outside the root)
     *
     * Tar entry "sub/victim.txt" (RegularFile). The removed stdx code deleted
     * dest/sub/victim.txt (== escape/victim.txt) BEFORE resolving that the
     * parent escapes the extraction root, so it removed a file OUTSIDE dest.
     */
    @TestCase
    public func testTarOverwriteDeleteThroughParentSymlink(): Unit {
        let base       = "./poc_tar_parent_symlink"
        let tmpDir     = "${base}/tmp"
        let tarFile    = "${base}/payload_delete.tar"
        let destDir    = "${base}/dest"
        let escapeZone = "${base}/escape"

        removeIfExists(base, recursive: true)

        Directory.create(Path(tmpDir), recursive: true)
        Directory.create(Path(escapeZone), recursive: true)
        Directory.create(Path(destDir), recursive: true)

        // Source for the payload entry (its name is irrelevant).
        let payload = "${tmpDir}/payload.txt"
        writeTextFile(payload, "payload-data")

        // Victim file that lives OUTSIDE the extraction root.
        let victimPath = "${escapeZone}/${VICTIM_FILE_NAME}"
        writeTextFile(victimPath, VICTIM_CONTENT)

        // symlink: dest/sub -> ../escape
        let symlinkPath = "${destDir}/sub"
        SymbolicLink.create(Path(symlinkPath), to: Path("../escape"))

        makeTar(tarFile, payload, "sub/${VICTIM_FILE_NAME}")

        println("calling Tar.extract(overwrite: true) with a symlinked parent...")
        var threw = false
        try {
            Tar.extract(fromTar: tarFile, destDir: destDir, overwrite: true)
        } catch (e: Exception) {
            threw = true
            println("  extract threw: ${e}")
        }

        let victimIntact = exists(Path(victimPath)) && File.readFrom(Path(victimPath)) == VICTIM_CONTENT.toArray()
        println("  threw=${threw} victimIntact=${victimIntact}")
        if (!victimIntact) {
            println("[+] FLAW: file outside extraction root was deleted (or modified) via parent symlink.")
        }
        // Must NOT delete/modify a file outside the extraction root.
        @Assert(victimIntact)

        removeIfExists(base, recursive: true)
    }

    /**
     * Flaw 2: link creation redirected by a symlinked parent.
     *
     *   dest/sub -> ../escape   (pre-existing symlink, NOT in the tar)
     *
     * Tar entry "sub/newlink" (Symlink). The removed stdx code only checked the
     * link *target* lexically, never the resolved *parent*, so the link was
     * created at escape/newlink — OUTSIDE dest.
     */
    @TestCase
    public func testTarSymlinkEntryThroughParentSymlink(): Unit {
        let base       = "./poc_tar_parent_symlink"
        let tmpDir     = "${base}/tmp"
        let tarFile    = "${base}/payload_symlink.tar"
        let destDir    = "${base}/dest"
        let escapeZone = "${base}/escape"

        removeIfExists(base, recursive: true)

        Directory.create(Path(tmpDir), recursive: true)
        Directory.create(Path(escapeZone), recursive: true)
        Directory.create(Path(destDir), recursive: true)

        // A real target file so the link source can be stat'ed.
        let targetFile = "${tmpDir}/target.txt"
        writeTextFile(targetFile, "target-data")

        // Source symlink to archive (its final name is irrelevant).
        let linkSource = "${tmpDir}/linksrc"
        SymbolicLink.create(Path(linkSource), to: Path("target.txt"))

        // symlink: dest/sub -> ../escape
        let symlinkPath = "${destDir}/sub"
        SymbolicLink.create(Path(symlinkPath), to: Path("../escape"))

        makeTar(tarFile, linkSource, "sub/newlink")

        println("calling Tar.extract(overwrite: true) for a Symlink entry with a symlinked parent...")
        var threw = false
        try {
            Tar.extract(fromTar: tarFile, destDir: destDir, overwrite: true)
        } catch (e: Exception) {
            threw = true
            println("  extract threw: ${e}")
        }

        let outsideLink = "${escapeZone}/newlink"
        let linkCreatedOutside = exists(Path(outsideLink))
        println("  threw=${threw} linkCreatedOutside=${linkCreatedOutside}")
        if (linkCreatedOutside) {
            println("[+] FLAW: Symlink entry was created OUTSIDE extraction root at ${outsideLink}")
        }
        // Must NOT create the link outside the extraction root.
        @Assert(!linkCreatedOutside)

        removeIfExists(base, recursive: true)
    }
}
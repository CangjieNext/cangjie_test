/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (Unix) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Unix) EXEC: %touch target_file && %mkdir target_dir && %lnfile target_file link_file && %lnfile target_dir link_dir && %lnfile link_file link_chain && %lnfile target_file .hidden_link && %lnfile missing_target broken_link
// (Unix) EXEC: %run %run_opt %output %run_utest_opt
// (Unix) EXEC: rm -rf target_file target_dir link_file link_dir link_chain .hidden_link broken_link

import std.fs.*

@Test
class TestFileInfoFollowSymlinkUnix {
    @TestCase
    func testDefaultFollowsSymbolicLinkTarget(): Unit {
        File.writeTo("target_file", [1u8, 2u8, 3u8, 4u8])

        let fileLink = FileInfo("link_file")
        @Expect(fileLink.isSymbolicLink(), false)
        @Expect(fileLink.isRegular(), true)
        @Expect(fileLink.isDirectory(), false)
        @Expect(fileLink.size, FileInfo("target_file").size)

        let dirLink = FileInfo("link_dir")
        @Expect(dirLink.isSymbolicLink(), false)
        @Expect(dirLink.isRegular(), false)
        @Expect(dirLink.isDirectory(), true)

        let chain = FileInfo("link_chain")
        @Expect(chain.isSymbolicLink(), false)
        @Expect(chain.isRegular(), true)
    }

    @TestCase
    func testNoFollowQueriesSymbolicLinkItself(): Unit {
        File.writeTo("target_file", [1u8, 2u8, 3u8, 4u8])

        let fileLink = FileInfo("link_file", followSymlink: false)
        @Expect(fileLink.isSymbolicLink(), true)
        @Expect(fileLink.isRegular(), false)
        @Expect(fileLink.isDirectory(), false)
        @Expect(fileLink.size != FileInfo("target_file").size, true)

        let dirLink = FileInfo("link_dir", followSymlink: false)
        @Expect(dirLink.isSymbolicLink(), true)
        @Expect(dirLink.isRegular(), false)
        @Expect(dirLink.isDirectory(), false)
    }

    @TestCase
    func testPathConstructorsUseSameFollowSemantics(): Unit {
        File.writeTo("target_file", [1u8, 2u8, 3u8, 4u8])

        let fileLink = FileInfo(Path("link_file"))
        @Expect(fileLink.isSymbolicLink(), false)
        @Expect(fileLink.isRegular(), true)
        @Expect(fileLink.size, FileInfo(Path("target_file")).size)

        let selfLink = FileInfo(Path("link_file"), followSymlink: false)
        @Expect(selfLink.isSymbolicLink(), true)
        @Expect(selfLink.isRegular(), false)
        @Expect(selfLink.size != FileInfo(Path("target_file")).size, true)
        @Expect(selfLink.path.fileName, "link_file")

        @Expect(FileInfo(Path(".hidden_link")).isHidden(), false)
        @Expect(FileInfo(Path(".hidden_link"), followSymlink: false).isHidden(), true)
    }

    @TestCase
    func testHiddenNameFollowsSelectedSubject(): Unit {
        @Expect(FileInfo(".hidden_link").isHidden(), false)
        @Expect(FileInfo(".hidden_link", followSymlink: false).isHidden(), true)
    }

    @TestCase
    func testDanglingSymlinkCanBeQueriedWithoutFollowing(): Unit {
        let broken = FileInfo("broken_link", followSymlink: false)
        @Expect(broken.path.fileName, "broken_link")
        @Expect(broken.isSymbolicLink(), true)
        @Expect(broken.isRegular(), false)
        @Expect(broken.isDirectory(), false)
        @Expect(broken.size > 0, true)
        @Expect(broken.isHidden(), false)
        @Expect(broken.isReadOnly(), false)
        @Expect(broken.canRead(), true)
        @Expect(broken.canWrite(), true)
        @Expect(broken.canExecute(), true)
        @Expect(broken.creationTime, broken.creationTime)
        @Expect(broken.lastAccessTime, broken.lastAccessTime)
        @Expect(broken.lastModificationTime, broken.lastModificationTime)

        @ExpectThrows[FSException](FileInfo("broken_link").isRegular())
    }

    @TestCase
    func testDanglingSymlinkQueryFailuresWhenFollowing(): Unit {
        @ExpectThrows[FSException](FileInfo("broken_link").isSymbolicLink())
        @ExpectThrows[FSException](FileInfo("broken_link").isRegular())
        @ExpectThrows[FSException](FileInfo("broken_link").isDirectory())
        @ExpectThrows[FSException](FileInfo("broken_link").isReadOnly())
        @ExpectThrows[FSException](FileInfo("broken_link").isHidden())
        @ExpectThrows[FSException](FileInfo("broken_link").canRead())
        @ExpectThrows[FSException](FileInfo("broken_link").canWrite())
        @ExpectThrows[FSException](FileInfo("broken_link").canExecute())
        @ExpectThrows[FSException](FileInfo("broken_link").size)
        @ExpectThrows[FSException](FileInfo("broken_link").creationTime)
        @ExpectThrows[FSException](FileInfo("broken_link").lastAccessTime)
        @ExpectThrows[FSException](FileInfo("broken_link").lastModificationTime)
    }

    @TestCase
    func testDefaultTimeQueriesFollowTarget(): Unit {
        let linkInfo = FileInfo("link_file")
        let targetInfo = FileInfo("target_file")
        @Expect(linkInfo.creationTime, targetInfo.creationTime)
        @Expect(linkInfo.lastAccessTime, targetInfo.lastAccessTime)
        @Expect(linkInfo.lastModificationTime, targetInfo.lastModificationTime)
    }

    @TestCase
    func testDefaultPermissionQueriesFollowTarget(): Unit {
        let targetInfo = FileInfo("target_file")
        let defaultLinkInfo = FileInfo("link_file")
        let selfLinkInfo = FileInfo("link_file", followSymlink: false)

        targetInfo.setReadable(true)
        targetInfo.setWritable(true)
        targetInfo.setExecutable(true)

        targetInfo.setExecutable(false)
        @Expect(defaultLinkInfo.canExecute(), false)
        @Expect(selfLinkInfo.canExecute(), true)
        targetInfo.setExecutable(true)

        targetInfo.setWritable(false)
        @Expect(defaultLinkInfo.canWrite(), false)
        @Expect(selfLinkInfo.canWrite(), true)

        targetInfo.setExecutable(false)
        @Expect(defaultLinkInfo.isReadOnly(), true)
        @Expect(selfLinkInfo.isReadOnly(), false)
        targetInfo.setExecutable(true)
        targetInfo.setWritable(true)

        targetInfo.setReadable(false)
        @Expect(defaultLinkInfo.canRead(), false)
        @Expect(selfLinkInfo.canRead(), true)
        targetInfo.setReadable(true)
    }

    @TestCase
    func testPermissionSettersOnSymlinkDoNotMutateTarget(): Unit {
        let targetInfo = FileInfo("target_file")
        let linkInfo = FileInfo("link_file", followSymlink: false)

        targetInfo.setReadable(true)
        targetInfo.setWritable(true)
        targetInfo.setExecutable(true)

        @Expect(linkInfo.setReadable(false), true)
        @Expect(linkInfo.setWritable(false), true)
        @Expect(linkInfo.setExecutable(false), true)

        @Expect(targetInfo.canRead(), true)
        @Expect(targetInfo.canWrite(), true)
        @Expect(targetInfo.canExecute(), true)
    }
}

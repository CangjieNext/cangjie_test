/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (CJNATIVE and Linux) EXEC: %compiler %cmp_opt %f -o %output %run_args 2>&1 | compare %f
// (CJNATIVE and Linux) RUN-EXEC-PIPE-0: %run %run_opt %output
// ASSERT: scan function 'getpid' is deprecated.
// ASSERT: scan function 'open' is deprecated.
// ASSERT: scan function 'open' is deprecated.
// ASSERT: scan function 'access' is deprecated.
// ASSERT: scan function 'chdir' is deprecated.
// ASSERT: scan function 'chmod' is deprecated.
// ASSERT: scan function 'chown' is deprecated.
// ASSERT: scan function 'close' is deprecated.
// ASSERT: scan function 'creat' is deprecated.
// ASSERT: scan function 'dup' is deprecated.
// ASSERT: scan function 'dup2' is deprecated.
// ASSERT: scan function 'faccessat' is deprecated.
// ASSERT: scan function 'fchdir' is deprecated.
// ASSERT: scan function 'fchmod' is deprecated.
// ASSERT: scan function 'fchmodat' is deprecated.
// ASSERT: scan function 'fchown' is deprecated.
// ASSERT: scan function 'fchownat' is deprecated.
// ASSERT: scan function 'getcwd' is deprecated.
// ASSERT: scan function 'getgid' is deprecated.
// ASSERT: scan function 'gethostname' is deprecated.
// ASSERT: scan function 'getlogin' is deprecated.
// ASSERT: scan function 'getos' is deprecated.
// ASSERT: scan function 'getpgid' is deprecated.
// ASSERT: scan function 'getpgrp' is deprecated.
// ASSERT: scan function 'getpid' is deprecated.
// ASSERT: scan function 'getuid' is deprecated.
// ASSERT: scan function 'isBlk' is deprecated.
// ASSERT: scan function 'isChr' is deprecated.
// ASSERT: scan function 'isDir' is deprecated.
// ASSERT: scan function 'isFIFO' is deprecated.
// ASSERT: scan function 'isLnk' is deprecated.
// ASSERT: scan function 'isReg' is deprecated.
// ASSERT: scan function 'isSock' is deprecated.
// ASSERT: scan function 'isType' is deprecated.
// ASSERT: scan function 'isatty' is deprecated.
// ASSERT: scan function 'kill' is deprecated.
// ASSERT: scan function 'killpg' is deprecated.
// ASSERT: scan function 'lchown' is deprecated.
// ASSERT: scan function 'link' is deprecated.
// ASSERT: scan function 'linkat' is deprecated.
// ASSERT: scan function 'lseek' is deprecated.
// ASSERT: scan function 'nice' is deprecated.
// ASSERT: scan function 'open64' is deprecated.
// ASSERT: scan function 'open64' is deprecated.
// ASSERT: scan function 'openat' is deprecated.
// ASSERT: scan function 'openat' is deprecated.
// ASSERT: scan function 'openat64' is deprecated.
// ASSERT: scan function 'pwrite' is deprecated.
// ASSERT: scan function 'pread' is deprecated.
// ASSERT: scan function 'read' is deprecated.
// ASSERT: scan function 'remove' is deprecated.
// ASSERT: scan function 'rename' is deprecated.
// ASSERT: scan function 'renameat' is deprecated.
// ASSERT: scan function 'setgid' is deprecated.
// ASSERT: scan function 'sethostname' is deprecated.
// ASSERT: scan function 'setpgid' is deprecated.
// ASSERT: scan function 'setpgrp' is deprecated.
// ASSERT: scan function 'setuid' is deprecated.
// ASSERT: scan function 'symlink' is deprecated.
// ASSERT: scan function 'symlinkat' is deprecated.
// ASSERT: scan function 'ttyname' is deprecated.

// ASSERT: scan function 'umask' is deprecated.
// ASSERT: scan function 'unlink' is deprecated.
// ASSERT: scan function 'unlinkat' is deprecated.
// ASSERT: scan function 'write' is deprecated.

import std.posix.*
import std.process.*
import std.math.*

main() {
    getpid()
    var deprecated1 = `open`("textcase.txt", O_RDWR)
    var deprecated2 = `open`("textcase.txt", O_RDWR, 12)
    access("file.txt", W_OK)
    chdir("file.txt")
    chmod("prefix + s1", UInt32(S_IRUSR))
    chown("prefix + s1", UInt32(S_IRUSR), UInt32(S_IRUSR))
    close(111)
    creat("prefix + s1", 111)
    dup(111)
    dup2(111, 123)
    faccessat(111, "prefix + s1", 12, 13)
    fchdir(111)
    fchmod(111, 123)
    fchmodat(111, "prefix + s1", 12, 13)
    fchown(111, 12, 13)
    fchownat(111, "prefix + s1", 12, 13, 1)
    getcwd()
    getgid()
    gethostname()
    getlogin()
    getos()
    getpgid(12)
    getpgrp()
    getpid()
    getuid()
    isBlk("123")
    isChr("123")
    isDir("123")
    isFIFO("123")
    isLnk("123")
    isReg("123")
    isSock("123")
    isType("123", 1)
    isatty(123)
    kill(123, 1)
    killpg(123, 1)
    lchown("prefix + s1", 111, 1)
    link("prefix + s1", "111,1")
    linkat(1, "prefix + s1", 2, "111,1", 3)
    lseek(1, 2, 3)
    nice(1)
    open64("123", 1)
    open64("123", 1, 2)
    openat(1, "123", 2)
    var op = openat(1, "123", 1, 2)
    var op1 = openat64(1, "123", 1)
    var buf = unsafe { LibC.mallocCString("123456") }
    var writeNum = unsafe { pwrite(1, buf.getChars(), 2, 0) }
    var readNum = unsafe { pread(1, buf.getChars(), 2, 0) }
    var read = unsafe { read(1, buf.getChars(), 2) }
    var move = remove("123")
    var name = rename("123", "456")
    var meat = renameat(1, "123", 2, "456")
    var gid = setgid(1)
    var set = sethostname("123")
    var set1 = setpgid(1, 2)
    var set2 = setpgrp()
    var set3 = setuid(1)
    var sy = symlink("11", "2")
    var sy1 = symlinkat("11", 3, "2")
    var tt = ttyname(3)
    var ask = umask(3)
    var un = unlink("1")
    var un1 = unlinkat(3, "1", 1)
    var wr = unsafe { write(3, buf.getChars(), 1) }
}

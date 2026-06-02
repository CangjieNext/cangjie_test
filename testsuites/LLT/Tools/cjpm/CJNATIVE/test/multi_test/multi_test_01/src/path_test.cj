// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package b

internal import std.unittest.*
import std.unittest.testmacro.*

struct PathTest {
    PathTest(let path: String, let result: String) {}
}

var cleantests: Array<PathTest> = [
    PathTest("", "."),
    PathTest("abc", "abc"),
    PathTest("abc/def", "abc/def"),
    PathTest("a/b/c", "a/b/c"),
    PathTest(".", "."),
    PathTest("..", ".."),
    PathTest("../..", "../.."),
    PathTest("../../abc", "../../abc"),
    PathTest("/abc", "/abc"),
    PathTest("/", "/"),
    PathTest("abc/", "abc"),
    PathTest("abc/def/", "abc/def"),
    PathTest("a/b/c/", "a/b/c"),
    PathTest("./", "."),
    PathTest("../../", "../.."),
    PathTest("/abc/", "/abc"),
    PathTest("abc//def//ghi", "abc/def/ghi"),
    PathTest("//abc", "/abc"),
    PathTest("///abc", "/abc"),
    PathTest("//abc//", "/abc"),
    PathTest("abc//", "abc"),
    PathTest("abc/./def", "abc/def"),
    PathTest("/./abc/def", "/abc/def"),
    PathTest("abc/.", "abc"),
    PathTest("abc/def/ghi/../jkl", "abc/def/jkl"),
    PathTest("abc/def/../ghi/../jkl", "abc/jkl"),
    PathTest("abc/def/..", "abc"),
    PathTest("abc/def/../..", "."),
    PathTest("/abc/def/../..", "/"),
    PathTest("abc/def/../../..", ".."),
    PathTest("/abc/def/../../..", "/"),
    PathTest("abc/def/../../../ghi/jkl/../../../mno", "../../mno"),
    PathTest("abc/./../def", "def"),
    PathTest("abc//./../def", "def"),
    PathTest("abc/../../././../def", "../../def")
]

@Test
func TestClean(): Unit {
    for (test in cleantests) {
        let s = Clean(test.path)
        let r = Clean(test.result)
        @Assert(s, test.result)
        @Assert(r, test.result)
        // if (s != test.result) {
        //     println("Clean(${test.path}) = ${s}, want ${test.result}")
        //     return
        // }
        // if (r != test.result) {
        //     println("Clean(${test.path}) = ${r}, want ${test.result}")
        //     return
        // }
    }
}

struct SplitTest {
    SplitTest(let path: String, let dir: String, let file: String) {}
}

let splittests: Array<SplitTest> = [
    SplitTest("a/b", "a/", "b"),
    SplitTest("a/b/", "a/b/", ""),
    SplitTest("a/", "a/", ""),
    SplitTest("a", "", "a"),
    SplitTest("/", "/", "")
]

@Test
func TestSplit(): Unit {
    for (test in splittests) {
        let (d, f) = Split(test.path)
        @Assert(d, test.dir)
        @Assert(f, test.file)
        // if (d != test.dir || f != test.file) {
        //     println("Split(${test.path}) = ${d}, ${f}, want ${test.dir}, ${test.file}")
        //     return
        // }
    }
}

struct JoinTest {
    JoinTest(let elem: Array<String>, let path: String) {}
}

var jointests: Array<JoinTest> = [
    JoinTest(Array<String>(), ""),
    JoinTest([""], ""),
    JoinTest(["a"], "a"),
    JoinTest(["a", "b"], "a/b"),
    JoinTest(["a", ""], "a"),
    JoinTest(["", "b"], "b"),
    JoinTest(["/", "a"], "/a"),
    JoinTest(["/", ""], "/"),
    JoinTest(["a/", "b"], "a/b"),
    JoinTest(["a/", ""], "a"),
    JoinTest(["", ""], "")
]

@Test
func TestJoin(): Unit {
    for (test in jointests) {
        let p = Join(test.elem)
        @Assert(p, test.path)
        // if (p != test.path) {
        //     println("Join(${test.elem}) = ${p}, want ${test.path}")
        //     return
        // }
    }
}

struct ExtTest {
    ExtTest(let path: String, let ext: String) {}
}

var exttests: Array<ExtTest> = [
    ExtTest("path.go", ".go"),
    ExtTest("path.pb.go", ".go"),
    ExtTest("a.dir/b", ""),
    ExtTest("a.dir/b.go", ".go"),
    ExtTest("a.dir/", "")
]

@Test
func TestExt(): Unit {
    for (test in exttests) {
        let x = Ext(test.path)
        @Assert(x, test.ext)
        // if (x != test.ext) {
        //     println("Ext(${test.path}) = ${x}, want ${test.ext}")
        //     return
        // }
    }
}

var basetests: Array<PathTest> = [
    PathTest("", "."),
    PathTest(".", "."),
    PathTest("/.", "."),
    PathTest("/", "/"),
    PathTest("////", "/"),
    PathTest("x/", "x"),
    PathTest("abc", "abc"),
    PathTest("abc/def", "def"),
    PathTest("a/b/.x", ".x"),
    PathTest("a/b/c.", "c."),
    PathTest("a/b/c.x", "c.x")
]

@Test
func TestBase(): Unit {
    for (test in basetests) {
        let s = Base(test.path)
        @Assert(s, test.result)
        // if (s != test.result) {
        //     println("Base(${test.path}) = s, want ${test.result}")
        //     return
        // }
    }
}

let dirtests: Array<PathTest> = [
    PathTest("", "."),
    PathTest(".", "."),
    PathTest("/.", "/"),
    PathTest("/", "/"),
    PathTest("////", "/"),
    PathTest("/foo", "/"),
    PathTest("x/", "x"),
    PathTest("abc", "."),
    PathTest("abc/def", "abc"),
    PathTest("abc////def", "abc"),
    PathTest("a/b/.x", "a/b"),
    PathTest("a/b/c.", "a/b"),
    PathTest("a/b/c.x", "a/b")
]

@Test
func TestDir(): Unit {
    for (test in dirtests) {
        let s = Dir(test.path)
        @Assert(s, test.result)
        // if (s != test.result) {
        //     println("Base(${test.path}) = s, want ${test.result}")
        //     return
        // }
    }
}

struct IsAbsTest {
    IsAbsTest(let path: String, let isAbs: Bool) {}
}

let isAbsTests: Array<IsAbsTest> = [
    IsAbsTest("", false),
    IsAbsTest("/", true),
    IsAbsTest("/usr/bin/gcc", true),
    IsAbsTest("..", false),
    IsAbsTest("/a/../bb", true),
    IsAbsTest(".", false),
    IsAbsTest("./", false),
    IsAbsTest("lala", false)
]

@Test
func TestIsAbs(): Unit {
    for (test in isAbsTests) {
        let r = IsAbs(test.path)
        @Assert(r, test.isAbs)
        // if (r != test.isAbs) {
        //     println("IsAbs(${test.path}) = ${r}, want ${test.isAbs}")
        //     return
        // }
    }
}

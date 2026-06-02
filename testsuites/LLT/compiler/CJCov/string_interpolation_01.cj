// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

var a = 1
var b = 234

func test1() {
    "abc"
    "def"
}

func test2() {
    "abc${a}"
    "${a}def"
}

func test3() {
    "${a}abc${b}"
        + "${a}abc${b}"
        + "${a}abc${b}"
}

func test4() {
    """
${a}
${b}
abc
"""
    """
  	  ${
        b;
        a;
        "1"
    }
  	   ${
        a;
        b;
        "234"
    }    ${a}
  	  def
"""
}

func test5() {
    "abc"
    var d = 1
    "def${d}"
}

func test6() {
    "abc${a}"
    """
${
        "1"
        "234"
    }"""
}

func test7() {
    """
${a}
   ${b}"""
}

func test8() {
    """
${a}

   ${b}  """
}

func test9() {
    """
    ${a}

    ${b}
 """
}

func test10() {
    """
    1
	2
"""
}

func run(): Int64 {
    var tmp1 = "def"
    var tmp2 = "1def"
    var tmp3 = "1abc2341abc2341abc234"
    var tmp4 = """
  	  1
  	   234    1
  	  def
"""

    var tmp5 = "def1"
    var tmp6 = "234"
    var tmp7 = "1\n   234"
    var tmp8 = "1\n\n   234  "
    var tmp9 = "    1\n\n    234\n "
    var tmp10 = "    1\n	2\n"
    if (test1() == tmp1 && test2() == tmp2 && test3() == tmp3 && test4() == tmp4 && test5() == tmp5 && test6() == tmp6 &&
        test7() == tmp7 && test8() == tmp8 && test9() == tmp9 && test10() == tmp10) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}

// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

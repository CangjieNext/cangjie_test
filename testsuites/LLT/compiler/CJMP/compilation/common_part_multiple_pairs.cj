// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Several parent source sets of one package pass several '.cjo'/'.chir' pairs. The pair matching must not
// depend on the order of the arguments, and one '.chir' input must not serve two '.cjo' files.

// ASSERT: scan-not Internal Compiler Error

// SEPARATE-FILE: a/a.cj
// EXEC-0: %compiler %noColor --experimental a/a.cj --output-type=chir --output-dir ./a
package demo

public common func fromA(): Int64 { 1 }

// SEPARATE-FILE: b/b.cj
// EXEC-0: %compiler %noColor --experimental b/b.cj --output-type=chir --output-dir ./b
package demo

public common func fromB(): Int64 { 2 }

// The pairs are passed in crossed order: the '.cjo' of 'a' with the '.chir' of 'b' and the other way round.
// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj --common-part-cjo=a/demo.cjo --common-part-cjo=b/demo.cjo --common-part-chir=b/demo.chir --common-part-chir=a/demo.chir -o %output
package demo

main() {
    println(fromA() + fromB())
}

// EXEC-PIPE-0: %run %output 2>&1 | compare %f
/* SCAN
3
*/

// One '.chir' input passed twice can not serve two '.cjo' files: the second cjo has no matching input left.
// SEPARATE-FILE: p2/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p2/p.cj --common-part-cjo=a/demo.cjo --common-part-cjo=b/demo.cjo --common-part-chir=a/demo.chir --common-part-chir=a/demo.chir --output-type=staticlib --output-dir ./p2 2>&1 | compare %f
/* SCAN-IN
error: common part cjo file '
*/
/* SCAN-IN
does not match any common part chir file passed with '--common-part-chir'
*/
/* SCAN-IN
note: the '.cjo' and '.chir' must come from the same common part compilation
*/
/* SCAN-IN
1 error generated, 1 error printed.
*/
package demo

main() {
    println(fromA() + fromB())
}

// Two identical CJO inputs require two matching CHIR inputs. The digest of 'a' must be consumed only once.
// SEPARATE-FILE: p3/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p3/p.cj --common-part-cjo=a/demo.cjo --common-part-cjo=a/demo.cjo --common-part-chir=a/demo.chir --common-part-chir=b/demo.chir --output-type=staticlib --output-dir ./p3 2>&1 | compare %f
/* SCAN-IN
error: common part cjo file '
*/
/* SCAN-IN
does not match any common part chir file passed with '--common-part-chir'
*/
/* SCAN-IN
note: the '.cjo' and '.chir' must come from the same common part compilation
*/
/* SCAN-IN
1 error generated, 1 error printed.
*/
package demo

main() {}

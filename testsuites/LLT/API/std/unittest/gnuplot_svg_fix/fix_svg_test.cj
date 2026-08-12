/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Unit tests for `fixGnuplotSvg`, the post-processing workaround for gnuplot
// 6.0's invalid SVG output. The helper is a `protected` (module-visible)
// function of `std.unittest`, so this test package declares a `std.*` package
// name to land in the same module and reach it directly (mirrors the
// `std.bench_stat_test` / `std.mock_test_util` technique).
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-0: %run %run_opt %output %run_utest_opt %run_args --no-color

package std.gnuplot_svg_test

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*

@Test
public class FixGnuplotSvgTest {

    // A minimal SVG reproducing the gnuplot 6.0 bug: the CDATA-wrapped
    // <script> contains the literal "]]>" (inside a replaceAll call), which
    // prematurely closes the CDATA so the later "<" comparison operator would
    // be parsed as XML markup.
    func brokenSvg(): String {
        """
<?xml version="1.0" encoding="utf-8"?>
<svg xmlns="http://www.w3.org/2000/svg">
<script type="text/javascript"><![CDATA[
var s = "".replaceAll("]]>", "");
for (i = 0; i < n; i++) {}
]]></script>
</svg>"""
    }

    @TestCase
    func fixesBrokenCdata(): Unit {
        let f = File.createTemp(Path("."))
        let p = f.info.path
        f.write(brokenSvg().toArray())
        f.close()

        fixGnuplotSvg(p)

        let fixed = String.fromUtf8(File.readFrom(p))
        // the bogus JS string literal has been rewritten ...
        @Expect(!fixed.contains("replaceAll(\"]]>\", \"\")"))
        @Expect(fixed.contains("replaceAll(\"]]\" + \">\", \"\")"))
        // ... and the JS body (incl. the "<" operator) survives intact
        @Expect(fixed.contains("for (i = 0; i < n; i++) {}"))
        remove(p)
    }

    @TestCase
    func noOpWhenBugAbsent(): Unit {
        let valid = """
<?xml version="1.0" encoding="utf-8"?>
<svg xmlns="http://www.w3.org/2000/svg">
<script type="text/javascript"><![CDATA[
var s = "no bug here";
]]></script>
</svg>"""
        let f = File.createTemp(Path("."))
        let p = f.info.path
        f.write(valid.toArray())
        f.close()

        fixGnuplotSvg(p)

        let result = String.fromUtf8(File.readFrom(p))
        @Expect(result == valid)
        remove(p)
    }

    @TestCase
    func noOpWhenFileMissing(): Unit {
        let missing = Path("./gnuplot_svg_fix_missing_file")
        fixGnuplotSvg(missing)
        @Expect(!exists(missing))
    }
}

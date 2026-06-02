// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args | compare %f

import std.unittest.*
import std.unittest.testmacro.*

@Test
public class Yaml_Decode {
    @TestCase
    func yaml_Decode07(): Unit {
        var expect = ##"[{"name":"Spec Example 2.25. Unordered Sets","from":"http://www.yaml.org/spec/1.2/spec.html#id2761758","tags":"spec mapping unknown-tag explicit-key","yaml":"# Sets are represented as a\n# Mapping where each key is\n# associated with a null value\n--- !!set\n? Mark McGwire\n? Sammy Sosa\n? Ken Griff\n","tree":"+STR\n +DOC ---\n +MAP <tag:yaml.org,2002:set>\n =VAL :Mark McGwire\n =VAL :\n =VAL :Sammy Sosa\n =VAL :\n =VAL :Ken Griff\n =VAL :\n -MAP\n -DOC\n-STR\n","json":"{\n \"Mark McGwire\": null,\n \"Sammy Sosa\": null,\n \"Ken Griff\": null\n}\n","dump":"--- !!set\nMark McGwire:\nSammy Sosa:\nKen Griff:\n"}]"##
    }
}

/* SCAN-IN
    [32mPASSED[0m: 1, [32mSKIPPED[0m: 0, ERROR: 0
 */

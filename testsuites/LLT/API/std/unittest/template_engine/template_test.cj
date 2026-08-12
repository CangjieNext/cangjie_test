/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Tests for the internal template engine (`substituteTemplate`) used to render
// HTML/CSV benchmark and test reports. The engine is a `protected` (module-
// visible) function of `std.unittest`, so this test package deliberately
// declares a `std.*` name (`std.template_test`) to land in the same module and
// reach it directly; JSON values are built via the public `JsonValue.fromStr`
// parser. See new_bench/stats/sample_test.cj for the same-module rationale.
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-0: %run %run_opt %output %run_utest_opt %run_args --no-color

package std.template_test

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

@Test
public class TemplateEngineTest {
    // $placeholder -> scalar field value.
    @TestCase
    func simplePlaceholder(): Unit {
        let values = JsonValue.fromStr("{\"name\":\"world\"}")
        @Expect(substituteTemplate("Hello, $name!", values), "Hello, world!")
    }

    // Several independent placeholders in one template.
    @TestCase
    func multiplePlaceholders(): Unit {
        let values = JsonValue.fromStr("{\"a\":1,\"b\":2,\"c\":3}")
        @Expect(substituteTemplate("$a + $b = $c", values), "1 + 2 = 3")
    }

    // No placeholders -> text passes through verbatim.
    @TestCase
    func textWithoutPlaceholdersUnchanged(): Unit {
        let values = JsonValue.fromStr("{}")
        @Expect(substituteTemplate("plain text", values), "plain text")
    }

    // A null JSON value collapses the whole template to an empty string.
    @TestCase
    func nullValueReturnsEmptyString(): Unit {
        @Expect(substituteTemplate("v: $x", JsonValue.fromStr("null")), "")
    }

    // Named subtemplate {{Type\n<body>}} referenced via $field:Type.
    @TestCase
    func namedSubtemplateReference(): Unit {
        let template = "{{Item\n- $name}}Items:\n$item:Item"
        let values = JsonValue.fromStr("{\"item\":{\"name\":\"foo\"}}")
        @Expect(substituteTemplate(template, values), "Items:\n- foo")
    }

    // {! ... !} repeats over a struct-of-arrays field (SoA): $field indexes the
    // array stored under that field.
    @TestCase
    func repetitionOverStructOfArrays(): Unit {
        let values = JsonValue.fromStr("{\"names\":[\"a\",\"b\"]}")
        @Expect(substituteTemplate("{!$names !}", values), "a b ")
    }

    // {! ... !} over a top-level array-of-structs (AoS): $field indexes the
    // struct at arr[i] and reads its field. Exercises the AoS branch of
    // getIndexed (previously dead: it cast Option<JsonValue> to JsonObject,
    // which yields None in Cangjie, so this returned "").
    @TestCase
    func repetitionOverArrayOfStructs(): Unit {
        let values = JsonValue.fromStr("[{\"name\":\"a\"},{\"name\":\"b\"}]")
        @Expect(substituteTemplate("{!$name !}", values), "a b ")
    }

    // {! ... !} zips several array fields together, stopping when any array
    // is exhausted.
    @TestCase
    func repetitionZipsMultipleArrayFields(): Unit {
        let values = JsonValue.fromStr("{\"names\":[\"a\",\"b\"],\"vals\":[1,2]}")
        @Expect(substituteTemplate("{!$names=$vals !}", values), "a=1 b=2 ")
    }

    // An empty array drives zero repetitions -> empty output.
    @TestCase
    func emptyArrayRepetitionProducesEmptyString(): Unit {
        @Expect(substituteTemplate("{!$name !}", JsonValue.fromStr("[]")), "")
    }

    // A subtemplate can be applied to each element within a repetition.
    @TestCase
    func subtemplateInsideRepetition(): Unit {
        let template = "{{Item\n[$name]}}{!$item:Item !}"
        let values = JsonValue.fromStr("{\"item\":[{\"name\":\"a\"},{\"name\":\"b\"}]}")
        @Expect(substituteTemplate(template, values), "[a] [b] ")
    }

    // Referencing an undefined subtemplate yields an explicit error marker.
    @TestCase
    func missingSubtemplateProducesError(): Unit {
        let values = JsonValue.fromStr("{\"x\":\"foo\"}")
        @Expect(substituteTemplate("$x:Missing", values), "<Error: subtemplate \"Missing\" not found.>")
    }
}

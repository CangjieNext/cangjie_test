/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt --no-color

import std.unittest.common.*

@Test
func testPretty(): Unit {
    let buffer = PrettyText("Hello")
    buffer.append(" world")
    @Expect(buffer.toString(), "Hello world")

    buffer.appendLine("")

    buffer.appendLine("Lorem ipsum,")
    buffer.indent {
        buffer.appendLine("dolor sit amet,")
        buffer.appendLine("consectetur adipiscing elit.")
        buffer.indent {
            buffer.appendLine("Donec molestie,")
            buffer.appendLine("diam non ornare efficitur.")
        }
        buffer.appendLine("Lorem ipsum dolor sit amet,")
        buffer.appendLine("consectetur adipiscing elit.")
    }

    let expected = """
Hello world
Lorem ipsum,
    dolor sit amet,
    consectetur adipiscing elit.
        Donec molestie,
        diam non ornare efficitur.
    Lorem ipsum dolor sit amet,
    consectetur adipiscing elit.
"""

    @Expect(expected, buffer.toString())

    let buffer2 = PrettyText("As a man once said, ")
    buffer2.indent(2) {
        buffer2.append(buffer)
    }
    buffer2.appendLine("and so it goes")

    let expected2 = """
As a man once said, Hello world
        Lorem ipsum,
            dolor sit amet,
            consectetur adipiscing elit.
                Donec molestie,
                diam non ornare efficitur.
            Lorem ipsum dolor sit amet,
            consectetur adipiscing elit.
and so it goes
"""
    @Expect(expected2, buffer2.toString())
}

class TestPrettyPrinter <: PrettyPrinter & ToString {
    private let data: StringBuilder = StringBuilder()

    protected override func put(s: String): Unit {
        data.append(s)
    }
    protected override func setColor(color: Color): Unit {
        match (color) {
            case RED => data.append("<red>")
            case GREEN => data.append("<green>")
            case YELLOW => data.append("<yellow>")
            case BLUE => data.append("<blue>")
            case CYAN => data.append("<cyan>")
            case MAGENTA => data.append("<magenta>")
            case GRAY => data.append("<gray>")
            case DEFAULT_COLOR => data.append("<no color>")
        }
    }

    public override func toString() {
        data.toString()
    }
}

@Test
func testPrettyColors(): Unit {
    let buffer = TestPrettyPrinter()
    buffer.indent {
        buffer.appendLine("TODO List:")
        buffer.colored(GREEN) {
            buffer.indent {
                buffer.appendLine("- Buy groceries")
                buffer.appendLine("- Do housework")
                buffer.colored(RED) {
                    buffer.appendLine("- Take out garbage")
                }
                buffer.colored(YELLOW) {
                    buffer.appendLine("- Walk the dog")
                }
                buffer.appendLine("- etc.")
            }
        }
        buffer.appendLine("...")
    }

    let expected = """
TODO List:
<green>        - Buy groceries
        - Do housework
<red>        - Take out garbage
<green><yellow>        - Walk the dog
<green>        - etc.
<no color>    ...
"""
    @Expect(expected, buffer.toString())
}

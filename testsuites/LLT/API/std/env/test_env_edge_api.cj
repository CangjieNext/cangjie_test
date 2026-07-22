/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt


import std.env.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class EnvEdgeApiTest {
    @TestCase
    func test_get_variable_existing(): Unit {
        // Set a var first, then get it
        setVariable("CJ_TEST_VAR_12345", "hello")
        let val = getVariable("CJ_TEST_VAR_12345")
        match (val) {
            case Some(v) => @Expect(v, "hello")
            case None => @Assert(false)
        }
        removeVariable("CJ_TEST_VAR_12345")
    }

    @TestCase
    func test_get_variable_nonexistent(): Unit {
        let val = getVariable("CJ_NONEXISTENT_VAR_99999")
        match (val) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    @TestCase
    func test_get_variable_null_byte(): Unit {
        try {
            getVariable("bad\0key")
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_set_variable_null_byte_key(): Unit {
        try {
            setVariable("bad\0key", "value")
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_set_variable_null_byte_value(): Unit {
        try {
            setVariable("okkey", "bad\0value")
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_remove_variable_null_byte(): Unit {
        try {
            removeVariable("bad\0key")
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(true)
        }
    }

    @TestCase
    func test_set_and_remove_variable(): Unit {
        setVariable("CJ_TEST_REMOVE_123", "testval")
        @Assert(getVariable("CJ_TEST_REMOVE_123").isSome())
        removeVariable("CJ_TEST_REMOVE_123")
        @Assert(getVariable("CJ_TEST_REMOVE_123").isNone())
    }

    @TestCase
    func test_get_process_id(): Unit {
        let pid = getProcessId()
        @Assert(pid > 0)
    }

    @TestCase
    func test_get_working_directory(): Unit {
        let wd = getWorkingDirectory()
        @Assert(wd.toString().size > 0)
    }

    @TestCase
    func test_get_home_directory(): Unit {
        let hd = getHomeDirectory()
        @Assert(hd.toString().size > 0)
    }

    @TestCase
    func test_get_temp_directory(): Unit {
        let td = getTempDirectory()
        @Assert(td.toString().size > 0)
    }

    @TestCase
    func test_get_command(): Unit {
        // Should not throw
        let cmd = getCommand()
        @Assert(cmd.size > 0)
    }

    @TestCase
    func test_get_command_line(): Unit {
        let cl = getCommandLine()
        @Assert(cl.size > 0)
    }

    @TestCase
    func test_get_variables(): Unit {
        let vars = getVariables()
        @Assert(vars.size > 0)
    }

    @TestCase
    func test_get_std_out(): Unit {
        let out = getStdOut()
        out.flush()
        @Assert(true)
    }

    @TestCase
    func test_get_std_err(): Unit {
        let err = getStdErr()
        err.flush()
        @Assert(true)
    }

    @TestCase
    func test_console_writer_write_string(): Unit {
        let out = getStdOut()
        out.write("test string")
        out.flush()
        @Assert(true)
    }

    @TestCase
    func test_console_writer_write_int64(): Unit {
        let out = getStdOut()
        out.write(42)
        out.flush()
        @Assert(true)
    }

    @TestCase
    func test_console_writer_write_uint64(): Unit {
        let out = getStdOut()
        out.write(99u64)
        out.flush()
        @Assert(true)
    }

    @TestCase
    func test_console_writer_write_float64(): Unit {
        let out = getStdOut()
        out.write(3.14)
        out.flush()
        @Assert(true)
    }

    @TestCase
    func test_console_writer_write_bool(): Unit {
        let out = getStdOut()
        out.write(true)
        out.flush()
        @Assert(true)
    }

    @TestCase
    func test_console_writer_writeln_string(): Unit {
        let out = getStdOut()
        out.writeln("hello world")
        out.flush()
        @Assert(true)
    }

    @TestCase
    func test_console_writer_writeln_int64(): Unit {
        let out = getStdOut()
        out.writeln(123)
        out.flush()
        @Assert(true)
    }

    @TestCase
    func test_console_writer_write_empty_string(): Unit {
        let out = getStdOut()
        out.write("")
        out.flush()
        @Assert(true)
    }

    @TestCase
    func test_console_writer_write_rune(): Unit {
        let out = getStdOut()
        out.write(r'X')
        out.flush()
        @Assert(true)
    }

    @TestCase
    func test_console_writer_writeln_rune(): Unit {
        let out = getStdOut()
        out.writeln(r'Y')
        out.flush()
        @Assert(true)
    }

    @TestCase
    func test_console_writer_write_float32(): Unit {
        let out = getStdOut()
        out.write(Float32(1.5))
        out.flush()
        @Assert(true)
    }

    @TestCase
    func test_console_writer_write_float16(): Unit {
        let out = getStdOut()
        out.write(Float16(2.0))
        out.flush()
        @Assert(true)
    }

    @TestCase
    func test_console_writer_write_int8(): Unit {
        let out = getStdOut()
        out.write(Int8(5))
        out.flush()
        @Assert(true)
    }

    @TestCase
    func test_console_writer_write_int16(): Unit {
        let out = getStdOut()
        out.write(Int16(1000))
        out.flush()
        @Assert(true)
    }

    @TestCase
    func test_console_writer_write_int32(): Unit {
        let out = getStdOut()
        out.write(Int32(100000))
        out.flush()
        @Assert(true)
    }

    @TestCase
    func test_console_writer_write_uint8(): Unit {
        let out = getStdOut()
        out.write(UInt8(255))
        out.flush()
        @Assert(true)
    }

    @TestCase
    func test_console_writer_write_uint16(): Unit {
        let out = getStdOut()
        out.write(UInt16(65535))
        out.flush()
        @Assert(true)
    }

    @TestCase
    func test_console_writer_write_uint32(): Unit {
        let out = getStdOut()
        out.write(UInt32(100000))
        out.flush()
        @Assert(true)
    }

    @TestCase
    func test_console_writer_writeln_generic(): Unit {
        let out = getStdOut()
        out.writeln<Int64>(42)
        out.flush()
        @Assert(true)
    }

    @TestCase
    func test_console_writer_write_generic(): Unit {
        let out = getStdOut()
        out.write<Int64>(99)
        out.flush()
        @Assert(true)
    }
}

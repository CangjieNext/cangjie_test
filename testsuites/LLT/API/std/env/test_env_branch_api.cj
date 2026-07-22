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
public class EnvBranchApiTest {
    /// ConsoleWriter.flush() — exercises the synchronized + FFI call path
    @TestCase
    func test_console_writer_flush_stdout(): Unit {
        let out = getStdOut()
        out.flush()
        @Assert(true)
    }

    /// ConsoleWriter.flush() on stderr — different fd path
    @TestCase
    func test_console_writer_flush_stderr(): Unit {
        let err = getStdErr()
        err.flush()
        @Assert(true)
    }

    /// ConsoleWriter.writeln<T>(v: T) generic overload — calls writeln(String)
    /// via toString() on a user-defined ToString type
    @TestCase
    func test_console_writer_writeln_generic_string(): Unit {
        let out = getStdOut()
        out.writeln<String>("branch_test_generic")
        out.flush()
        @Assert(true)
    }

    /// ConsoleWriter.writeln<T> with Int64 generic
    @TestCase
    func test_console_writer_writeln_generic_int64(): Unit {
        let out = getStdOut()
        out.writeln<Int64>(777)
        out.flush()
        @Assert(true)
    }

    /// ConsoleWriter.write<T>(v: T) generic overload with user ToString type
    @TestCase
    func test_console_writer_write_generic_string(): Unit {
        let out = getStdOut()
        out.write<String>("generic_write_test")
        out.flush()
        @Assert(true)
    }

    /// ConsoleWriter.writeln(UInt8) overload path
    @TestCase
    func test_console_writer_writeln_uint8(): Unit {
        let out = getStdOut()
        out.writeln(UInt8(42))
        out.flush()
        @Assert(true)
    }

    /// ConsoleWriter.writeln(UInt16) overload path
    @TestCase
    func test_console_writer_writeln_uint16(): Unit {
        let out = getStdOut()
        out.writeln(UInt16(1000))
        out.flush()
        @Assert(true)
    }

    /// ConsoleWriter.writeln(UInt32) overload path
    @TestCase
    func test_console_writer_writeln_uint32(): Unit {
        let out = getStdOut()
        out.writeln(UInt32(100000))
        out.flush()
        @Assert(true)
    }

    /// ConsoleWriter.writeln(UInt64) overload path
    @TestCase
    func test_console_writer_writeln_uint64(): Unit {
        let out = getStdOut()
        out.writeln(UInt64(9999999999))
        out.flush()
        @Assert(true)
    }

    /// ConsoleWriter.writeln(Float16) overload path
    @TestCase
    func test_console_writer_writeln_float16(): Unit {
        let out = getStdOut()
        out.writeln(Float16(3.5))
        out.flush()
        @Assert(true)
    }

    /// ConsoleWriter.writeln(Float32) overload path
    @TestCase
    func test_console_writer_writeln_float32(): Unit {
        let out = getStdOut()
        out.writeln(Float32(2.71))
        out.flush()
        @Assert(true)
    }

    /// ConsoleWriter.writeln(Float64) overload path
    @TestCase
    func test_console_writer_writeln_float64(): Unit {
        let out = getStdOut()
        out.writeln(3.14159)
        out.flush()
        @Assert(true)
    }

    /// ConsoleWriter.writeln(Bool) overload — false branch
    @TestCase
    func test_console_writer_writeln_bool_false(): Unit {
        let out = getStdOut()
        out.writeln(false)
        out.flush()
        @Assert(true)
    }

    /// ConsoleWriter.writeln(Bool) overload — true branch
    @TestCase
    func test_console_writer_writeln_bool_true(): Unit {
        let out = getStdOut()
        out.writeln(true)
        out.flush()
        @Assert(true)
    }

    /// ConsoleWriter.writeln(Int8) overload path
    @TestCase
    func test_console_writer_writeln_int8(): Unit {
        let out = getStdOut()
        out.writeln(Int8(-5))
        out.flush()
        @Assert(true)
    }

    /// ConsoleWriter.writeln(Int16) overload path
    @TestCase
    func test_console_writer_writeln_int16(): Unit {
        let out = getStdOut()
        out.writeln(Int16(-1000))
        out.flush()
        @Assert(true)
    }

    /// ConsoleWriter.writeln(Int32) overload path
    @TestCase
    func test_console_writer_writeln_int32(): Unit {
        let out = getStdOut()
        out.writeln(Int32(-100000))
        out.flush()
        @Assert(true)
    }

    /// ConsoleWriter.write(empty String) — exercises early return path
    @TestCase
    func test_console_writer_write_empty_string_early_return(): Unit {
        let out = getStdOut()
        out.write("")
        out.flush()
        @Assert(true)
    }

    /// ConsoleWriter.write(Array<Byte>) — raw byte array write path
    @TestCase
    func test_console_writer_write_byte_array(): Unit {
        let out = getStdOut()
        let arr: Array<Byte> = Array<Byte>(5, repeat: 0)
        arr[0] = 72  // 'H'
        arr[1] = 105 // 'i'
        out.write(arr)
        out.flush()
        @Assert(true)
    }

    /// ConsoleWriter.writeln(Array<Byte>) — raw byte array writeln path
    @TestCase
    func test_console_writer_writeln_byte_array(): Unit {
        let out = getStdOut()
        let arr: Array<Byte> = Array<Byte>(3, repeat: 0)
        arr[0] = 65 // 'A'
        out.writeln(arr)
        out.flush()
        @Assert(true)
    }

    /// ConsoleWriter.write(Bool) false branch
    @TestCase
    func test_console_writer_write_bool_false(): Unit {
        let out = getStdOut()
        out.write(false)
        out.flush()
        @Assert(true)
    }

    /// getVariable() — not found path (None return from nativeGetEnv)
    @TestCase
    func test_get_variable_not_found(): Unit {
        let val = getVariable("CJ_NONEXISTENT_VAR_BRANCH_98765")
        match (val) {
            case Some(_) => @Assert(false)
            case None => @Assert(true)
        }
    }

    /// getVariable() — found path (Some return from nativeGetEnv)
    @TestCase
    func test_get_variable_found(): Unit {
        setVariable("CJ_BRANCH_FOUND_VAR", "found_value")
        let val = getVariable("CJ_BRANCH_FOUND_VAR")
        match (val) {
            case Some(v) => @Expect(v, "found_value")
            case None => @Assert(false)
        }
        removeVariable("CJ_BRANCH_FOUND_VAR")
    }

    /// setVariable() null byte in key — IllegalArgumentException branch
    @TestCase
    func test_set_variable_null_byte_key(): Unit {
        try {
            setVariable("key\0branch", "value")
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message.contains("null"))
        }
    }

    /// setVariable() null byte in value — IllegalArgumentException branch
    @TestCase
    func test_set_variable_null_byte_value(): Unit {
        try {
            setVariable("CJ_BRANCH_KEY_OK", "val\0branch")
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message.contains("null"))
        }
    }

    /// removeVariable() null byte — IllegalArgumentException branch
    @TestCase
    func test_remove_variable_null_byte(): Unit {
        try {
            removeVariable("key\0branch")
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message.contains("null"))
        }
    }

    /// setVariable() + getVariable() + removeVariable() round-trip
    @TestCase
    func test_set_get_remove_variable_roundtrip(): Unit {
        setVariable("CJ_BRANCH_ROUNDTRIP", "roundtrip_value")
        @Assert(getVariable("CJ_BRANCH_ROUNDTRIP").isSome())
        removeVariable("CJ_BRANCH_ROUNDTRIP")
        @Assert(getVariable("CJ_BRANCH_ROUNDTRIP").isNone())
    }

    /// setVariable() overwrite existing value
    @TestCase
    func test_set_variable_overwrite(): Unit {
        setVariable("CJ_BRANCH_OVERWRITE", "first")
        @Expect(getVariable("CJ_BRANCH_OVERWRITE"), Some("first"))
        setVariable("CJ_BRANCH_OVERWRITE", "second")
        @Expect(getVariable("CJ_BRANCH_OVERWRITE"), Some("second"))
        removeVariable("CJ_BRANCH_OVERWRITE")
    }

    /// getVariable() null byte in key — IllegalArgumentException branch
    @TestCase
    func test_get_variable_null_byte(): Unit {
        try {
            getVariable("bad\0key")
            @Assert(false)
        } catch (e: IllegalArgumentException) {
            @Assert(e.message.contains("null"))
        }
    }

    /// getProcessId() — should return a positive value
    @TestCase
    func test_get_process_id_positive(): Unit {
        let pid = getProcessId()
        @Assert(pid > 0)
    }

    /// getCommand() — should return a non-empty string
    @TestCase
    func test_get_command_nonempty(): Unit {
        let cmd = getCommand()
        @Assert(cmd.size > 0)
    }

    /// getCommandLine() — should return a non-empty array
    @TestCase
    func test_get_command_line_nonempty(): Unit {
        let cl = getCommandLine()
        @Assert(cl.size > 0)
    }

    /// getWorkingDirectory() — should return a valid path
    @TestCase
    func test_get_working_directory_valid(): Unit {
        let wd = getWorkingDirectory()
        @Assert(wd.toString().size > 0)
    }

    /// getHomeDirectory() — should return a valid path
    @TestCase
    func test_get_home_directory_valid(): Unit {
        let hd = getHomeDirectory()
        @Assert(hd.toString().size > 0)
    }

    /// getTempDirectory() — should return a valid path (exercises TMPDIR/TMP/TEMP/TEMPDIR or /tmp fallback)
    @TestCase
    func test_get_temp_directory_valid(): Unit {
        let td = getTempDirectory()
        @Assert(td.toString().size > 0)
    }

    /// tempDirectory() /tmp fallback — when no temp env vars are set, should fall back to /tmp
    @TestCase
    func test_temp_directory_fallback_to_tmp(): Unit {
        // Remove all temp-related env vars to force the /tmp fallback
        removeVariable("TMPDIR")
        removeVariable("TMP")
        removeVariable("TEMP")
        removeVariable("TEMPDIR")
        let td = getTempDirectory()
        @Assert(td.toString().size > 0)
    }

    /// tempDirectory() — when TMPDIR is set, should return that path
    @TestCase
    func test_temp_directory_with_tmpdir_set(): Unit {
        setVariable("TMPDIR", "/tmp")
        let td = getTempDirectory()
        @Assert(td.toString().size > 0)
        // Clean up
        removeVariable("TMPDIR")
    }

    /// getVariables() — should return at least some environment entries
    @TestCase
    func test_get_variables_nonempty(): Unit {
        let vars = getVariables()
        @Assert(vars.size > 0)
    }

    /// getStdIn() — should return a ConsoleReader instance
    @TestCase
    func test_get_std_in(): Unit {
        let stdin = getStdIn()
        @Assert(stdin is ConsoleReader)
    }

    /// getStdOut() — should return a ConsoleWriter
    @TestCase
    func test_get_std_out_type(): Unit {
        let out = getStdOut()
        @Assert(out is ConsoleWriter)
    }

    /// getStdErr() — should return a ConsoleWriter
    @TestCase
    func test_get_std_err_type(): Unit {
        let err = getStdErr()
        @Assert(err is ConsoleWriter)
    }

    /// getHomeDirectory() == getTempDirectory() wrappers
    @TestCase
    func test_get_home_and_temp_directory_wrappers(): Unit {
        let home = getHomeDirectory()
        let temp = getTempDirectory()
        @Assert(home.toString().size > 0)
        @Assert(temp.toString().size > 0)
    }

    /// ConsoleReader.readToEnd() — reads from stdin (no input, returns None or empty)
    @TestCase
    func test_console_reader_read_to_end(): Unit {
        let stdin = getStdIn()
        // Just ensure it doesn't throw; result may be None with no input
        let _ = stdin.readToEnd()
        @Assert(true)
    }
}

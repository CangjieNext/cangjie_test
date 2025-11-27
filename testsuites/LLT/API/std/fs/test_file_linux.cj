/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./utils
// (Linux) EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (Linux) EXEC: %run %run_opt %output %run_utest_opt
import std.fs.*
import std.io.SeekPosition
import std.math.*
import std.runtime.*
import std.regex.*

/*
 * Test description: Test the funcs for File
 * Test class:
 * public class File <: Resource & IOStream
 */
@Test
class FileLinuxTest {
    /*
     * Test description: Test fs::File
     * Test API:
     * public func seek(sp: SeekPosition): Int64
     */
    @TestCase
    func testInputInValidSeek(): Unit {
        let outOfRangeValue = Int64.Max
        var beginSP = SeekPosition.Begin(outOfRangeValue)
        var currentSP = SeekPosition.Current(outOfRangeValue)
        var endSP = SeekPosition.End(outOfRangeValue)
        var fileName = "seek_test.txt"
        var errCount = 0
        var seekPositionArr = [beginSP, currentSP, endSP]
        for (sp in seekPositionArr) {
            try (file = File(fileName, Write)) {
                file.seek(sp)
            } catch (e: FSException) {
                @Assert(Regex("^Failed to seek file `.+`: errno is 22.$").matches(e.message))
                errCount++
            }
        }
        try (file = File(fileName, Write)) {
            file.close()
            file.seek(Begin(0))
        } catch (e: FSException) {
            @Assert(Regex("^The file `.+` can not seek.$").matches(e.message))
            errCount++
        }
        remove(fileName)
        @Expect(errCount,seekPositionArr.size+1)
    }
    @TestCase
    func fileTooLong(): Unit {
        var countError = 0
        try {
            var oriFileName = "./aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
                "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.txt"
            let file = File(oriFileName, Write)
        } catch (e: FSException) {
            @Assert(Regex("^Failed to open the file `.+`. File name too long.$").matches(e.message))
            countError++
        }
        @Expect(countError,1)
    }
}

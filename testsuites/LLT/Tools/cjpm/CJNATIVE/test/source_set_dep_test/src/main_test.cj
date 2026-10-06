package testapp

internal import std.unittest.*
import std.unittest.testmacro.*
import cmp.doubleValue

@Test
public class SourceSetDepTest {
    @TestCase
    func testDoubleValueFromSourceSetDep(): Unit {
        @Assert(doubleValue(), 200)
    }
}

package cj

@JavaImpl
public class CjExe <: Exe {

    public func PrintString1(s: String): Unit {
        println(s)
        PrintString("String from cj to JavaMirror super call")
        PrintString(s)
    }

    public init(doTest: Bool) {
        if (!doTest) { return }
        PrintString1("String from cj to cj")
        print("=== Java ===\n", flush: true)
        let exe = Exe()
        exe.PrintString("String from cj to JavaMirror call")
        Exe.PrintStringStatic("String from cj to JavaMirror static call")
        let jb = GetJBase()
        let res = jb.GetArgJString("arg")
        println("GetArgJString(arg): ${res}")
        println("GetJString(): ${jb.GetJString()}")
    }
}


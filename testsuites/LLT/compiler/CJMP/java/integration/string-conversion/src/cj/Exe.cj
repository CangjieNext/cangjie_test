package cj

import java.lang.JObject

@JavaMirror["com.java.lib.Exe"]
public open class Exe {
    public init()
    public static func GetJBase(): JBase
    public static func PrintStringStatic (s: String): Unit
    public  func PrintString(s: String): Unit
}

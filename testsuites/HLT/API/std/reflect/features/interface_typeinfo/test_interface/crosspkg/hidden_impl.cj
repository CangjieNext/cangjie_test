 package crosspkg
public interface IfaceCrossPkg {
    public func tag(): Int64
}
private class HiddenCrossPkg <: IfaceCrossPkg {
    public func tag(): Int64 { return 7 }
    public init() {}
}
public func createHidden(): IfaceCrossPkg {
    return HiddenCrossPkg()
}

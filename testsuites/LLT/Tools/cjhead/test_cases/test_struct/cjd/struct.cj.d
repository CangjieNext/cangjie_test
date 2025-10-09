package test.structDecl



/**
 * Rectangle
 */
public struct Rectangle {
    /**
     * Rectangle::width
     */
    public var width: Int64

    /**
     * Rectangle::width
     */
    public var height: Int64

    /**
     * Rectangle::init
     */
    public init(width: Int64, height: Int64)

    /**
     * Rectangle::area
     */
    public func area(): Int64
}
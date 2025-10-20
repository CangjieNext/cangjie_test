func test(): Unit {
    quote(public func test(): Unit)
    quote(public func test(): Unit {
        return
    })
    quote(public func $name(): $(function.typename) {})
    quote(var str = #"aa"#)
    quote(var s = 'a')
    quote(var s = r'a')
    quote(var s = """
                abc""")
    quote   (\(\))
    quote(\@)
    quote((ovo) \) )
    quote((x))
    quote(\()
    quote( ( \) ) )

    quote(\$(1))

}
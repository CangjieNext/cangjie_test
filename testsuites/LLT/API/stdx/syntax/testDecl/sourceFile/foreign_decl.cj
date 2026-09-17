package foreign_decl

@When[os != "Windows"]
foreign func start(pid: Int32): Int64

@When[os != "Windows"]
foreign {
    func open(name: CString): Int32

    func close(fd: Int32): Unit
}

@When[os == "Windows"]
@Deprecated[ message: "tt", since: "1.3.4" ]
foreign func stop(id: UInt32): Unit

@When[os != "Windows"]
foreign {
    // process
    func read(fd: Int32): Int64
    func write(fd: Int32): Int64
}

@When[os != "Windows"]
foreign {
    @Deprecated[ message: "dd" ]
    func hook(id: Int32): Unit
}

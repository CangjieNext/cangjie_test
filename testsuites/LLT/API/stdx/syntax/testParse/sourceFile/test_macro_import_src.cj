macro package m

macro import p

macro {
    @When[os == "linux"] import p
    import q.*
    import r as s
}

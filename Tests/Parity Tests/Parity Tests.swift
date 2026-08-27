import Parity
import Testing

@Suite
struct `Parity Tests` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
}

extension `Parity Tests`.Unit {

    @Test
    func `Opposite flips parity`() {
        #expect(Parity.even.opposite == .odd)
        #expect(!Parity.odd == .even)
    }

    @Test
    func `Addition follows the Z₂ group`() {
        #expect(Parity.even.adding(.even) == .even)
        #expect(Parity.odd.adding(.odd) == .even)
        #expect(Parity.even.adding(.odd) == .odd)
    }

    @Test
    func `Multiplication is odd only for odd times odd`() {
        #expect(Parity.odd.multiplying(.odd) == .odd)
        #expect(Parity.even.multiplying(.odd) == .even)
        #expect(Parity.even.multiplying(.even) == .even)
    }
}

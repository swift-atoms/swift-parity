import Pair
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
    func `Parity Value typealias resolves through Pair`() {
        let value: Parity.Value<Int> = Pair(.even, 4)
        #expect(value.first == .even)
        #expect(value.second == 4)
    }
}

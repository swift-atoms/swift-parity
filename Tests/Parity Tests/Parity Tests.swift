import Pair
import Parity
import Testing

@Suite
struct `Parity values resolve through pairs` {
    @Suite struct `Parity values resolve through pairs in their public representations` {}
    @Suite struct `No additional parity edge cases are defined` {}
    @Suite struct `No additional parity integration cases are defined` {}
}

extension `Parity values resolve through pairs`.`Parity values resolve through pairs in their public representations` {

    @Test
    func `Parity Value typealias resolves through Pair`() {
        let value: Parity.Value<Int> = Pair(.even, 4)
        #expect(value.first == .even)
        #expect(value.second == 4)
    }
}

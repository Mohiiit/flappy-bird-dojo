use starknet::ContractAddress;

#[derive(Model, Copy, Drop, Serde)]
#[dojo::event] // A model with `dojo::event` is able to be emitted with the `emit!` macro.
struct Game {
    #[key]
    id: u32, 
    player: ContractAddress,
    score: u32
}

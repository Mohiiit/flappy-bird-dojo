use starknet::ContractAddress;

#[derive(Model, Copy, Drop, Serde)]
#[dojo::event]
struct Game {
    #[key]
    id: u32, 
    player: ContractAddress,
    score: u32,
    state:u32
}







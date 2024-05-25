use starknet::ContractAddress;

#[derive(Model, Copy, Drop, Serde)]
#[dojo::event]
struct Player {
    #[key]
    address:ContractAddress,
    score1: u32, 
    score2: u32,
    score3: u32
}
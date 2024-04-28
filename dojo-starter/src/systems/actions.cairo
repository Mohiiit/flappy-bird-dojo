use dojo_starter::models::moves::Direction;
use dojo_starter::models::position::Position;


var next_id : felt = 0; 

// define the interface
#[dojo::interface]
trait IActions {
    fn startGame();
}

// dojo decorator
#[dojo::contract]
mod actions {
    use super::{IActions, next_position};
    use starknet::{ContractAddress, get_caller_address};
    use dojo_starter::models::{Game::{ContractAddress, felt}};

    #[abi(embed_v0)]
    impl ActionsImpl of IActions<ContractState> {
        fn startGame(world: IWorldDispatcher) ->(Game){
            let player = get_caller_address();
            // create a new object of Game and get the unique Id of the Game and return
            next_id = next_id + 1
            let new_game : Game = Game(next_id, player, 0); 
            return new_game;
        }
    }
}


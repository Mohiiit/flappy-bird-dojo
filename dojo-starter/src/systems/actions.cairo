use dojo_starter::models::moves::Direction;
use dojo_starter::models::position::Position;

// define the interface
#[dojo::interface]
trait IActions {
    fn start_game();
}

// dojo decorator
#[dojo::contract]
mod actions {
    use super::{IActions, next_position};
    use starknet::{ContractAddress, get_caller_address};
    use dojo_starter::models::{Game::{ContractAddress, u32}};

    #[abi(embed_v0)]
    impl ActionsImpl of IActions<ContractState> {
        fn start_game(world: IWorldDispatcher) ->(Game){
            let player = get_caller_address();
            // create a new object of Game and get the unique Id of the Game and return
            let game_id = world.uuid();
            let new_game : Game = Game(game_id, player, 0); 
            return new_game;
        }
    }
}


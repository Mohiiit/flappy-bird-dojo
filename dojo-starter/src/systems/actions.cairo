use dojo_starter::models::game::Game;

// define the interface
#[dojo::interface]
trait IActions {
    fn start_game(world:IWorldDispatcher) -> Game;
    fn end_game(game:Game);
}

// dojo decorator
#[dojo::contract]
mod actions {
    use super::{IActions};
    use starknet::{ContractAddress, get_caller_address};
    use dojo_starter::models::game::Game;

    #[abi(embed_v0)]
    impl ActionsImpl of IActions<ContractState> {
        fn start_game(world: IWorldDispatcher) ->Game{
            let player = get_caller_address();
            // create a new object of Game and get the unique Id of the Game and return
            let game_id = world.uuid();
            let new_game : Game = Game{id: game_id, player: player, score: 0, state: GameStage::InProgress}; 
            return new_game;
        }
        fn end_game(game: Game) {
            game::state = GameStage::Over;
        }
    }
}


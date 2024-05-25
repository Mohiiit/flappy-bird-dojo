use dojo_starter::models::game::Game;
// define the interface
#[dojo::interface]
trait IActions {
    fn start_game() -> Game;
    fn end_game(id:u32, score:u32);
    fn get_high_scores(); 
}

// dojo decorator
#[dojo::contract]
mod actions {
    use super::{IActions};
    use starknet::{ContractAddress, get_caller_address};
    use dojo_starter::models::game::Game;
    use dojo_starter::models::highScore::{HighScores,HighScoreTrait};

    #[abi(embed_v0)]
    impl ActionsImpl of IActions<ContractState> {
        fn start_game(world: IWorldDispatcher) ->Game{
            let player = get_caller_address();
            // create a new object of Game and get the unique Id of the Game and return
            let game_id = world.uuid();
            let new_game : Game = Game{id: game_id, player: player, score: 0, state: 0}; 
            return new_game;
        }
        fn end_game(world: IWorldDispatcher, id: u32, score: u32) {
            let mut game = get!(world, id, (Game));
            game.state = 1;
            game.score = score;
            let mut highScores = get!(world, 0, (HighScores));
            let res = HighScoreTrait::set_high_score(highScores:highScores, score: game.score,player : game.player);
            set!(world, (game));
            // set!(world, (res));
        }
        fn get_high_scores(world:IWorldDispatcher){
            
        }
    }
    #[generate_trait]
    impl Private of PrivateTrait {

    }
}



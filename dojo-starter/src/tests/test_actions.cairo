#[cfg(test)]
mod tests {
    // use super::*;
    use starknet::ContractAddress;
    use dojo::world::IWorldDispatcher;
    use dojo::test_utils::{spawn_test_world, deploy_contract};
    use dojo_starter::models::game::{Game, game};
    use dojo_starter::{
        systems::{actions::{actions, IActionsDispatcher, IActionsDispatcherTrait}}
    };

    #[test]
    #[available_gas(30000000)]
    fn test_start_game() {
        // Setup
        let caller = starknet::contract_address_const::<0x0>();
        let mut models = array![game::TEST_CLASS_HASH];
        let world = spawn_test_world(models);
        let contract_address = world
            .deploy_contract("salt", actions::TEST_CLASS_HASH.try_into().unwrap());
        let actions_system = IActionsDispatcher { contract_address };

        // Call start_game
        let game = actions_system.start_game();

        // Assert that the returned game has the expected properties
        assert_eq!(game.player, caller);
        assert_eq!(game.score, 0);
    }
}

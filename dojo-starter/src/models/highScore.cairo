use starknet::ContractAddress;
#[derive(Model, Copy, Drop, Serde)]
#[dojo::event]
struct HighScores {
    #[key]
    seed:u32,
    score1: ScoreToPlayerMapping,
    score2: ScoreToPlayerMapping,
    score3: ScoreToPlayerMapping,
    score4: ScoreToPlayerMapping,
    score5: ScoreToPlayerMapping,
    score6: ScoreToPlayerMapping,
    score7: ScoreToPlayerMapping,
    score8: ScoreToPlayerMapping,
    score9: ScoreToPlayerMapping,
    score10: ScoreToPlayerMapping
}
#[derive(Model, Copy, Drop, Serde)]
struct ScoreToPlayerMapping {
    score : u32,
    #[key]
    player: ContractAddress
}

#[generate_trait]
impl HighScoreImpl of HighScoreTrait {
    #[inline(always)]
    fn set_high_score(highScores: HighScores, score:u32, player:ContractAddress) -> bool{
        true
    }
}
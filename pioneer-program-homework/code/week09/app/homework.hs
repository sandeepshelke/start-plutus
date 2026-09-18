{-# LANGUAGE OverloadedStrings #-}
module Example where

import           Language.Marlowe.Extended

main :: IO ()
main = print . pretty $ contract "P0" "P1" "P2" $ Constant 50


{- Define a contract, Close is the simplest contract which just ends the contract straight away
-}

choiceId :: Party -> ChoiceId
choiceId p = ChoiceId "Winner" p

contract :: Party -> Party -> Party ->  Value -> Contract
contract alice bob charlie deposit =
    When
      [Case (Deposit charlie charlie ada $ AddValue deposit deposit) $
        When
        [ f charlie alice bob
        , f charlie bob alice
        ]
        20 Close
      ]
      10 Close

    where
      f :: Party -> Party -> Party -> Case
      f p0 p1 p2 =
        Case
            (Deposit p1 p1 ada deposit)
            (When
                [Case
                    (Deposit p2 p2 ada deposit )
                    (When
                        [Case
                            (Choice (choiceId p0) [Bound 1 2] )
                            (If
                                (ValueEQ (ChoiceValue $ choiceId p0) (Constant 1) )
                                (Pay bob (Account alice) ada deposit Close )
                                (Pay alice (Account bob) ada deposit Close )
                            )]
                        40
                        (Pay p0 (Account alice) ada deposit $
                         Pay p0 (Account bob) ada deposit
                         Close )
                    )]
                30 Close
            )

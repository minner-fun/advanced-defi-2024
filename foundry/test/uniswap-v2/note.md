forge test --fork-url $FORK_URL --mp test\\uniswap-v2\\UniswapV2SwapAmounts.test.sol --mt test_getAmountsOut -vvv


forge test --fork-url $FORK_URL --mp test/uniswap-v2/exercises/UniswapV2Swap.test.sol --mt test_swapExactTokensForTokens  -vvv
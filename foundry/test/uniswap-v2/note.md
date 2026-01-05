forge test --fork-url $FORK_URL --mp test/uniswap-v2/UniswapV2SwapAmounts.test.sol --mt test_getAmountsOut -vvv


forge test --fork-url $FORK_URL --mp test/uniswap-v2/exercises/UniswapV2Swap.test.sol --mt test_swapExactTokensForTokens  -vvv


cast call 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D "factory()(address)" --rpc-url $FORK_URL
直接读取链上的合约的方法，cast是和forge等一套的命令，来自于foundry
forge test --fork-url $FORK_URL --mp test/uniswap-v2/UniswapV2SwapAmounts.test.sol --mt test_getAmountsOut -vvv


forge test --fork-url $FORK_URL --mp test/uniswap-v2/exercises/UniswapV2Swap.test.sol --mt test_swapExactTokensForTokens  -vvv

forge test --fork-url $FORK_URL --mp test/uniswap-v2/exercises/UniswapV2Arb2.test.sol  -vvv

cast call 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D "factory()(address)" --rpc-url $FORK_URL
直接读取链上的合约的方法，cast是和forge等一套的命令，来自于foundry

skip
skip(x)：让 block.timestamp 增加 x 秒（相对跳时）。
```solidity
skip(MIN_WAIT + 1);
```

assertApproxEqAbs 判断绝对误差
```solidity
assertApproxEqAbs(twap0, twap1, 1, "ETH TWAP");
```
twap0与twap1的误差的绝对值小于1
用法
签名（常用）：assertApproxEqAbs(uint256 a, uint256 b, uint256 maxDelta, string memory err)
语义：断言 ∣a−b∣ ≤ maxDelta，否则测试失败并打印 err

assertGe 大于等于
```solidity
assertGe(twap1, spot, "twap1 < spot");
```
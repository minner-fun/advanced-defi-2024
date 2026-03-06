pragma solidity ^0.8.24;

import {console2, Test} from "forge-std/Test.sol";

import {IUniswapV2Factory} from
    "../../../src/interfaces/uniswap-v2/IUniswapV2Factory.sol";
import {IUniswapV2Pair} from
    "../../../src/interfaces/uniswap-v2/IUniswapV2Pair.sol";
import {IERC20} from "../../../src/interfaces/IERC20.sol";
import {
    WETH, USDC, USDT, UNISWAP_V2_FACTORY
} from "../../../src/Constants.sol";
import {ERC20} from "../../../src/ERC20.sol";

contract UniswapV2Factory2 is Test {
    IUniswapV2Factory factory = IUniswapV2Factory(UNISWAP_V2_FACTORY);
    ERC20 Minner = new ERC20("minner", "M", 16);

    function test_create_pair() public {
        address pair = factory.createPair(WETH, address(Minner));
        IUniswapV2Pair v2Pair = IUniswapV2Pair(pair);
        address token0 = v2Pair.token0();
        address token1 = v2Pair.token1();
        console2.log("token0: ", token0);
        console2.log("token1: ", token1);

        if (address(Minner) < WETH) {
            assertEq(token0, address(Minner), "token0");
            assertEq(token1, WETH, "token1");
        } else {
            assertEq(token0, WETH, "token0");
            assertEq(token1, address(Minner), "token1");
        }

        uint256 length = factory.allPairsLength();
        assertGt(length, 1, "length is one");

        assertEq(factory.getPair(WETH, address(Minner)), pair, "pair");

        address feeTo = factory.feeTo();
        console2.log("feeTo: ", feeTo);

        address feeToSetter = factory.feeToSetter();
        console2.log("feeToSetter: ", feeToSetter);

        address somePair = factory.allPairs(1445);

        // console2.log('somePair token0: ');
        address somePairToken0 = IUniswapV2Pair(somePair).token0();
        address somePairToken1 = IUniswapV2Pair(somePair).token1();

        // console2.log('somePair token0: ', IUniswapV2Pair(somePair).token0());
        // console2.log('somePair token1: ', IUniswapV2Pair(somePair).token1());

        // IERC20 somePairToken0 = IERC20(somePairToken0);
        console2.log("name: ", ERC20(somePairToken0).name());
        console2.log("symbol: ", ERC20(somePairToken0).symbol());
        console2.log("name: ", ERC20(somePairToken1).name());
        console2.log("symbol: ", ERC20(somePairToken1).symbol());
        (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast) =
            IUniswapV2Pair(somePair).getReserves();
        console2.log("reserve0: ", reserve0);
        console2.log("reserve1: ", reserve1);
        console2.log(blockTimestampLast);
    }
}

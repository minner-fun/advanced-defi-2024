pragma solidity 0.8.24;

import {Test, console2} from "forge-std/Test.sol";

import {
    USDC,
    USDT,
    WETH,
    DAI,
    MKR,
    WBTC,
    UNISWAP_V2_FACTORY
} from "../../../src/Constants.sol";

import {IUniswapV2Factory} from
    "../../../src/interfaces/uniswap-v2/IUniswapV2Factory.sol";
import {IUniswapV2Pair} from
    "../../../src/interfaces/uniswap-v2/IUniswapV2Pair.sol";

contract UniswapV2BaseInfo is Test {
    IUniswapV2Factory private factory = IUniswapV2Factory(UNISWAP_V2_FACTORY);
    // function setUp() public {
    //     // address factory =
    // }

    function test_base_info() public {
        // console2.log("test_base_info");
        // uint length = factory.allPairsLength();
        // console2.log("pairs length: ", length);
        address pair = factory.getPair(DAI, WBTC);
        console2.log("pair: ", pair);
        IUniswapV2Pair pairContract = IUniswapV2Pair(pair);
        (uint112 amount0, uint112 amount1, uint32 updatedAt) =
            pairContract.getReserves();
        console2.log("amount0: ", amount0);
        console2.log("amount1: ", amount1);
        console2.log("updatedAt: ", updatedAt);
    }

    function test_all_pairs() public {
        uint256 length = factory.allPairsLength();
        console2.log("pairs length: ", length);
        // for (uint i = 0; i < 10; i++) {
        address pair = factory.allPairs(1);
        console2.log("pair: ", pair);
        IUniswapV2Pair pairContract = IUniswapV2Pair(pair);
        (uint112 amount0, uint112 amount1, uint32 updatedAt) =
            pairContract.getReserves();
        console2.log("amount0: ", amount0);
        console2.log("amount1: ", amount1);
        console2.log("updatedAt: ", updatedAt);
        console2.log("--------------------------------");
        // }
    }
}

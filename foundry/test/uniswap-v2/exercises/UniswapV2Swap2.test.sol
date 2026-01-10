pragma solidity ^0.8.24;

import {cosnole2, Text} from "forge/Test.sol";

import {IUniswapV2Router02} from "../../../src/interfaces/uniswap-v2/IUniswapV2Router02.sol";

import {
    MKR,
    USDC,
    USDT,
    DAI,
    WETH,
    UNISWAP_V2_ROUTER_02
} from "../../../src/Constants.sol";


contract UniswapV2Swap2{

    IUniswapV2Router02 router = IUniswapV2Router02(UNISWAP_V2_ROUTER_02);
    ERC20 usdc = ERC20(USDC);
    ERC20 dai = ERC20(DAI);
    ERC20 mkr = ERC20(MKR);

    function setUp() public {
        
    }

    function test_swap() public {
        address[] memory path = new address[](3);

        path[0] = USDC;
        path[1] = DAI;
        path[2] = MKR;

        uint256[] memory amounts = router.getAmountsOut(1 * 18, path);


    }

}
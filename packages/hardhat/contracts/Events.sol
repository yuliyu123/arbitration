// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./Types.sol";

// errors
error PermissionDenied();
error RouterNotExisted(address);
error RouterAlreadyExisted(address);
error UnsupportedRouter(address);
error TokenNotExisted(address);
error WrongFeeSetting(uint16 fee);
error DexAdapterNotExisted(DEXS);
error QuoteTokenAlreadyExisted(address);
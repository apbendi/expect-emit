// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

interface DumbEmitterEvents {
    event EmittedEvent(uint256 indexed topic1, uint256 indexed topic2, uint256 indexed topic3, address other);
}

contract DumbEmitter is DumbEmitterEvents {

    function emitEvent(
        uint256 _topic1,
        uint256 _topic2,
        uint256 _topic3,
        address _other
    ) public {
        emit EmittedEvent(_topic1, _topic2, _topic3, _other);
    }
}

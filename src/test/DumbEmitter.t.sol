// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import './EmitExpecter.sol';
import '../DumbEmitter.sol';

contract ContractTest is DumbEmitterEvents, EmitExpecter {

    DumbEmitter dumbEmitter;
    
    function setUp() public {
        dumbEmitter = new DumbEmitter();
    }

    function test_firstTopic(uint256 topic1, uint256 topic2, uint256 topic3, address other) public {
        // vm.expectEmit(true, false, false, false);
        expectEmit(CheckTopic1);
        emit EmittedEvent(topic1, 0, 0, address(0));
        dumbEmitter.emitEvent(topic1, topic2, topic3, other);
    }

    function test_secondTopic(uint256 topic1, uint256 topic2, uint256 topic3, address other) public {
        // vm.expectEmit(false, true, false, false);
        expectEmit(CheckTopic2);
        emit EmittedEvent(0, topic2, 0, address(0));
        dumbEmitter.emitEvent(topic1, topic2, topic3, other);
    }

    function test_firstTwoTopics(uint256 topic1, uint256 topic2, uint256 topic3, address other) public {
        // vm.expectEmit(true, true, false, false);
        expectEmit(CheckTopic1 | CheckTopic2);
        emit EmittedEvent(topic1, topic2, 0, address(0));
        dumbEmitter.emitEvent(topic1, topic2, topic3, other);
    }

    function test_firstThreeTopics(uint256 topic1, uint256 topic2, uint256 topic3, address other) public {
        // vm.expectEmit(true, true, true, false);
        expectEmit(CheckTopic1 | CheckTopic2 | CheckTopic3);
        emit EmittedEvent(topic1, topic2, topic3, address(0));
        dumbEmitter.emitEvent(topic1, topic2, topic3, other);
    }

    function test_firstThreeTopicsAndData(uint256 topic1, uint256 topic2, uint256 topic3, address other) public {
        // vm.expectEmit(true, true, true, true);
        expectEmit(CheckTopic1 | CheckTopic2 | CheckTopic3 | CheckData);
        emit EmittedEvent(topic1, topic2, topic3, other);
        dumbEmitter.emitEvent(topic1, topic2, topic3, other);
    }

    function test_firstAndThirdTopic(uint256 topic1, uint256 topic2, uint256 topic3, address other) public {
        // vm.expectEmit(true, false, true, false);
        expectEmit(CheckTopic1 | CheckTopic3);
        emit EmittedEvent(topic1, 0, topic3, address(0));
        dumbEmitter.emitEvent(topic1, topic2, topic3, other);
    }

    function test_dataOnly(uint256 topic1, uint256 topic2, uint256 topic3, address other) public {
        // vm.expectEmit(false, false, false, true);
        expectEmit(CheckData);
        emit EmittedEvent(0, 0, 0, other);
        dumbEmitter.emitEvent(topic1, topic2, topic3, other);
    }

    function test_noChecks(uint256 topic1, uint256 topic2, uint256 topic3, address other) public {
        //vm.expectEmit(false, false, false, false);
        expectEmit();
        emit EmittedEvent(0, 0, 0, address(0));
        dumbEmitter.emitEvent(topic1, topic2, topic3, other);
    }
}

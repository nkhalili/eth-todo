pragma solidity ^0.5.0;

contract TodoList {

  constructor() public {
    createTask("Sample task");
  }

  // number of tasks
  uint public taskCount = 0;

  // custom type Task
  struct Task {
    uint id;
    string content;
    bool completed;
  }

  event TaskCreated(
    uint id,
    string content,
    bool completed
  );

  // key-value pairs in solidity
  mapping(uint => Task) public tasks;

  // _content will be persisted in memory
  function createTask(string memory _content) public {
    taskCount++;
    tasks[taskCount] = Task(taskCount, _content, false);
    emit TaskCreated(taskCount, _content, false);
  }
}
